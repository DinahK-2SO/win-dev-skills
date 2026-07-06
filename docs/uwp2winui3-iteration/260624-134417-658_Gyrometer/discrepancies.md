# Gyrometer — Parity Discrepancies (improve step view)

**Score: 100/100** · builds ✔ · 3/3 scenarios pass.

| Req | Scenario | Status | Note |
|-----|----------|--------|------|
| 1 | Data Events | pass | Enable/Disable + X/Y/Z + status match UWP (UIA tree). |
| 2 | Polling | pass | Controls/outputs + description match UWP. |
| 3 | Cross-Platform Porting | pass | Get Sample disabled (no hardware), Windows/WP columns + ReadingTransform present. |

No missing controls, dead controls, wrong output text, or layout differences attributable to
the migration. WinUI screenshots are blank due to a headless PrintWindow/DirectComposition
capture limitation (tooling, not a migration defect). Behavior is hardware-gated (no gyrometer
present), so live-data behavior is not demonstrable on either app.
