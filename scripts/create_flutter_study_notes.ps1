param(
    [int]$Chapter,
    [switch]$All,
    [switch]$TemplateOnly,
    [switch]$ReplacePlaceholders,
    [string]$Model = $(if ($env:FLUTTER_NOTE_MODEL) { $env:FLUTTER_NOTE_MODEL } else { 'gpt-4o-mini' }),
    [string]$Endpoint = $(if ($env:FLUTTER_NOTE_ENDPOINT) { $env:FLUTTER_NOTE_ENDPOINT } else { 'https://api.openai.com/v1/chat/completions' }),
    [switch]$WhatIf
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$syllabusPath = Join-Path $root 'Study\flutter_complete_syllabus_final.md'
$studyRoot = Join-Path $root 'Study'

if (-not $All -and -not $Chapter) {
    throw 'Specify -Chapter <global chapter number> or -All.'
}
if (-not $WhatIf -and -not $TemplateOnly -and -not $env:OPENAI_API_KEY) {
    throw 'Set OPENAI_API_KEY before generating notes. Use -WhatIf to preview parsed chapters.'
}

function Get-Chapters {
    $part = $null
    $chapters = @()
    foreach ($line in Get-Content -LiteralPath $syllabusPath -Encoding UTF8) {
        if ($line -match '^##\s+Part\s+(\d+)\s+[\u2014-]\s+(.+)$') {
            $part = [pscustomobject]@{ Number = [int]$matches[1]; Title = $matches[2].Trim() }
        } elseif ($line -match '^###\s+Chapter\s+(\d+)\s+[\u2014-]\s+(.+)$') {
            $chapters += [pscustomobject]@{
                Number = [int]$matches[1]
                Title = $matches[2].Trim()
                PartNumber = $part.Number
                PartTitle = $part.Title
                Topics = [System.Collections.Generic.List[string]]::new()
            }
        } elseif ($line -match '^[-*]\s+(?:\s+)?(.+)$' -and $chapters.Count -gt 0) {
            $chapters[-1].Topics.Add($matches[1].Trim())
        }
    }
    return $chapters
}

function Get-PartFolder([int]$PartNumber) {
    $folder = Get-ChildItem -LiteralPath $studyRoot -Directory |
        Where-Object { $_.Name -match ('^' + $PartNumber.ToString('00') + '\.') } |
        Select-Object -First 1
    if (-not $folder) { throw "No Study folder found for Part $PartNumber." }
    return $folder
}

function Get-NextLocalNumber($folder) {
    $numbers = @(Get-ChildItem -LiteralPath $folder.FullName -Filter '*.docx' -File -ErrorAction SilentlyContinue |
        ForEach-Object { if ($_.Name -match '^(\d+)\.') { [int]$matches[1] } })
    if ($numbers.Count -eq 0) { return 1 }
    return (($numbers | Measure-Object -Maximum).Maximum + 1)
}

    function Get-ExistingLocalNumber($folder, [string]$title) {
        $safeTitle = ($title -replace '[\\/:*?"<>|]', '') -replace '\s+', '_'
        $match = Get-ChildItem -LiteralPath $folder.FullName -Filter "*.$safeTitle.docx" -File -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($match -and $match.Name -match '^(\d+)\.') { return [int]$matches[1] }
        return $null
    }

function Invoke-NoteGeneration($chapter) {
    $topics = $chapter.Topics -join "`n"
    $prompt = @"
Create a complete bilingual Flutter learning note for global Chapter $($chapter.Number): $($chapter.Title).
Part: $($chapter.PartNumber) — $($chapter.PartTitle)
Syllabus topics:
$topics

Return JSON only with this shape:
{
  "partTitleBn": "...",
  "chapterTitleBn": "...",
  "overviewEn": "...",
  "overviewBn": "...",
  "sections": [{"titleEn":"...","titleBn":"...","bodyEn":"...","bodyBn":"...","subsections":[{"titleEn":"...","titleBn":"...","bodyEn":"...","bodyBn":"..."}]}],
  "summaryEn": "...",
  "summaryBn": "..."
}
Cover every syllabus topic in order. Use technically accurate, practical explanations and short Dart/Flutter examples in bodyEn/bodyBn when useful. Do not omit the Bengali fields. Keep the result suitable for a structured Word study note.
"@
    $headers = @{ Authorization = "Bearer $env:OPENAI_API_KEY" }
    $body = @{ model = $Model; temperature = 0.2; response_format = @{ type = 'json_object' }; messages = @(
        @{ role = 'system'; content = 'You write precise English and Bengali Flutter study notes. Return valid JSON only.' },
        @{ role = 'user'; content = $prompt }
    ) } | ConvertTo-Json -Depth 8
    $bodyBytes = [Text.Encoding]::UTF8.GetBytes($body)
    $response = Invoke-RestMethod -Uri $Endpoint -Method Post -Headers $headers -ContentType 'application/json; charset=utf-8' -Body $bodyBytes
    return ($response.choices[0].message.content | ConvertFrom-Json)
}

function Add-Paragraph($document, [string]$text, [string]$style = 'Normal') {
    $paragraph = $document.Paragraphs.Add()
    $paragraph.Style = $style
    $paragraph.Range.Text = $text
    $paragraph.Range.InsertParagraphAfter()
}

function New-NoteDocument($chapter, $content, $folder, [int]$localNumber) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    Add-Type -AssemblyName System.IO.Compression
    $safeTitle = ($chapter.Title -replace '[\\/:*?"<>|]', '') -replace '\s+', '_'
    $output = Join-Path $folder.FullName (('{0:00}.{1}.docx' -f $localNumber, $safeTitle))
    if ((Test-Path $output) -and -not $ReplacePlaceholders) { throw "Refusing to overwrite existing file: $output. Use -ReplacePlaceholders for generated placeholders." }
    if (Test-Path $output) { Remove-Item -LiteralPath $output -Force }

    function Escape-Xml([string]$Value) { [Security.SecurityElement]::Escape($Value) }
    function Add-XmlParagraph([System.Collections.Generic.List[string]]$Items, [string]$Text, [string]$Style) {
        $escaped = Escape-Xml $Text
        if ($Style) {
            $Items.Add('<w:p><w:pPr><w:pStyle w:val="' + $Style + '"/></w:pPr><w:r><w:t xml:space="preserve">' + $escaped + '</w:t></w:r></w:p>')
        } else {
            $Items.Add('<w:p><w:r><w:t xml:space="preserve">' + $escaped + '</w:t></w:r></w:p>')
        }
    }

    $paragraphs = [System.Collections.Generic.List[string]]::new()
    Add-XmlParagraph $paragraphs "Part $($chapter.PartNumber): $($chapter.PartTitle)" 'Title'
    Add-XmlParagraph $paragraphs "Part $($chapter.PartNumber): $($content.partTitleBn)" 'Heading1'
    Add-XmlParagraph $paragraphs "Chapter $($chapter.Number): $($chapter.Title)" 'Heading1'
    Add-XmlParagraph $paragraphs "Chapter $($chapter.Number): $($content.chapterTitleBn)" 'Heading1'
    Add-XmlParagraph $paragraphs $content.overviewEn $null
    Add-XmlParagraph $paragraphs $content.overviewBn $null
    $index = 0
    foreach ($section in $content.sections) {
        $index++
        Add-XmlParagraph $paragraphs "$index. $($section.titleEn)" 'Heading2'
        Add-XmlParagraph $paragraphs "$index. $($section.titleBn)" 'Heading2'
        Add-XmlParagraph $paragraphs $section.bodyEn $null
        Add-XmlParagraph $paragraphs $section.bodyBn $null
        if ($section.codeDart) { Add-XmlParagraph $paragraphs $section.codeDart 'NoSpacing' }
        foreach ($subsection in @($section.subsections)) {
            Add-XmlParagraph $paragraphs $subsection.titleEn 'Heading3'
            Add-XmlParagraph $paragraphs $subsection.titleBn 'Heading3'
            Add-XmlParagraph $paragraphs $subsection.bodyEn $null
            Add-XmlParagraph $paragraphs $subsection.bodyBn $null
        }
    }
    Add-XmlParagraph $paragraphs "Chapter $($chapter.Number) Summary" 'Heading2'
    Add-XmlParagraph $paragraphs "Chapter $($chapter.Number): $($content.chapterTitleBn) সারসংক্ষেপ" 'Heading2'
    Add-XmlParagraph $paragraphs $content.summaryEn $null
    Add-XmlParagraph $paragraphs $content.summaryBn $null

    $stage = Join-Path ([IO.Path]::GetTempPath()) ('study-note-' + [guid]::NewGuid())
    New-Item -ItemType Directory -Path (Join-Path $stage 'word\_rels') -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $stage '_rels') -Force | Out-Null
    try {
        $types = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/></Types>'
        $rootRels = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/></Relationships>'
        $docRels = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships" />'
        $document = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:body>' + ($paragraphs -join '') + '<w:sectPr><w:pgSz w:w="12240" w:h="15840"/><w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440"/></w:sectPr></w:body></w:document>'
        [IO.File]::WriteAllText((Join-Path $stage '[Content_Types].xml'), $types, [Text.UTF8Encoding]::new($false))
        [IO.File]::WriteAllText((Join-Path $stage '_rels\.rels'), $rootRels, [Text.UTF8Encoding]::new($false))
        [IO.File]::WriteAllText((Join-Path $stage 'word\_rels\document.xml.rels'), $docRels, [Text.UTF8Encoding]::new($false))
        [IO.File]::WriteAllText((Join-Path $stage 'word\document.xml'), $document, [Text.UTF8Encoding]::new($false))
        $archive = [IO.Compression.ZipFile]::Open($output, [IO.Compression.ZipArchiveMode]::Create)
        try {
            Get-ChildItem -LiteralPath $stage -File -Recurse | ForEach-Object {
                $entryName = $_.FullName.Substring($stage.Length + 1).Replace('\', '/')
                [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $_.FullName, $entryName, [IO.Compression.CompressionLevel]::Optimal) | Out-Null
            }
        } finally { $archive.Dispose() }
        Write-Host "Created $output"
    } finally { if (Test-Path -LiteralPath $stage) { Remove-Item -LiteralPath $stage -Recurse -Force } }
}

