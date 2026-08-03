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
You may also pass any case-insensitive substring of an anchor id OR of a
'## ' heading (e.g. 'CaptureElement' or 'camera preview' both resolve to the
'capture' section) — useful when the terse id isn't obvious from the API/feature
name. If nothing matches, the script prints the full catalog of sections.

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

# Build an index of every reachable section: exact <a id> anchors AND every
# '## ' heading (some headings have no <a id>, so they'd otherwise be unreachable).
$sections = New-Object System.Collections.Generic.List[object]
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match '<a\s+id="([^"]+)"') {
        $sections.Add([pscustomobject]@{ Kind = 'anchor'; Key = $matches[1]; Index = $i; Heading = '' })
    }
    if ($lines[$i] -match '^##\s+(.+?)\s*$') {
        $sections.Add([pscustomobject]@{ Kind = 'heading'; Key = ''; Index = $i; Heading = $matches[1] })
    }
}

$anchorPattern = "<a\s+id=`"$([regex]::Escape($Anchor))`""

$startIdx = -1
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match $anchorPattern) {
        $startIdx = $i
        break
    }
}

# Fallback 1: case-insensitive substring match against anchor ids AND heading text.
# Agents routinely guess an anchor from a feature/API/error term (e.g. 'CaptureElement',
# 'camera preview') that doesn't equal the terse id ('capture'); resolve those here.
if ($startIdx -lt 0) {
    $needle = $Anchor.ToLowerInvariant()
    $match = $sections | Where-Object {
        ($_.Kind -eq 'anchor'  -and $_.Key.ToLowerInvariant().Contains($needle)) -or
        ($_.Kind -eq 'heading' -and $_.Heading.ToLowerInvariant().Contains($needle))
    } | Select-Object -First 1
    if ($match) { $startIdx = $match.Index }
}

if ($startIdx -lt 0) {
    # Fallback 2: no match at all -> list every reachable section so the caller can
    # self-serve instead of guessing again or opening the whole file (which the
    # docstring warns trips the content-safety filter).
    $catalog = foreach ($s in $sections) {
        if ($s.Kind -eq 'anchor') { "  -Anchor $($s.Key)" }
        else { "  (heading, match by text) $($s.Heading)" }
    }
    Write-Error ("Anchor '#$Anchor' not found in $PatternsPath.`nAvailable sections (pass an anchor id, or any case-insensitive substring of an id or heading):`n" + ($catalog -join "`n"))
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
