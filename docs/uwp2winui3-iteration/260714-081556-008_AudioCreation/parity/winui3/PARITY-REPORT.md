# Parity Report — AudioCreation

Generated 2026-07-14T21:00:53.4830402+00:00 by Compare-Parity.ps1.

**Parity score: 100 / 100**  ·  pass=6 partial=0 fail=0  ·  6 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | File Playback | PASS | 4/4 | 1/3 live | 01_File_Playback.png |  |
| 2 | Capture From Device | PASS | 5/5 | 0/3 live | 02_Capture_From_Device.png |  |
| 3 | Using A FrameInput Node | PASS | n/a | — | 03_Using_A_FrameInput_Node.png |  |
| 4 | Using A Submix Node | PASS | 4/4 | 0/4 live | 04_Using_A_Submix_Node.png |  |
| 5 | Inbox Effects | PASS | 13/13 | 1/6 live | 05_Inbox_Effects.png |  |
| 6 | Custom Effects | PASS | 2/2 | 1/2 live | 06_Custom_Effects.png |  |

All scenarios reached `pass`. ✔

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
