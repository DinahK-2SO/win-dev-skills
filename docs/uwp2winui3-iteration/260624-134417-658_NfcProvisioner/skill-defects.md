# Skill defects — NfcProvisioner (iteration 0)

## 1. `0x802B000A` launch crash from un-migrated shared resource-dictionary style keys (WILL change skill)
- **Problem:** Clean build, then instant startup crash (`0x802B000A` / `E_XAMLPARSEFAILED`) because `MainPage.xaml` / `Scenario1.xaml` reference `{StaticResource SampleHeaderTextStyle}`, `{StaticResource ScenarioDescriptionTextStyle}`, etc., whose definitions live in the UWP sample's `StandardStyles.xaml` / sample-template `App.xaml` and were not migrated into the scaffold.
- **Evidence:** session-log.txt L2943-3040 (validator crash + WER `P8=802b000a`), L424-425/L975 (style references), L3206-3211 (fix = define styles in `App.xaml`).
- **Skill state:** absent. The startup-crash table listed 4 codes but not `0x802B000A`; no pattern covered missing resource keys.
- **Fix applied:** added a `0x802B000A` row to the startup-crash native-code table + a "Missing resource keys crash at launch (SDK-sample shared styles)" subsection with a pre-build key-audit procedure, both in `MIGRATION-PATTERNS.md`.
- **Generalizes:** UWP samples (and most apps) centralize styles in a shared dictionary and reference them by key from every page; the WinUI scaffold never ships those dictionaries, so this clean-build-then-launch-crash recurs across nearly all UWP→WinUI 3 migrations.
