# Discrepancies — AssociationLaunching

**Summary: no parity defects found.** All 4 scenarios are present, render correctly,
have 100% structural control coverage, and are behaviorally functional in the migrated
WinUI 3 app. Visual fidelity against the UWP golden is high.

| # | Scenario | Coverage | Verdict | Notes |
|---|----------|----------|---------|-------|
| 1 | Launching a file | 6/6 | pass | Faithful to UWP golden; default-handler / pick-and-launch / warning controls respond. |
| 2 | Launching a URI | 6/6 | pass | URI TextBox + launch buttons present and respond. |
| 3 | Receiving a file | 3/3 | pass | Create/Remove test-file controls verified live (created & deleted a real `.alsdkcs` file). |
| 4 | Receiving a URI | n/a | pass | Informational page, no controls; renders correctly. |

## Measurement limitations (not migration defects)

1. **UWP golden behavioral baseline unavailable.** The original UWP app launched
   (`uwp-app-runner ok:true`) and rendered (a non-blank Scenario-1 golden was captured),
   but exposes no UIA content tree in this environment and rejected synthetic input
   (desktop was on the Windows lock screen, blocking window activation). Per-scenario UWP
   navigation/actuation could not be driven, so there is no UWP behavioral baseline. No
   behavioral regressions could therefore be *derived* from UWP; instead WinUI liveness was
   verified directly.

2. **Scenario 3 batch-capture artifact.** During the batch capture, leftover modal
   file-picker dialogs (from Scenario 1/2 "Pick and launch") covered the app and blocked
   Scenario 3's invokes, and "Create test file" is a file-system side effect with no visible
   text change — so it showed 0/3 live. Direct re-verification (dialogs cleared) confirmed
   all three Scenario 3 controls work: "Create test file" created
   `Test alsdkcs file.alsdkcs` in Pictures and "Remove test files" removed it.
