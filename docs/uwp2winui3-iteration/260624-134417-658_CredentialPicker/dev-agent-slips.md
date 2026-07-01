# CredentialPicker — Dev-Agent Slips (skill already adequate → no skill change)

## 1. Launch / PickAsync runtime no-op (Scenarios 2 & 3)
- **Evidence:** migration-score.json features[1]/[2] ("Launch handler present/wired; noop is
  hardware-gated PickAsync"); flagged, not failed.
- **Covered clearly at:** `## Pickers and Win32 Surfaces` (`#pickers`) — though note this is a
  **static** system-dialog API with no InitializeWithWindow path.
- **Slip type:** environment / random-flake (COMException 'handle is invalid' in headless).
- **Why no skill change:** the handler was ported correctly (verbatim namespace carry-over in
  the preserved try/catch) and scored pass; the no-op is a hardware/OS gate, not an agent or
  skill error. No generalizable skill-side fix exists. Listed only for completeness.
