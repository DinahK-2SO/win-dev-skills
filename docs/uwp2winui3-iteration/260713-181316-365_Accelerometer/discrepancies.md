# Discrepancies - Accelerometer migration

**No functional or structural discrepancies found.** All six scenarios have full control
coverage (Compare-Parity: 100/100, pass=6) and match the UWP golden screenshots.

Enable/Disable buttons are **hardware-gated**: with no accelerometer present, both the UWP
golden and the WinUI 3 app show `Standard accelerometer not found` and keep the buttons
disabled, so their non-response is expected parity, not a dead-control regression.

| Scenario | Type | Severity | Detail |
|----------|------|----------|--------|
| (app-wide) | cosmetic | info | Default theme differs (UWP dark vs WinUI light); layout/text/controls otherwise identical. Not a defect. |
