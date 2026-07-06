# Lessons — LampArray UWP→WinUI 3 (trial 1)

**Outcome:** score 0, builds=true, runs=true, both scenarios `fail` on a **blank white render**.

## The one decisive defect
The migrated app builds, launches, stays alive, and lays out **every** control (UIA tree
has all 6 Basics + 4 Effects controls with real bounding rectangles, e.g. x=774), yet the
entire client area paints **uniform white** (10408-byte all-white frame); only OS caption
buttons render.

### Root cause
This is the "fully-laid-out-but-blank-white in headless/automated capture" symptom. The
skill documents ONE cause of it — the scaffold's `<Window.SystemBackdrop><MicaBackdrop/>`
— and the dev agent correctly **removed** it (session-log 3141/4895/4981). But the window
**still** rendered blank, because a *sibling* composition-dependent scaffold feature
remained: `ExtendsContentIntoTitleBar = true` + the `dotnet new winui` `<TitleBar>` control
+ `SetTitleBar`. These are **added by the scaffold and absent from the UWP source** (the
UWP LampArray sample uses the standard system title bar — verified: no title-bar/backdrop
customization in its `.xaml`/`.cs`).

### Doc error
`MIGRATION-PATTERNS.md#system-backdrop-blank` and the matching SKILL.md section say
removing the backdrop **"restores reliable rendering."** That over-promises and stopped the
agent after one fix. Backdrop removal is *necessary but not sufficient*.

### Tooling limitation
`Validate-UwpMigration.ps1` Section 9 only greps for `<Window.SystemBackdrop>`; Section 7
only checks process liveness. Both passed on a blank window.

## Preventable by
Generalize the blank-window guidance + validator Section 9 from "the backdrop" to **all
scaffold-added composition-dependent window chrome** (backdrop AND
extend-into-titlebar/`TitleBar` control), revert it to plain default chrome when the UWP
original used the standard title bar, and soften the "one fix restores rendering" language.
