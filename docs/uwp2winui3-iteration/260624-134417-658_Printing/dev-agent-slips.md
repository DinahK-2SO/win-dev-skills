# Dev-Agent Slips — Printing (will NOT change skill)

## 1. Startup crash from `{StaticResource}` theme brushes in Styles.xaml
- Agent diagnosed and fixed it (build-events L959→L1012) by switching to `{ThemeResource}`.
- Covered clearly at MIGRATION-PATTERNS.md "Resource references: DynamicResource → ThemeResource" (~line 779). One-off; no skill change.

## 2. Photos-scenario Print crash → Disable Preview unreachable
- No exception captured; agent never ran the print path. Printing interop (`PrintManagerInterop`) is already covered (MIGRATION-PATTERNS.md:336) and applied correctly.
- Scenario-specific async photo-preview path; no falsifiable general fix. Do not edit the skill on speculation.
