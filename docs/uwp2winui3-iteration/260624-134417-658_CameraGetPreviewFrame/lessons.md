# Lessons — CameraGetPreviewFrame (UWP → WinUI 3)

Outcome: **score 100, builds, runs, 4/4 controls, behavioral parity.** The migration
succeeded, but the dev-agent burned build iterations on two *generalizable* gaps the
skill should have prevented up front.

## Highest-value struggles (from build-events / session-log)

1. **Suspend/Resume lifecycle (turns ~30–38, ~8 turns of churn).**
   The sample subscribed to `Application.Current.Suspending` / `.Resuming` to release and
   re-acquire the camera. These events **don't exist in WinUI 3 desktop** → `CS1061`. The
   agent kept the UWP handlers for several turns before removing them and rewiring teardown
   into `Window.Activated`. The skill's lifecycle section covered `OnLaunched`/activation but
   was **silent on Suspending/Resuming**.

2. **CaptureElement camera preview (turns 33–35).**
   `unsupported-api-inventory.json` classified `CaptureElement` as *unsupported → defer*, and
   `MIGRATION-PATTERNS.md` said there is *"no compatible replacement."* That guidance is wrong:
   the agent migrated live preview with a `GetPreviewFrameAsync` → `<Image>` frame loop and hit
   100% parity. Following the skill literally would have **deferred a working feature** (parity fail).

## Errors encountered → root cause → fix
- `CS0227 unsafe code` → pixel-buffer access needs `<AllowUnsafeBlocks>true</AllowUnsafeBlocks>` (already documented; one-iteration recovery).
- `CS1061 Application.Suspending/Resuming` → no such events in WinUI 3 desktop → remove, use `Window.Activated`.
- `CS0246 CaptureElement` → no control in WinUI 3 → migrate preview to an `<Image>` frame loop (don't defer).

## Tools
- **Helpful:** scaffold's inline `TODO[migrate-NNN]` anchors routed the agent to #threading / #getforcurrentview; build loop surfaced each error.
- **Problematic:** the inventory's `defer` triage for CaptureElement fought the goal of parity.

## Environment
- No camera present; the `GetPreviewFrameAsync` button is disabled in **both** UWP and WinUI, so its dead action is not a regression.
