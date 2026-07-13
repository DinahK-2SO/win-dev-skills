# Dev-agent slips — AdaptiveStreaming (NO skill change)

## 1. Missing AutomationId on 'Set' buttons + MediaPlayerElement UIA false-negatives
- Measurement artifact of the eval skill/UIA (`MediaPlayerElement` exposes no AutomationId); scorer already upgraded scenarios 2/5/6 to pass. Adding AutomationProperties the UWP source lacked is out of migration scope and violates fidelity rules. No skill edit.

## 2. Residual nullable-reference warnings (CS86xx)
- Non-fatal; validator gate targets only WUI analyzer warnings; build succeeded. Chasing them adds noise for no scored benefit. No skill edit.
