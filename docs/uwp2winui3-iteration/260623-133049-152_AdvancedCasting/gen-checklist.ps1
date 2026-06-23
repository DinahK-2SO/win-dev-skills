# Generate a corrected checklist.json for AdvancedCasting (ScreenCasting).
# Mirrors Extract-UwpFeatureChecklist.ps1's extraction logic, but fixes two
# sample-specific incompatibilities the instrument cannot handle:
#   1) scenarios are registered via Type.GetType("...") not typeof(...)
#   2) page class names (ScreenCasting.ScenarioNN) != xaml file base names
# Scenario titles are taken verbatim from SampleConfiguration.cs (the live nav).
param(
    [string]$Source = "C:\ado\win-dev-skills-benchmark\agent-benchmark\uwp-samples-standalone\Samples\AdvancedCasting\cs",
    [string]$OutDir = "C:\ado\win-dev-skills-benchmark\agent-benchmark\results\run9\001_score-AdvancedCasting\notes\parity\baseline"
)
$ErrorActionPreference = 'Stop'
$shared = Join-Path (Split-Path -Parent $Source) 'shared'

function Get-Slug([string]$text) {
    $s = ($text -replace '[^A-Za-z0-9]+', '_').Trim('_')
    if ([string]::IsNullOrWhiteSpace($s)) { $s = 'Scenario' }
    return $s
}

$interactiveTypes = @(
    'Button','HyperlinkButton','ToggleButton','RepeatButton','AppBarButton','DropDownButton','SplitButton',
    'CheckBox','RadioButton','RadioButtons','ToggleSwitch','Slider','NumberBox',
    'TextBox','RichEditBox','PasswordBox','AutoSuggestBox','ComboBox','ListBox','ListView','GridView',
    'CalendarDatePicker','DatePicker','TimePicker','CalendarView','ColorPicker','RatingControl',
    'MediaPlayerElement','MediaElement','CaptureElement','Image','WebView','WebView2','InkCanvas',
    'PivotItem','Pivot','TabView','NavigationView','TreeView','Expander','MenuFlyoutItem','CommandBar'
)
$typeAlt = ($interactiveTypes | ForEach-Object { [regex]::Escape($_) }) -join '|'

