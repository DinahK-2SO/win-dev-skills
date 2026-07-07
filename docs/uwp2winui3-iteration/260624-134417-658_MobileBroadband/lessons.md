# Lessons — MobileBroadband (UWP → WinUI 3)

## Outcome
Builds ✔, runs ✔, but **score 0 / 7** — the migrated window renders **fully blank white**
for every scenario despite a 100% populated UIA tree and responsive controls.

## Root cause (the high-value finding)
The current `dotnet new winui` scaffold makes the window **composition-dependent in two
independent ways**:

1. `<Window.SystemBackdrop><MicaBackdrop/></Window.SystemBackdrop>` — **already covered**
   by the skill; the agent correctly removed it (session-log 2249; validator PASS at
   3135/3200).
2. `ExtendsContentIntoTitleBar = true` + the scaffold `<TitleBar>` control — **NOT
   covered**. This keeps the window in a transparent, DWM-composition-dependent mode.

Both need live DWM composition of a transparent window surface, which is absent in the
headless/VM/automated-capture session where parity screenshots are taken. Removing only
the backdrop (#1) leaves #2 in place → the window still paints blank white while the
process stays alive and the smoke gate passes.

## Why the skill missed it
`SKILL.md` and `MIGRATION-PATTERNS.md#system-backdrop-blank` frame the blank-window fix as
"delete `<Window.SystemBackdrop>` → reliable rendering + opaque parity." That is only half
the fix on the current scaffold, so the agent (and the validator's `[PASS]`) reported a
false all-clear.

## Fix that generalizes
When de-composing the window for headless-capture parity, neutralize **both** triggers:
remove the backdrop **and** revert the scaffold custom title bar (delete the `<TitleBar>`
block, drop `ExtendsContentIntoTitleBar = true` / `SetTitleBar(...)`), leaving a plain
opaque window with the standard system title bar — which also matches the UWP original.

## Tooling gap
`Validate-UwpMigration.ps1` Section 9 only greps for `<Window.SystemBackdrop>`/Mica/Acrylic.
It should also WARN on `ExtendsContentIntoTitleBar = true` / the scaffold `<TitleBar>` so
the second trigger can't slip through as a false `[PASS]`.
