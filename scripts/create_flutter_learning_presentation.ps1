param(
    [string]$OutputPath = (Join-Path $PSScriptRoot '..\Flutter_Learning_Path_Presentation.pptx')
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem

$template = Join-Path $PSScriptRoot '..\lib\04.App_UI\02.Flutter_Widgets\02.Stateful_Widget_System\01.Interaction_System\02.Selection_Interaction\01.Checkbox_Selection\02.CheckboxListTile.pptx'
$template = (Resolve-Path -LiteralPath $template).Path
$OutputPath = [IO.Path]::GetFullPath($OutputPath)

$slides = @(
    @{ Title = 'Flutter Framework'; Subtitle = 'A structured learning presentation built from this project''s lesson notes'; Bullets = @('From first setup to production-ready app architecture', 'Android | iOS | Web | Windows | macOS | Linux'); Cover = $true },
    @{ Title = 'Course Roadmap'; Bullets = @('1. Flutter Framework Introduction', '2. Development Setup', '3. Flutter Project Structure', '4. App UI and Widgets', '5. App Logic and Full-Stack Foundations') },
    @{ Title = 'What is Flutter?'; Bullets = @('Google UI framework for building multi-platform applications', 'One codebase can target mobile, web, and desktop', 'Uses Dart and its own rendering engine to draw the interface', 'Core principle: Everything is a Widget') },
    @{ Title = 'Why a Single Codebase Matters'; Bullets = @('Share product features and business rules across platforms', 'Keep UI behavior consistent while still reaching native platforms', 'Iterate faster with hot reload and a widget-based UI model', 'Focus development effort on the app, not duplicate implementations') },
    @{ Title = 'Development Setup'; Bullets = @('Supported environments: Windows, macOS, and Linux', 'Install Flutter SDK, Git, PowerShell, and an IDE', 'Configure platform tooling for Android, iOS, web, or desktop', 'Use Flutter CLI to create, inspect, run, and build projects') },
    @{ Title = 'Flutter CLI: Essential Workflow'; Bullets = @('flutter doctor - validate the development environment', 'flutter create - start a new application', 'flutter run - launch and debug on a target device', 'flutter build - create release artifacts for distribution') },
    @{ Title = 'Project Structure at a Glance'; Bullets = @('lib/ contains the Dart source code and main.dart entry point', 'assets/ stores images, fonts, and other bundled resources', 'test/ holds automated tests', 'pubspec.yaml defines dependencies, assets, and project settings', 'Platform folders provide native host configuration') },
    @{ Title = 'The lib/ Folder'; Bullets = @('The main workspace for Flutter application code', 'main.dart starts the app and calls runApp()', 'Organize screens, reusable widgets, models, services, and state', 'Keep feature code grouped so the project remains scalable') },
    @{ Title = 'Everything is a Widget'; Bullets = @('Text, buttons, layouts, screens, and app shells are widgets', 'Widgets are composed together rather than drawn independently', 'A familiar path: MaterialApp > Scaffold > Center > Text', 'This composition model makes UI reusable and predictable') },
    @{ Title = 'Widget Tree'; Bullets = @('Flutter UI is represented as a hierarchy of widgets', 'Parent widgets provide structure and constraints to children', 'Small focused widgets are easier to test and reuse', 'Understanding the tree makes layout and state issues easier to solve') },
    @{ Title = 'Widget Types and State'; Bullets = @('StatelessWidget describes UI that depends only on inputs', 'StatefulWidget supports UI that changes during app use', 'State is rebuilt into the widget tree when data changes', 'Choose the smallest state boundary that solves the interaction') },
    @{ Title = 'Building App UI'; Bullets = @('Start with display widgets: Text, Image, Icon, and cards', 'Use layout widgets: Row, Column, Stack, Container, and Flex', 'Apply themes, color, typography, decoration, and material effects', 'Add scrolling, lists, grids, navigation, dialogs, and animations') },
    @{ Title = 'Navigation and Interaction'; Bullets = @('Navigator manages a stack of screens and routes', 'Named routes and Router APIs support structured navigation', 'Dialogs, sheets, menus, and overlays handle focused interactions', 'Keyboard, focus, gestures, and selections make apps usable') },
    @{ Title = 'App Logic Layer'; Bullets = @('State management connects changing data to the UI', 'Business logic keeps rules and behaviors out of widget code', 'Service layer handles APIs, Firebase, and local persistence', 'Data models define typed application data and serialization') },
    @{ Title = 'State Management Growth Path'; Bullets = @('Begin with setState for local, simple interaction state', 'Use Provider for approachable app-wide state', 'Adopt Riverpod or Bloc for larger, scalable applications', 'Keep state, business rules, and rendering responsibilities separate') },
    @{ Title = 'Layered Architecture'; Bullets = @('UI Layer - widgets, screens, navigation, and presentation', 'Logic Layer - state management and business rules', 'Data Layer - services, repositories, persistence, and models', 'Platform Layer - native integration and platform channels') },
    @{ Title = 'Suggested Learning Sequence'; Bullets = @('Master widgets, layouts, project structure, and navigation', 'Practice StatefulWidget and setState with small features', 'Introduce state-management patterns as apps grow', 'Connect APIs, local storage, data models, and native capabilities') },
    @{ Title = 'Next Step'; Bullets = @('Use the topic folders in lib/ as focused lesson notes', 'Turn each concept into a small Flutter exercise', 'Build one feature at a time, then combine them into real apps', 'Keep this presentation as the map for the full learning journey') }
)

function Escape-Xml([string]$Value) { [Security.SecurityElement]::Escape($Value) }

function New-TextShape([int]$Id, [string]$Name, [int]$X, [int]$Y, [int]$Cx, [int]$Cy, [string[]]$Lines, [int]$Size, [string]$Color, [bool]$Bold = $false) {
    $paragraphs = foreach ($line in $Lines) {
        $text = Escape-Xml $line
        $weight = if ($Bold) { ' b="1"' } else { '' }
        '<a:p><a:r><a:rPr lang="en-US" sz="{0}"{1}><a:solidFill><a:srgbClr val="{2}"/></a:solidFill><a:latin typeface="Aptos"/></a:rPr><a:t>{3}</a:t></a:r><a:endParaRPr lang="en-US"/></a:p>' -f $Size, $weight, $Color, $text
    }
    @"
<p:sp><p:nvSpPr><p:cNvPr id="$Id" name="$Name"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x="$X" y="$Y"/><a:ext cx="$Cx" cy="$Cy"/></a:xfrm><a:prstGeom prst="rect"><a:avLst/></a:prstGeom><a:noFill/><a:ln><a:noFill/></a:ln></p:spPr><p:txBody><a:bodyPr wrap="square"/><a:lstStyle/>$($paragraphs -join '')</p:txBody></p:sp>
"@
}

function New-SlideXml($Slide, [int]$Number) {
    $title = New-TextShape 2 'Title' 720000 510000 7600000 650000 @($Slide.Title) 3000 'FFFFFF' $true
    if ($Slide.Cover) {
        $subtitle = New-TextShape 3 'Subtitle' 720000 1650000 7600000 1500000 @($Slide.Subtitle) 1600 'B9D9FF' $false
        $bullets = New-TextShape 4 'Cover details' 720000 3700000 7600000 1300000 $Slide.Bullets 1700 'FFFFFF' $false
    } else {
        $items = $Slide.Bullets | ForEach-Object { "- $_" }
        $bullets = New-TextShape 3 'Content' 930000 1680000 7100000 4200000 $items 1800 'E7EEF8' $false
        $subtitle = ''
    }
    $footer = New-TextShape 9 'Footer' 720000 6250000 7600000 300000 @("Flutter Learning Path  |  $Number") 950 '8FA9C9' $false
    @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main"><p:cSld><p:bg><p:bgPr><a:solidFill><a:srgbClr val="0A1D37"/></a:solidFill><a:effectLst/></p:bgPr></p:bg><p:spTree><p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr><p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/><a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr><p:sp><p:nvSpPr><p:cNvPr id="8" name="Accent"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr><p:spPr><a:xfrm><a:off x="720000" y="1250000"/><a:ext cx="1450000" cy="70000"/></a:xfrm><a:prstGeom prst="rect"><a:avLst/></a:prstGeom><a:solidFill><a:srgbClr val="28C7FA"/></a:solidFill><a:ln><a:noFill/></a:ln></p:spPr><p:txBody><a:bodyPr/><a:lstStyle/><a:p/></p:txBody></p:sp>$title$subtitle$bullets$footer</p:spTree></p:cSld><p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr></p:sld>
"@
}

$stage = Join-Path ([IO.Path]::GetTempPath()) ("flutter-presentation-" + [guid]::NewGuid())
New-Item -ItemType Directory -Path $stage | Out-Null
try {
    [IO.Compression.ZipFile]::ExtractToDirectory($template, $stage)
    $ppt = Join-Path $stage 'ppt'
    Remove-Item -LiteralPath (Join-Path $ppt 'slides') -Recurse -Force
    New-Item -ItemType Directory -Path (Join-Path $ppt 'slides\_rels') -Force | Out-Null

    $slideIds = for ($i = 0; $i -lt $slides.Count; $i++) { '<p:sldId id="{0}" r:id="rId{1}"/>' -f (256 + $i), (7 + $i) }
    $presentationPath = Join-Path $ppt 'presentation.xml'
    [xml]$presentation = Get-Content -LiteralPath $presentationPath -Raw
    $ns = New-Object Xml.XmlNamespaceManager($presentation.NameTable)
    $ns.AddNamespace('p', 'http://schemas.openxmlformats.org/presentationml/2006/main')
    $sldIdLst = $presentation.SelectSingleNode('//p:sldIdLst', $ns)
    $sldIdLst.InnerXml = $slideIds -join ''
    $presentation.Save($presentationPath)

    $relsPath = Join-Path $ppt '_rels\presentation.xml.rels'
    [xml]$rels = Get-Content -LiteralPath $relsPath -Raw
    $relsNs = New-Object Xml.XmlNamespaceManager($rels.NameTable)
    $relsNs.AddNamespace('r', 'http://schemas.openxmlformats.org/package/2006/relationships')
    $oldSlide = $rels.SelectSingleNode('//r:Relationship[@Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide"]', $relsNs)
    $oldSlide.ParentNode.RemoveChild($oldSlide) | Out-Null
    for ($i = 0; $i -lt $slides.Count; $i++) {
        $relationship = $rels.CreateElement('Relationship', 'http://schemas.openxmlformats.org/package/2006/relationships')
        $relationship.SetAttribute('Id', "rId$($i + 7)")
        $relationship.SetAttribute('Type', 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide')
        $relationship.SetAttribute('Target', "slides/slide$($i + 1).xml")
        $rels.DocumentElement.AppendChild($relationship) | Out-Null
    }
    $rels.Save($relsPath)

    $typesPath = Join-Path $stage '[Content_Types].xml'
    [xml]$types = Get-Content -LiteralPath $typesPath -Raw
    $typesNs = New-Object Xml.XmlNamespaceManager($types.NameTable)
    $typesNs.AddNamespace('t', 'http://schemas.openxmlformats.org/package/2006/content-types')
    $oldType = $types.SelectSingleNode('//t:Override[@PartName="/ppt/slides/slide1.xml"]', $typesNs)
    $oldType.ParentNode.RemoveChild($oldType) | Out-Null
    for ($i = 0; $i -lt $slides.Count; $i++) {
        $override = $types.CreateElement('Override', 'http://schemas.openxmlformats.org/package/2006/content-types')
        $override.SetAttribute('PartName', "/ppt/slides/slide$($i + 1).xml")
        $override.SetAttribute('ContentType', 'application/vnd.openxmlformats-officedocument.presentationml.slide+xml')
        $types.DocumentElement.AppendChild($override) | Out-Null
    }
    $types.Save($typesPath)

    for ($i = 0; $i -lt $slides.Count; $i++) {
        $number = $i + 1
        [IO.File]::WriteAllText((Join-Path $ppt "slides\slide$number.xml"), (New-SlideXml $slides[$i] $number), [Text.UTF8Encoding]::new($false))
        $relationshipXml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout" Target="../slideLayouts/slideLayout1.xml"/></Relationships>'
        [IO.File]::WriteAllText((Join-Path $ppt "slides\_rels\slide$number.xml.rels"), $relationshipXml, [Text.UTF8Encoding]::new($false))
    }

    if (Test-Path -LiteralPath $OutputPath) { Remove-Item -LiteralPath $OutputPath -Force }
    $archive = [IO.Compression.ZipFile]::Open($OutputPath, [IO.Compression.ZipArchiveMode]::Create)
    try {
        Get-ChildItem -LiteralPath $stage -File -Recurse | ForEach-Object {
            $entryName = $_.FullName.Substring($stage.Length + 1).Replace('\', '/')
            [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $_.FullName, $entryName, [IO.Compression.CompressionLevel]::Optimal) | Out-Null
        }
    }
    finally {
        $archive.Dispose()
    }
    Write-Host "Created $OutputPath with $($slides.Count) slides."
}
finally {
    if (Test-Path -LiteralPath $stage) { Remove-Item -LiteralPath $stage -Recurse -Force }
}
