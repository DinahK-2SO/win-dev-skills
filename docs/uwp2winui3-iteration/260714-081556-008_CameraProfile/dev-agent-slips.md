# Dev-Agent Slips — CameraProfile (index 0)

These are excluded from skill changes.

1. **Light vs dark theme** — host system theme at capture time, not controlled by the migration. No skill edit applies. (evidence: score `discrepancies.json` theme item.)
2. **UWP behavioural golden uncapturable** — winapp UIA could not drive the ApplicationFrameHost CoreWindow. This is an evaluation-tool limitation (`uwp-app-runner` / `winui3-parity-check`), explicitly out of scope. (evidence: `migration-score.json` uwp_capture_status.)
