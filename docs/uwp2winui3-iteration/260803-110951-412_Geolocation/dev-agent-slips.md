# Dev-agent slips — Geolocation

## Transient WMC / "Cannot resolve DataType local:Scenario" — **one-off cascade**
- **Evidence:** 117× `error WMC`; agent noted XAML compile fails while CS errors remain.
- **Covered clearly at:** PATTERNS.md x:Bind section (~line 753) + general knowledge that
  XAML compilation cascades from CS errors.
- **Why no skill change:** purely downstream of the duplicate-definition flood (captured
  as a coverage-gap). Fixing that root cause removes these; no separate edit needed.
