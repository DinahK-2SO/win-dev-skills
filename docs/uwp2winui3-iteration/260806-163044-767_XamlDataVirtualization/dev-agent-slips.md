# Dev-agent slips

- **Bootstrap check raced initialization:** Step 0 already required ordered commands and a `True` self-check.
- **Manifest assets were reconciled too late:** the existing manifest section predicted `Splash-sdk.png` and `0x80073CF6` exactly.
- **Custom entry-point discard error:** `_` was a named lambda parameter, producing a local `CS0029`; this was a one-off C# mistake.
- **Build and launch ran concurrently:** Step 3 already presented them as dependent sequential actions.
