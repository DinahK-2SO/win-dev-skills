# Parity discrepancies — NfcProvisioner (iteration 0)

- **Score:** 50 (partial). Builds: yes. Runs: yes.
- **Requirement 0 — Provision Peer Device:** partial. Browse present & functional (opens .ppkg picker), Transfer matched, Cancel Transfer absent — but Transfer/Cancel are `Visibility=Collapsed` / NFC-gated in **both** UWP and WinUI, so not a regression. 0 behavioral regressions. Migrated `Scenario1.xaml` is byte-identical to the UWP source.
- **Visual:** WinUI window screenshots blank/white via `winapp` GDI capture while the UIA tree reports every control laid out on-screen. Consistent with a WinUI 3 DirectComposition surface that GDI screenshotting cannot grab → **eval-instrument limitation**, deferred to human; not a migration skill defect.

**Bottom line:** No migration-side parity gap. The actionable skill lesson comes from the build log (0x802B000A launch crash from un-migrated shared resource-dictionary style keys), not from the parity score.
