# Dev-agent slips (skill already clear → do NOT change skill)

## 1. CS8618/CS8602/CS8622 nullability warnings
- Ordinary C# nullable-reference warnings after `<Nullable>enable</Nullable>`. Agent fixed
  in one scripted pass (`_sensor!.`, `object? sender`). Windowing note already says to
  declare statics nullable. One-off; no skill change.

## 2. WinUI 3 blank parity screenshots
- Eval-side swapchain capture limitation, not a migration defect (live UIA tree proves the
  app renders). `#system-backdrop-blank` already covers the migration-owned blank-window
  case. No skill change.