function New-TemplateDocument($chapter, $folder, [int]$localNumber) {
    $safeTitle = ($chapter.Title -replace '[\\/:*?"<>|]', '') -replace '\s+', '_'
    $output = Join-Path $folder.FullName (('{0:00}.{1}.docx' -f $localNumber, $safeTitle))
    if (Test-Path $output) { return }
    $temporaryMarkdown = [IO.Path]::ChangeExtension($output, '.md')
    $lines = @(
        "# Part $($chapter.PartNumber): $($chapter.PartTitle)",
        "# Part $($chapter.PartNumber): [Bangla part title]",
        "## Chapter $($chapter.Number): $($chapter.Title)",
        "## Chapter $($chapter.Number): [Bangla chapter title]",
        '', '[English overview]', '', '[Bangla overview]', ''
    )
    $index = 0
    foreach ($topic in $chapter.Topics) {
        $index++
        $lines += "### $index. $topic"
        $lines += "### $index. [Bangla topic title]"
        $lines += ''
        $lines += '[English explanation]'
        $lines += ''
        $lines += '[Bangla explanation]'
        $lines += ''
    }
    $lines += "### Chapter $($chapter.Number) Summary"
    $lines += "### Chapter $($chapter.Number) [Bangla summary title]"
    $lines += ''
    $lines += '[English summary]'
    $lines += ''
    $lines += '[Bangla summary]'
    Set-Content -LiteralPath $temporaryMarkdown -Value $lines -Encoding UTF8
    try {
        & (Join-Path $PSScriptRoot 'convert_study_templates_to_docx.ps1') -StudyPath $folder.FullName
    } finally {
        if (Test-Path -LiteralPath $temporaryMarkdown) { Remove-Item -LiteralPath $temporaryMarkdown -Force }
    }
}

