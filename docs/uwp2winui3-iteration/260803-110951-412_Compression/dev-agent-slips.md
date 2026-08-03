# Dev-agent slips (no skill change) — Compression (index 0)

## 1. Theme mismatch (cosmetic)
- WinUI app renders system-default light; UWP golden is dark. Scorer marked it a **cosmetic non-defect** (all controls/layout/text match).
- **No skill change:** forcing `RequestedTheme='Dark'` to match one golden is scenario-specific and an anti-pattern — WinUI apps should follow the system theme. Not generalizable.
