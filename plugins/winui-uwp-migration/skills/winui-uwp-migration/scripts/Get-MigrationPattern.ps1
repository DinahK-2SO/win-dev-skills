<#
.SYNOPSIS
Fetch a single anchored section from MIGRATION-PATTERNS.md.

.DESCRIPTION
Use this instead of opening MIGRATION-PATTERNS.md wholesale — the full file's
concentrated API-name listings have historically tripped the model provider's
content-safety filter. This helper returns only the requested section.

.PARAMETER Anchor
Anchor ID (e.g. 'threading', 'windowing', 'dialogs', 'pickers'). The full
list lives in unsupported-api-inventory.json under each entry's `anchor`.

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

# Collect every explicit anchor id in file order (source of truth for -Anchor).
$availableAnchors = @()
foreach ($line in $lines) {
    if ($line -match '<a\s+id="([^"]+)"') { $availableAnchors += $Matches[1] }
}

$anchorPattern = "<a\s+id=`"$([regex]::Escape($Anchor))`""

$startIdx = -1
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match $anchorPattern) {
        $startIdx = $i
        break
    }
}

# Exact anchor missing: try a unique case-insensitive substring match before failing,
# so a near-miss guess (e.g. 'manifest-checklist' for 'manifest') recovers in one turn.
if ($startIdx -lt 0) {
    $matchesSub = @($availableAnchors | Where-Object { ($_ -like "*$Anchor*") -or ($Anchor -like "*$_*") })
    if ($matchesSub.Count -eq 1) {
        $resolved = $matchesSub[0]
        Write-Warning "Anchor '$Anchor' not found; resolved to unique match '$resolved'."
        $anchorPattern = "<a\s+id=`"$([regex]::Escape($resolved))`""
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -match $anchorPattern) { $startIdx = $i; break }
        }
    }
}

if ($startIdx -lt 0) {
    Write-Error ("Anchor '#$Anchor' not found in $PatternsPath. Available anchors: " + ($availableAnchors -join ', '))
    exit 1
}

# Walk forward: skip the anchor line itself and the heading; collect until the next top-level ##.
$endIdx = $lines.Count - 1
for ($j = $startIdx + 1; $j -lt $lines.Count; $j++) {
    # Stop on next anchor (covers cases where two anchors precede consecutive sections)
    if ($lines[$j] -match '<a\s+id="' -and $j -gt $startIdx) {
        $endIdx = $j - 1
        break
    }
    # Stop on next top-level heading
    if ($lines[$j] -match '^##\s' -and $j -gt $startIdx + 1) {
        $endIdx = $j - 1
        break
    }
}

# Trim trailing blank lines for cleaner output
while ($endIdx -gt $startIdx -and [string]::IsNullOrWhiteSpace($lines[$endIdx])) {
    $endIdx--
}

for ($k = $startIdx; $k -le $endIdx; $k++) {
    Write-Output $lines[$k]
}
