<#
.SYNOPSIS
Fetch a single anchored section from MIGRATION-PATTERNS.md.

.DESCRIPTION
Use this instead of opening MIGRATION-PATTERNS.md wholesale — the full file's
concentrated API-name listings have historically tripped the model provider's
content-safety filter. This helper returns only the requested section.

.PARAMETER Anchor
Anchor ID (e.g. 'threading', 'windowing', 'dialogs', 'pickers') OR a heading
slug. If no `<a id>` anchor matches, the script falls back to matching a section
heading by slug (e.g. 'manifest' resolves '### Manifest migration checklist').
On a miss it prints every available anchor and heading slug so you can retry
without opening the file wholesale.

.PARAMETER PatternsPath
Optional path to MIGRATION-PATTERNS.md. Defaults to the sibling file under
the winui-uwp-migration skill folder.

.OUTPUTS
The section text (heading + content up to the next ## heading) on stdout.
Exits 0 on success, 1 if the anchor is not found.

.EXAMPLE
.\Get-MigrationPattern.ps1 -Anchor threading
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Anchor,
    [string]$PatternsPath
)

$ErrorActionPreference = 'Stop'

if (-not $PatternsPath) {
    $PatternsPath = Join-Path (Split-Path -Parent $PSScriptRoot) 'MIGRATION-PATTERNS.md'
}
if (-not (Test-Path -LiteralPath $PatternsPath)) {
    Write-Error "MIGRATION-PATTERNS.md not found at $PatternsPath"
    exit 1
}

$lines = Get-Content -LiteralPath $PatternsPath

function Get-Slug([string]$text) {
    $t = $text -replace '<a\s+id="[^"]*"\s*>', ''
    $t = $t -replace '`', ''
    $t = $t.ToLowerInvariant()
    $t = $t -replace '[^a-z0-9]+', '-'
    return $t.Trim('-')
}

$anchorPattern = "<a\s+id=`"$([regex]::Escape($Anchor))`""

# 1) Exact <a id> anchor match (primary, backward-compatible path).
$startIdx = -1
$startIsHeading = $false
$startLevel = 2
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match $anchorPattern) {
        $startIdx = $i
        break
    }
}

# 2) Fallback: match a ##/### heading by slug so anchorless sections
#    (manifest checklist, appxmanifest, WUI analyzer, csproj cheat-sheet, etc.)
#    are still reachable and near-miss guesses resolve.
if ($startIdx -lt 0) {
    $wanted = Get-Slug $Anchor
    $exact = -1; $partial = -1
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match '^(#{2,4})\s+(.*)$') {
            $slug = Get-Slug $Matches[2]
            if ($slug -eq $wanted) { $exact = $i; break }
            if ($partial -lt 0 -and ($slug -like "*$wanted*")) { $partial = $i }
        }
    }
    $hit = if ($exact -ge 0) { $exact } else { $partial }
    if ($hit -ge 0) {
        $startIdx = $hit
        $startIsHeading = $true
        if ($lines[$hit] -match '^(#{2,4})\s') { $startLevel = $Matches[1].Length }
    }
}

if ($startIdx -lt 0) {
    $anchors = foreach ($l in $lines) { if ($l -match '<a\s+id="([^"]+)"') { $Matches[1] } }
    $headings = foreach ($l in $lines) { if ($l -match '^(#{2,4})\s+(.*)$') { Get-Slug $Matches[2] } }
    $available = @($anchors + $headings | Where-Object { $_ } | Select-Object -Unique) -join ', '
    Write-Error "Anchor '$Anchor' not found in $PatternsPath. Available anchors/heading slugs: $available"
    exit 1
}

# Walk forward to the end of the section.
$endIdx = $lines.Count - 1
for ($j = $startIdx + 1; $j -lt $lines.Count; $j++) {
    # Stop on next explicit anchor (covers consecutive anchored sections).
    if ($lines[$j] -match '<a\s+id="') {
        $endIdx = $j - 1
        break
    }
    if ($startIsHeading) {
        # Heading-started section: stop at the next heading of equal-or-higher level.
        if ($lines[$j] -match "^#{1,$startLevel}\s") {
            $endIdx = $j - 1
            break
        }
    }
    else {
        # Anchored section: stop on the next top-level ## heading.
        if ($lines[$j] -match '^##\s' -and $j -gt $startIdx + 1) {
            $endIdx = $j - 1
            break
        }
    }
}

# Trim trailing blank lines for cleaner output
while ($endIdx -gt $startIdx -and [string]::IsNullOrWhiteSpace($lines[$endIdx])) {
    $endIdx--
}

for ($k = $startIdx; $k -le $endIdx; $k++) {
    Write-Output $lines[$k]
}
