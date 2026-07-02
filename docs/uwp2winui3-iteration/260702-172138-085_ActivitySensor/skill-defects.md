# Skill-defects — ActivitySensor (WILL change skill)

## 1. Root-namespace collides with the demonstrated WinRT type (CS0118) — ABSENT
- **Evidence:** turn 65 `error CS0118: 'ActivitySensor' is a namespace but is used like a type`; turn 15 scaffolded `dotnet new winui -n ActivitySensor`; source declares `namespace SDKTemplate`.
- **Skill search:** no hit for RootNamespace / SDKTemplate / CS0118 anywhere in the migration skill.
- **Fix:** Step 2 rule — set `<RootNamespace>` to the source's root namespace (SDK samples = `SDKTemplate`), align App/MainWindow to it, never leave it equal to the sample/API name; add a `namespace-collision` PATTERNS anchor documenting CS0118.
- **Generalizes:** every universal-samples app is named after its WinRT API and shares `namespace SDKTemplate` → same collision corpus-wide.

## 2. `Style.BasedOn` migrated to `{ThemeResource}` (WMC0141) — WRONG guidance
- **Evidence:** turn 65 `App.xaml(14,14): WMC0141: Style BasedOn property must be a Style, not 'ThemeResourceExtension'`; source Styles.xaml uses `BasedOn="{StaticResource BodyTextBlockStyle}"`.
- **Skill state:** MIGRATION-PATTERNS.md line 549 says migrate "brushes / **styles**" to `{ThemeResource}` — over-broad; breaks `BasedOn`.
- **Fix:** scope `{ThemeResource}` to brush/value setters; add explicit rule that `Style.BasedOn` stays `{StaticResource}`.
- **Generalizes:** shared `Styles.xaml` (BasedOn StaticResource) ships in every sample; BasedOn-must-be-StaticResource is a general WinUI XAML-compile constraint.
