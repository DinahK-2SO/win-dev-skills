# Skill Defects — AdaptiveStreaming (iteration 1)

**Category: skill-defect** → WILL change skill

## Item 1: Missing guidance on shared/external XAML ResourceDictionaries

- **Problem**: SharedContent/xaml/Styles.xaml (defining `SampleHeaderTextStyle`, `ScenarioDescriptionTextStyle`) was not migrated into the WinUI 3 app
- **Evidence**: All 7 requirements fail. Agent read the file (turns 28-35) but had no guidance on what to do with it. App.xaml has empty MergedDictionaries.
- **Skill search**: Grepped for SharedContent, ResourceDictionary, merged dict, Styles.xaml, StaticResource, shared project — **nothing found**
- **Skill state**: absent
- **Root cause**: Skill has zero guidance on external shared resource files. Bootstrap only copies from -Source.
- **Proposed fix**: Add "Handling shared/external resources" section to SKILL.md + add `-SharedContent` param to Initialize-UwpMigration.ps1
- **Generalizes**: Nearly every multi-scenario SDK sample uses SharedContent/xaml/Styles.xaml. Any multi-project UWP solution with shared styles hits this.

## Item 2: No guidance on runtime StaticResource resolution failures

- **Problem**: Build passes, startup passes, but page navigation silently fails due to undefined resource keys
- **Evidence**: Validate-UwpMigration.ps1 reports PASS. All scenario pages throw XamlParseException only when navigated to.
- **Skill search**: Grepped for StaticResource resolution, runtime error, XamlParse, navigation — **nothing found**
- **Skill state**: absent
- **Root cause**: Step 3 only covers build errors + startup crashes. XAML resource resolution happens at page parse time.
- **Proposed fix**: Add guidance that page navigation must be verified, and that missing StaticResource keys fail silently (no build error, no startup crash)
- **Generalizes**: Any migration with non-trivial resource structures (merged dictionaries, theme resources) will silently fail at navigation time.
