# Lessons — MIDI (UWP→WinUI 3)

Clean migration: score 83, builds=true, runs=true, 0 behavioral regressions. The lone
`partial` (Send MIDI Messages) is hardware-gated in BOTH apps (identical XAML), not a
migration defect.

## What worked
- **Initialize-UwpMigration.ps1** bootstrap: copied 9 files, rewrote namespaces, triaged
  each file, injected 8 `TODO[migrate-NNN]` anchors. Smooth foundation.
- **Get-MigrationPattern.ps1 -Anchor threading**: returned the CoreDispatcher→DispatcherQueue
  section; agent applied it to `MidiDeviceWatcher.cs` + `Scenario1/2/3`. Build clean, 0 WUI.
- **Validate-UwpMigration.ps1**: confirmed PASS, 0 WUI analyzer warnings, no TODO residue.

## The one real struggle (generalizable)
`Get-MigrationPattern.ps1 -Anchor manifest|manifest-migration-checklist|appxmanifest`
**failed three times** (turns 18-20). The manifest guidance IS in MIGRATION-PATTERNS.md
(`### Manifest migration checklist`, line 634) but has **no `<a id>` anchor**, and the
script only matches `<a id>`. The not-found error lists **no valid anchors**, so the agent
could not self-correct — it fell back to grepping all headings and opening the file at a
line range (turn 21-22), the wholesale-file access the script exists to avoid.

- **Root cause:** script matches only `<a id>`; many high-value sections
  (Manifest checklist, appxmanifest reconciliation, WUI analyzer, PackageReference
  cheat-sheet, Namespace Mapping, Common build errors, Unsupported APIs) have none.
- **Fix:** heading-slug fallback + list-anchors-on-miss in `Get-MigrationPattern.ps1`.

## API notes
- `Windows.Devices.Midi` needed no special handling — only the standard threading swap.

## Benign (no action)
- 28-56 `CS86xx` nullable warnings from the scaffold's `<Nullable>` setting on
  un-annotated sample code. Not WUI, not blocking; agent correctly ignored them.
