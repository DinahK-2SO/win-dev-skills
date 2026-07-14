# Parity discrepancies — Altimeter

- **Score:** 100/100. Builds ✅  Runs ✅
- **Requirements:** both pass (Data Events 2/2, Polling 1/1), full control coverage.
- **Visual discrepancies:** none — WinUI reproduces the SDK sample layout faithfully.
- **Missing features:** none.
- **Note:** Live sensor readings are hardware-gated (no altimeter on the machine) and the
  original UWP app hung on the splash, so live behavior is unverifiable on both sides —
  not a migration defect. All skill-improvement leverage is in build-time friction.
