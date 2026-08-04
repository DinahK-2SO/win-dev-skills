# Discrepancies — CustomSerialDeviceAccess

Score 100/100, builds + runs, no functional/visual regressions vs UWP golden.
All 4 scenarios pass. Device-gated collapsed panels (cov false-negatives) are a
capture artifact on a device-disconnected machine, not defects.

Improvement signal is entirely in build/runtime friction (see skill-defects / skill-coverage-gaps).
