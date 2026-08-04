# Discrepancies — CustomSensors (score 100/100)

No parity discrepancies. Both requirements pass.

| id | feature | status | note |
|----|---------|--------|------|
| 1 | Data events | pass | Layout + device-absent fallback match UWP golden. |
| 2 | Polling | pass | Layout + handler response match UWP golden. |

Improvement leverage is in the **build-time struggle**, not parity: the SDK-sample
`SDKTemplate` namespace mismatch produced a CS0246 + WMC0909/WMC1111/WMC1509 cascade the
dev-agent had to reason through. That is where a skill note generalizes.
