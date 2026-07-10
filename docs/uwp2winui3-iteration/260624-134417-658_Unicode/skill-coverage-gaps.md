# Skill-coverage-gaps (WILL change skill) — Unicode

## 1. App-level `RequestedTheme` dropped during App.xaml migration
- **Evidence:** UWP source `App.xaml` has `<Application ... RequestedTheme="Dark">`; migrated
  `App.xaml` omits it. Golden `parity/baseline/screenshots/01_*.png` is dark; candidate
  `parity/winui3/screenshots/01_*.png` client is white (light theme).
- **Covered at:** MIGRATION-PATTERNS.md L850-852 (theme-brush key remaps) — but only per-brush,
  never the `<Application RequestedTheme>` attribute.
- **Why missed:** under-emphasized; theme guidance is all about individual brush keys, so the
  app-level theme knob isn't surfaced.
- **Improvement:** call out explicitly (subsection + pointer) that `RequestedTheme` on
  `<Application>` must be carried over from the UWP App.xaml.
- **Generalizes:** `RequestedTheme="Dark"` is a common UWP SDK-sample idiom and App.xaml is
  rewritten in every migration, so it is at risk of being dropped in any such scenario.
