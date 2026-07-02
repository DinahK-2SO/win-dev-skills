# Discrepancies — DataReaderWriter (UWP → WinUI 3)

**Score 100/100. No functional or parity discrepancies.**

| Requirement | Status | Evidence |
|---|---|---|
| Read and write simple structured data | pass | `SendButton` invoke → `ElementsRead` = Hello / World / 1 2 3 4 5 / Très bien! / Goodbye (correct round-trip) |
| Dump file contents using ReadBytes() | pass | `HexDumpButton` invoke → `ReadBytesOutput` = correct PNG hex dump (header 8950 4e47, trailer …IEND) |

The only issues were **build-loop friction**, both fixed before scoring:
- CS0234 `Windows.UI.Colors` (moved to `Microsoft.UI`) — addressed by the skill fix.
- DataTemplate `x:Bind`/`x:DataType` resolution error — one-off, agent fell back to `{Binding}`.

WinUI 3 screenshots were blank (headless-capture limit, `GetForegroundWindow=0`), not a
rendering defect; parity verified via UI Automation.
