# Lessons — AdaptiveStreaming (iteration 1)

## Score: 21/100 | Builds: ✅ | Runs: ✅ (main page only)

## Root Cause Summary

**Single dominant failure:** All 17/18 features failed because `SharedContent/xaml/Styles.xaml` was not included in the WinUI 3 app. Scenario pages reference `{StaticResource SampleHeaderTextStyle}` and `{StaticResource ScenarioDescriptionTextStyle}` which are undefined at runtime → XamlParseException on every `Frame.Navigate()`.

## Tools

| Tool | Verdict | Evidence |
|------|---------|----------|
| Initialize-UwpMigration.ps1 | Helpful but incomplete | Successfully bootstrapped 121-row mapping, but doesn't handle SharedContent |
| Validate-UwpMigration.ps1 | Passed despite critical gap | All 7 checks pass — smoke launch only verifies app survives startup, not navigation |

## Key Struggles

1. **SharedContent not migrated** (turns 28-35): Agent read `Styles.xaml` but had no guidance on incorporating external shared resources → left as reference-only → all scenarios broken at runtime.

2. **HTTP type ambiguity** (turns 85-93): `Windows.Web.Http.HttpMethod` vs `System.Net.Http.HttpMethod` after namespace migration. Resolved in ~8 turns by explicit qualification.

## Missing Tooling

- **StaticResource resolution validator**: Would catch undefined resource keys before the trial ends. The build succeeds because XAML resources are resolved at runtime, not compile time.

## Preventable By

- Skill section on handling external shared resource files (copy + merge into App.xaml ResourceDictionary)
- Initialize-UwpMigration.ps1 `-SharedContent` parameter to auto-process shared resource dictionaries
