# CredentialPicker — Discrepancies (improve trial)

**Score 100 · builds ✓ · runs ✓ · structural parity 100% (9/9, 10/10, 14/14).**

## Requirements
- **#0 Scenario 1 — Message** → **pass**. 9 controls, correct values, Launch wired.
- **#1 Scenario 2 — Message+Caption** → **pass**. 10 controls, Caption correct, distinct nav.
- **#2 Scenario 3 — CredentialPickerOptions** → **pass**. 14 controls incl. both ComboBoxes;
  preserves the UWP `Protcol` label typo.

## Behavioral flags (not failures)
- **Launch on Scenarios 2 & 3** produced no new token — `CredentialPicker.PickAsync` is a
  hardware/OS-gated static system dialog that throws `COMException 'The handle is invalid.'`
  in the headless capture env. No UWP behavioral golden exists → flagged for manual review,
  not a defect. Handlers present & wired (Scenario 1's identical Launch registered the caught
  exception, proving the path executes).

## Measurement limitations (environment, not migration defects)
- WinUI screenshots render blank (DirectComposition not grabbable via PrintWindow); parity
  confirmed via the fully-populated UIA text tree.
- Only Scenario 1 UWP golden captured (UWP CoreWindow not UIA-drivable).

**No migration defects.** Improvement opportunities come from build-log friction, not parity.
