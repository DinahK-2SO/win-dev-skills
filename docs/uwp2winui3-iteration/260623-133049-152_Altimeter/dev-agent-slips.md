# Dev-agent slips — Altimeter (NO skill change)

## 1. CS0103 'App' after namespace-guard rename
- Transient build error; resolved within the session (qualified `AltimeterApp.App.MainWindow`), build
  succeeded.
- **Covered clearly at:** `SKILL.md` L63 "Namespace/type collision guard" — documents the `<Name>App`
  rename and instructs keeping it for new scaffold files.
- **Slip type:** one-off-mistake. No skill edit needed.
