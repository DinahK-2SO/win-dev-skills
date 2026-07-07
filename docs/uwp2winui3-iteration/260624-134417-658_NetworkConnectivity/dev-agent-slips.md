# Dev-agent slips — NetworkConnectivity (index 0)

## 1. Unnecessary x:Bind → Binding change in MainPage.xaml

- **Evidence:** `session-log.txt` 4308 — done in the same batch as the CS0104 fix (4305).
- **Covered clearly at:** `MIGRATION-PATTERNS.md` "x:Bind and compiled bindings" (line 808) — x:Bind is supported. The build's own `WMC1509 "No LocalAssembly parameter given during MarkupCompilePass2"` warning shows the markup errors cascaded from the failed C# compile.
- **Slip type:** one-off mistake (reacted to a cascade).
- **Why no skill change:** once CS0104 was fixed the C# compiled and x:Bind against `local:Scenario` would resolve. Keeping x:Bind is fine. The only durable improvement is the one-line "these WMC errors are a cascade of the C# failure" note, which is folded into the CS0104 skill-defect fix — no separate edit.
