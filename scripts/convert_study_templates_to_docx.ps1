param(
    [string]$StudyPath = (Join-Path $PSScriptRoot '..\Study'),
    [switch]$RemoveMarkdown
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
Add-Type -AssemblyName System.IO.Compression

function Escape-Xml([string]$Value) {
    return [Security.SecurityElement]::Escape($Value)
}

function New-ParagraphXml([string]$Text, [string]$Style) {
    $escaped = Escape-Xml $Text
    if ($Style) {
        return '<w:p><w:pPr><w:pStyle w:val="' + $Style + '"/></w:pPr><w:r><w:t xml:space="preserve">' + $escaped + '</w:t></w:r></w:p>'
    }
    return '<w:p><w:r><w:t xml:space="preserve">' + $escaped + '</w:t></w:r></w:p>'
}

function Convert-MarkdownToDocx([string]$MarkdownPath) {
    $outputPath = [IO.Path]::ChangeExtension($MarkdownPath, '.docx')
    if (Test-Path -LiteralPath $outputPath) {
        Write-Host "Skipped existing $outputPath"
        return
    }

    $paragraphs = foreach ($line in Get-Content -LiteralPath $MarkdownPath -Encoding UTF8) {
        if ([string]::IsNullOrWhiteSpace($line)) {
            New-ParagraphXml '' $null
        } elseif ($line -match '^#\s+(.+)$') {
            New-ParagraphXml $matches[1] 'Title'
        } elseif ($line -match '^##\s+(.+)$') {
            New-ParagraphXml $matches[1] 'Heading1'
        } elseif ($line -match '^###\s+(.+)$') {
            New-ParagraphXml $matches[1] 'Heading2'
        } else {
            New-ParagraphXml $line $null
        }
    }

    $stage = Join-Path ([IO.Path]::GetTempPath()) ('study-docx-' + [guid]::NewGuid())
    New-Item -ItemType Directory -Path (Join-Path $stage 'word\_rels') -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $stage '_rels') -Force | Out-Null
    try {
        $contentTypes = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/></Types>
'@
        $rootRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/></Relationships>
'@
        $documentRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships" />
'@
        $document = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:body>' + ($paragraphs -join '') + '<w:sectPr><w:pgSz w:w="12240" w:h="15840"/><w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440"/></w:sectPr></w:body></w:document>'

        [IO.File]::WriteAllText((Join-Path $stage '[Content_Types].xml'), $contentTypes, [Text.UTF8Encoding]::new($false))
        [IO.File]::WriteAllText((Join-Path $stage '_rels\.rels'), $rootRels, [Text.UTF8Encoding]::new($false))
        [IO.File]::WriteAllText((Join-Path $stage 'word\_rels\document.xml.rels'), $documentRels, [Text.UTF8Encoding]::new($false))
        [IO.File]::WriteAllText((Join-Path $stage 'word\document.xml'), $document, [Text.UTF8Encoding]::new($false))

        $archive = [IO.Compression.ZipFile]::Open($outputPath, [IO.Compression.ZipArchiveMode]::Create)
        try {
            Get-ChildItem -LiteralPath $stage -File -Recurse | ForEach-Object {
                $entryName = $_.FullName.Substring($stage.Length + 1).Replace('\', '/')
                [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $_.FullName, $entryName, [IO.Compression.CompressionLevel]::Optimal) | Out-Null
            }
        } finally {
            $archive.Dispose()
        }
        Write-Host "Created $outputPath"
        if ($RemoveMarkdown) { Remove-Item -LiteralPath $MarkdownPath -Force }
    } finally {
        if (Test-Path -LiteralPath $stage) { Remove-Item -LiteralPath $stage -Recurse -Force }
    }
}

$resolvedStudyPath = (Resolve-Path -LiteralPath $StudyPath).Path
Get-ChildItem -LiteralPath $resolvedStudyPath -Filter '*.md' -File -Recurse |
    Where-Object { $_.Name -match '^\d+\..+\.md$' } |
    ForEach-Object { Convert-MarkdownToDocx $_.FullName }
