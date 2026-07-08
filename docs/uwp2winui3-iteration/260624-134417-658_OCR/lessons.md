# OCR — Lessons (UWP → WinUI 3)

Score: **100/100**, builds:true, runs:true, both features PASS. The migration succeeded,
but the build log shows recurring, *generalizable* friction worth folding back into the skill.

## What worked
- **Inline `TODO[migrate-NNN]` injection** from `Initialize-UwpMigration.ps1` routed the
  agent to `PATTERNS.md#getforcurrentview` / `#threading`; those were fixed cleanly.
- The **CaptureElement → visible Border placeholder** pattern was applied as documented.

## Errors encountered (root cause → fix)
1. **CS1061 `Application` has no `Suspending`/`Resuming`** — UWP app-lifecycle events are
   gone in WinUI 3 desktop. **Not in the API inventory, not in the docs.** Agent only found
   it at build time; removed subscriptions + handlers, kept cleanup in `OnNavigatingFrom`.
2. **CS1061 `Border` has no `Source`** — hero `CaptureElement` was correctly swapped to a
   Border placeholder, but code-behind still assigned `PreviewControl.Source`. Removed.
3. **CS0103 `displayInformation` undefined** — `DisplayInformation.GetForCurrentView()`
   removed; fixed per `PATTERNS.md#getforcurrentview`.
4. **WMC0909 Cannot resolve DataType `local:Scenario`** — scaffold namespace (`OCR`) vs.
   ported SDK-sample namespace (`SDKTemplate`) mismatch; reconciled.

## Highest-leverage takeaway
`Application.Suspending`/`Resuming` (and `EnteredBackground`/`LeavingBackground`) removal is
a **cross-scenario** gap: almost every non-trivial UWP app subscribes to these for resource
cleanup (camera, media, sensors, state save). The skill has neither an inventory pattern nor
a doc note for them.
