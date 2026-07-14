# Dev-agent slips (NO skill change) — Altimeter

1. **CS8803/CS1022/CS0106 syntax cascade** in the Scenario code-behind files — a botched
   multi-member edit left stray members / unbalanced braces. Generic C# well-formedness,
   not a migration topic; re-emitting the file fixed it. No skill change.

2. **App/MainWindow static exposure + init-order race** — the skill already covers this
   prominently (windowing guidance was injected and the agent followed it, adding the
   static `MainWindow`). No skill change.
