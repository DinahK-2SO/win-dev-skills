# Discrepancies — RelativeInclinometer

**Score 100 · builds=true · runs=true · 2/2 pass.** No structural or behavioral
discrepancies vs the UWP golden. Both apps are hardware-gated (no relative inclinometer
sensor), so action controls are equally inert — parity, not regression.

| # | Feature | Status | Note |
|---|---------|--------|------|
| 1 | Data events | pass | Enable/Disable + Pitch/Roll/Yaw + status match golden |
| 2 | Polling | pass | GetDataButton disabled (no sensor) matches golden |

The only friction was build-time (CS0103 `App` / `SDKTemplate` namespace split +
cascading `x:Bind` DataTemplate resolution). Self-resolved by the agent, but general and
recurring → captured as a skill-defect / coverage-gap for a skill improvement.
