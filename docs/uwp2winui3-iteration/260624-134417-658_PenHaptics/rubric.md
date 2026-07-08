# PenHaptics — Parity Rubric

Feature: **PenHaptics C# Sample** (5 scenarios). Each scenario weighted equally.
Verdict scoring: pass = 1, partial = 0.5, fail = 0. Score = round(100 * sum / total).

| # | Scenario | Key controls | Actions | Output |
|---|----------|--------------|---------|--------|
| 1 | Ink Canvas Tactile Feedback | InkCanvas + pen-type toolbar | (inking only) | StatusBlock |
| 2 | Query Tactile Feedback Support | (query, description) | (auto) | StatusBlock |
| 3 | Inking Feedback | waveform ComboBox, Intensity Slider, inking area | (inking) | StatusBlock |
| 4 | Interaction Feedback | waveform ComboBox, Intensity Slider, Send Interaction Feedback Button | Send Interaction Feedback | StatusBlock |
| 5 | Inking and Interaction Feedback | draggable square on grid | (drag) | StatusBlock |

Note: the only actuatable Button action (Scenario 4) is hardware-gated (requires a haptic pen)
and is non-responsive in the original UWP app too — so a non-response in WinUI is NOT a regression.
