# Gyrometer — Dev-Agent Slips (skill already clear → NO skill change)

## WMC0909 / WMC1111 x:Bind DataTemplate DataType
- **Evidence:** session-log.txt 2424-2425; reverted to `{Binding Title}` same turn (turn 24).
- **Covered clearly at:** MIGRATION-PATTERNS.md `### x:Bind and compiled bindings` (line 771) and
  `### XAML namespace mapping (recap)` (line 779).
- **Slip type:** one-off self-inflicted (agent converted a working `{Binding}` to an `x:Bind`
  with an unresolved `x:DataType`, then fixed it immediately).
- **Why no skill change:** skill already documents x:Bind + xmlns resolution; a re-run would
  get it right. Not general.
