# Parity Discrepancies — AdvancedCasting (index 1)

score 0.0 · builds=false · runs=false

All 6 rubric features (Media Element Casting, Custom Cast Button, DIAL Sender, DIAL Receiver, Multi-View, Combine Casting) are **fail** for the same reason: the migrated WinUI 3 app does not build, so no scenario renders and no parity can be captured.

- **Root cause:** `.csproj` defined `DISABLE_XAML_GENERATED_MAIN` without a custom `Program.cs`/`Main` → XAML markup compiler crash (`WMC9999`) + no entry point (`CS5001`).
- **Visual discrepancies:** none capturable (WinUI app never launched; only the UWP baseline exists).

No feature-level regression analysis is possible until the build is green.
