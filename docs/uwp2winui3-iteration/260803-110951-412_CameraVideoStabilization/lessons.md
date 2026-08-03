# Lessons — CameraVideoStabilization (score 100/100, builds=true)

The migration **scored 100** (full 3/3 control parity, 0 behavioral regressions) — but
only because this machine has **no camera**, which gates the buttons in *both* apps. The
build log reveals one real, latent defect that a machine *with* a camera would expose.

## Headline finding
- **`SystemMediaTransportControls.GetForCurrentView()` was not migrated.** The agent
  wrapped it in `try/catch` and set the field to `null` on failure. On WinUI 3 desktop
  `GetForCurrentView()` throws, so the SMTC handler is **always dead**. Final build emits
  `warning WUI0004: SystemMediaTransportControls.GetForCurrentView() is UWP-only`.

## Root cause (skill)
- `MIGRATION-PATTERNS.md#getforcurrentview` lists ApplicationView, UIViewSettings,
  DisplayInformation, CoreApplication, SystemNavigationManager — **but not
  SystemMediaTransportControls**, and gives no HWND-interop snippet for it.
- The `WUI0004` row (L584) mislabels the rule as *SystemNavigationManager*-specific and
  offers only a vague "or use HWND-based COM interop" fix — no concrete replacement.
- The analyzer inventory *did* correctly catch `GetForCurrentView(` and inject a TODO to
  the anchor; the failure was purely that the anchor's table had no answer to copy.

## What worked
- TODO injection + sequential mode from `Initialize-UwpMigration.ps1`.
- `#threading` table: every `Dispatcher.RunAsync` → `DispatcherQueue.TryEnqueue` correct.

## dev_agent_struggles
- SMTC init: agent circled back several turns, acknowledged it needed a replacement,
  found none in the skill, and defensively nulled it. Preventable by adding the SMTC row
  + interop snippet to `#getforcurrentview`.