$chapters = @(Get-Chapters)
$selected = if ($All) { $chapters } else { @($chapters | Where-Object Number -eq $Chapter) }
if ($selected.Count -eq 0) { throw 'No matching chapter found in the syllabus.' }
$nextNumbers = @{}
$processedByPart = @{}
foreach ($item in $selected) {
    $folder = Get-PartFolder $item.PartNumber
    if (-not $processedByPart.ContainsKey($folder.FullName)) {
        $processedByPart[$folder.FullName] = 0
    }
    if ($All -and $processedByPart[$folder.FullName] -lt (Get-ChildItem -LiteralPath $folder.FullName -Filter '*.docx' -File).Count) {
        $processedByPart[$folder.FullName]++
        continue
    }
    $processedByPart[$folder.FullName]++
    $existingNumber = Get-ExistingLocalNumber $folder $item.Title
    if ($ReplacePlaceholders -and $existingNumber) {
        $localNumber = $existingNumber
    } elseif (-not $nextNumbers.ContainsKey($folder.FullName)) {
        $nextNumbers[$folder.FullName] = Get-NextLocalNumber $folder
        $localNumber = $nextNumbers[$folder.FullName]
        $nextNumbers[$folder.FullName]++
    } else {
        $localNumber = $nextNumbers[$folder.FullName]
        $nextNumbers[$folder.FullName]++
    }
    Write-Host ("Chapter {0} -> {1:00}.{2}.docx" -f $item.Number, $localNumber, $item.Title)
    if (-not $WhatIf) {
        if ($TemplateOnly) { New-TemplateDocument $item $folder $localNumber }
        else { New-NoteDocument $item (Invoke-NoteGeneration $item) $folder $localNumber }
    }
}