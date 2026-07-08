# Skill Coverage Gaps (skill present but unclear → sharpen)

## 1. Startup-crash table doesn't name the `BasedOn` XamlParseException
- **Evidence:** session-log.txt 7694/7931/7959 — startup crash in Microsoft.UI.Xaml.dll traced to
  `App.xaml` Style `BasedOn={StaticResource TitleTextBlockStyle}`; fixed by inlining setters.
- **Covered at:** MIGRATION-PATTERNS.md#startup-crashes, 0xE0434352 row (previously only mentioned
  TypeLoadException/FileNotFoundException).
- **Improvement:** extended that row to name the `XamlParseException` from an unresolvable
  App.xaml-level Style `BasedOn={StaticResource <system text style>}` (from UWP SharedContent
  Styles.xaml) + the fix (inline setters or move into a theme-merging ResourceDictionary).
- **Generalizes:** UWP SDK samples ship these shared styles universally; recurs across scenarios.
