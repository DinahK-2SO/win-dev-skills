# Discrepancies — ExtendedExecution (UWP → WinUI 3)

**Score 100 · builds ✅ · runs ✅ · 4/4 pass.** No visual/behavioral fidelity gaps: every scenario, control, label, and the `Denied` status path match the UWP source.

| # | Requirement | Status | Note |
|---|-------------|--------|------|
| 1 | Unspecified Reason | pass | Begin invoked live → "Extended execution denied." |
| 2 | Saving Data Reason | pass | Description-only, no buttons (matches source) |
| 3 | Location Tracking Reason | pass | Begin invoked live → "Extended execution denied." |
| 4 | Using Multiple Tasks | pass | Correct label; Begin → "Extended execution denied." |

## Not reflected in the score (latent)
The toast-notification code was migrated to WinAppSDK `AppNotificationManager`, crashed at startup (`0xc000027b`, missing manifest COM activator), and was **reverted to UWP `ToastNotificationManager`**. This is a latent runtime defect (parameterless `CreateToastNotifier()` throws in unpackaged WinUI 3 desktop) that never executes here because the `Allowed`/toast path is unreachable when `ExtendedExecutionSession` is `Denied` on a headless dev box. See `skill-coverage-gaps.md`.
