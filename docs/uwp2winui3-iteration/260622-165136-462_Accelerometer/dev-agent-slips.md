# Dev-agent slips — Accelerometer (will NOT change skill)

## 1. Cascading XAML errors WMC9999 / WMC1509
- Appeared on every failed build but did not mislead the agent; it fixed the underlying
  CS#### errors and the XAML noise vanished. No skill change needed (a one-line clarifying
  note is folded opportunistically into the new common-build-errors content, but behavior
  was already correct).

## 2. Residual CS8618 / CS8622 nullable warnings
- Non-fatal; BUILD SUCCEEDED, app runs, parity 100/100. Warnings only — no skill edit.
