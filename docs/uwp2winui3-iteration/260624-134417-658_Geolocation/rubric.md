# Parity Rubric — Geolocation (UWP → WinUI 3)

Ground-truth feature checklist extracted from the original UWP source
(`uwp-samples-standalone/Samples/Geolocation/cs`). The migrated WinUI 3 app is scored
against these 8 scenarios.

| # | Scenario | Controls | Actions (controls actuated) |
|---|----------|----------|------------------------------|
| 1 | Track position | 2 | Start Tracking, Stop Tracking |
| 2 | Get position | 3 | Get Geolocation, Cancel |
| 3 | Background position | 2 | Register, Unregister |
| 4 | Foreground geofencing | 15 | Set to Here, StartImmediately, StartAtSpecificTime, Create Geofence, Remove Geofence |
| 5 | Background geofencing | 2 | Register, Unregister |
| 6 | Get last visit | 1 | Get last Visit |
| 7 | Foreground visit monitoring | 2 | Start Monitoring, Stop Monitoring |
| 8 | Background visit monitoring | 2 | Register, Unregister |

## Grading

- **pass** — scenario reachable (non-blank screenshot) and ≥80% of baseline controls present in the WinUI UIA tree, with actuated controls responding as in the UWP golden.
- **partial** — reachable and ≥40% coverage, or a control present but **dead** (responds in UWP, not in WinUI).
- **fail** — blank/unreachable or <40% coverage.

`score = round(100 * (pass + 0.5*partial) / features_total)`.