function Get-PageControls([string]$xamlPath) {
    $controls = @()
    if (-not (Test-Path -LiteralPath $xamlPath)) { return ,$controls }
    $xaml = [System.IO.File]::ReadAllText($xamlPath)
    $xaml = [regex]::Replace($xaml, '(?s)<!--.*?-->', '')
    $rx = [regex]("(?s)<(?<type>$typeAlt)\b(?<attrs>[^>]*?)/?>")
    foreach ($m in $rx.Matches($xaml)) {
        $type  = $m.Groups['type'].Value
        $attrs = $m.Groups['attrs'].Value
        $name  = ([regex]::Match($attrs, 'x:Name\s*=\s*"([^"]+)"')).Groups[1].Value
        $label = ''
        foreach ($la in @('Content','Header','Text','PlaceholderText','Title')) {
            $lm = [regex]::Match($attrs, "$la\s*=\s*`"([^`"]+)`"")
            if ($lm.Success) { $label = $lm.Groups[1].Value; break }
        }
        $events = @()
        foreach ($em in [regex]::Matches($attrs, '(?<ev>[A-Z][A-Za-z]+)\s*=\s*"(?<h>[A-Za-z_][A-Za-z0-9_]*)"')) {
            $ev = $em.Groups['ev'].Value
            if ($ev -in @('Click','Tapped','Toggled','Checked','Unchecked','SelectionChanged','ValueChanged','TextChanged','Loaded','PointerPressed')) {
                $events += $ev
            }
        }
        if ($name -or $label) {
            $controls += [PSCustomObject]@{ name = $name; type = $type; label = $label; events = @($events | Select-Object -Unique) }
        }
    }
    return ,$controls
}

function Get-PageOutputs([string]$xamlPath) {
    $outputs = @()
    if (-not (Test-Path -LiteralPath $xamlPath)) { return ,$outputs }
    $xaml = [System.IO.File]::ReadAllText($xamlPath)
    $xaml = [regex]::Replace($xaml, '(?s)<!--.*?-->', '')
    foreach ($m in [regex]::Matches($xaml, '(?s)<(?<type>TextBlock|TextBox|Run)\b(?<attrs>[^>]*?)/?>')) {
        $name = ([regex]::Match($m.Groups['attrs'].Value, 'x:Name\s*=\s*"([^"]+)"')).Groups[1].Value
        if ($name) { $outputs += [PSCustomObject]@{ name = $name; type = $m.Groups['type'].Value } }
    }
    return ,$outputs
}

$Script:ActionEvents = @('Click', 'Tapped', 'Toggled', 'Checked')
function Get-PageActions($controls) {
    $acts = @()
    foreach ($c in $controls) {
        $hasEvent = @($c.events | Where-Object { $Script:ActionEvents -contains $_ }).Count -gt 0
        $isButton = $c.type -match '(Button|ToggleSwitch)$'
        if (-not ($hasEvent -or $isButton)) { continue }
        $target = if ($c.label) { $c.label } elseif ($c.name) { $c.name } else { '' }
        if (-not $target) { continue }
        $alt = if ($c.label -and $c.name) { $c.name } else { '' }
        $acts += [PSCustomObject]@{ target = $target; alt = $alt; type = $c.type; label = $c.label; name = $c.name; event = (@($c.events) -join '/') }
    }
    return ,$acts
}

# Build class -> xaml path map via x:Class
$classToXaml = @{}
foreach ($f in Get-ChildItem $shared -Filter '*.xaml' -File) {
    $t = [System.IO.File]::ReadAllText($f.FullName)
    $cls = ([regex]::Match($t, 'x:Class\s*=\s*"([^"]+)"')).Groups[1].Value
    if ($cls) { $classToXaml[($cls -split '\.')[-1]] = $f.FullName }
}

# Shared status outputs from MainPage
$sharedOutputs = @()
if ($classToXaml.ContainsKey('MainPage')) {
    $mainText = [System.IO.File]::ReadAllText($classToXaml['MainPage'])
    foreach ($nm in [regex]::Matches($mainText, 'x:Name\s*=\s*"(?<n>StatusBlock|StatusBorder|ScenarioOutput[A-Za-z0-9]*)"')) {
        $sharedOutputs += [PSCustomObject]@{ name = $nm.Groups['n'].Value; type = 'TextBlock'; shared = $true }
    }
}

# The real 6-scenario list (DevicePicker branch) from SampleConfiguration.cs
$scenarioDefs = @(
    [PSCustomObject]@{ Title = "1 - Media Element Casting 101";              Class = "Scenario01" }
    [PSCustomObject]@{ Title = "2 - Casting APIs and a Custom Cast Button";  Class = "Scenario02" }
    [PSCustomObject]@{ Title = "3 - DIAL Sender Universal Windows app";      Class = "Scenario03" }
    [PSCustomObject]@{ Title = "4 - DIAL Receiver Windows Universal app";    Class = "Scenario04" }
    [PSCustomObject]@{ Title = "5 - Multi-View Media Application";           Class = "Scenario05" }
    [PSCustomObject]@{ Title = "6 - Combine Casting Methods";                Class = "Scenario06" }
)

$scenarios = @()
$n = 0
foreach ($s in $scenarioDefs) {
    $n++
    $xaml = $classToXaml[$s.Class]
    $controls = Get-PageControls $xaml
    $scenarios += [PSCustomObject]@{
        number = $n; title = $s.Title; class = $s.Class; slug = (Get-Slug $s.Title)
        xaml = $xaml; controls = $controls
        actions = (Get-PageActions $controls)
        outputs = @(@(Get-PageOutputs $xaml) + $sharedOutputs)
    }
}

$checklist = [ordered]@{
    featureName = 'ScreenCasting'
    source      = $Source
    generated   = (Get-Date).ToString('o')
    scenarios   = @($scenarios | ForEach-Object {
        [ordered]@{
            number   = $_.number
            title    = $_.title
            class    = $_.class
            slug     = $_.slug
            screenshot = ('{0:00}_{1}.png' -f $_.number, $_.slug)
            controls = @($_.controls)
            actions  = @($_.actions)
            outputs  = @($_.outputs)
        }
    })
}
if (-not (Test-Path $OutDir)) { New-Item -ItemType Directory -Force -Path $OutDir | Out-Null }
$jsonPath = Join-Path $OutDir 'checklist.json'
$checklist | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $jsonPath -Encoding UTF8

Write-Host "=== CORRECTED CHECKLIST ==="
foreach ($s in $scenarios) {
    Write-Host ("  {0,2}. {1}  ({2} control(s), {3} action(s))" -f $s.number, $s.title, $s.controls.Count, @($s.actions).Count)
}
Write-Host "checklist.json -> $jsonPath"
