# Parity Report — TouchKeyboard

Generated 2026-07-10T12:47:03.6105820+08:00 by Compare-Parity.ps1.

**Parity score: 75 / 100**  ·  pass=3 partial=0 fail=1  ·  4 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Display touch keyboard automatically | PASS | 2/2 | 0/1 live | 01_Display_touch_keyboard_automatically.png |  |
| 2 | Listen for Show/Hide events | PASS | 2/2 | 0/1 live | 02_Listen_for_Show_Hide_events.png |  |
| 3 | Programmatically Show/Hide\nthe touch keyboard | FAIL | 0/1 | — | 03_Programmatically_Show_Hide_nthe_touch_keyboard.png | Missing 1/1 control(s): TextBox "Type a few words and hit Enter." |
| 4 | Showing the Emoji keyboard | PASS | 2/2 | 0/1 live | 04_Showing_the_Emoji_keyboard.png |  |

## Scenarios needing work

### Scenario 3 — Programmatically Show/Hide\nthe touch keyboard  [FAIL]

- Missing 1/1 control(s): TextBox "Type a few words and hit Enter."
- Controls not found in the WinUI 3 UIA tree:
  - TextBox "Type a few words and hit Enter."
- Inspect: `winapp ui inspect -a <PID> --interactive` after navigating to this scenario, and compare `screenshots/03_Programmatically_Show_Hide_nthe_touch_keyboard.png` against the baseline.

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
