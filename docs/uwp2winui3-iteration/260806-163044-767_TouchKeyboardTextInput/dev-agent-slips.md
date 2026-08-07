# Dev-agent slips

1. **Bootstrap/check race:** ran the mandatory self-check before bootstrap completion despite the explicit ordered gate.
2. **Build/launch race:** launched and validated concurrently with compilation despite the documented build-then-launch loop.
3. **Fidelity violation:** manually regenerated XAML and later removed the shared style provider despite the prominent copy-verbatim rule.
