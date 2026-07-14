# Lessons — AdaptiveStreaming (UWP → WinUI 3)

Migration outcome: **builds (0 errors), runs, 7/7 features pass.** Structural parity gate 50/100 was measurement artifacts (MediaPlayerElement automation peer + unnamed seek buttons), not missing features.

## Tools helpful
- **Initialize-UwpMigration.ps1** — scaffolded project, seeded mapping, injected 20 threading TODOs.
- **Validate-UwpMigration.ps1** — caught a UWP namespace left inside a XAML *comment* (`Styles.xaml:313`).
- **dotnet build** — actionable CS codes; clean build after fixes.

## Tools problematic
- **XAML markup compiler** — hung for minutes and emitted non-actionable `WMC9999: Object reference not set`; cleared only after the CS0104 errors were fixed.

## Errors encountered (root cause → fix)
1. **CS0104 `HttpClient` ambiguous** (x8 files) — scaffold `ImplicitUsings` injects global `using System.Net.Http`, colliding with `Windows.Web.Http`. → Added `<Using Remove="System.Net.Http" />` to `.csproj`.
2. **CS0111/CS0102 duplicate MainPage members** — `SampleConfiguration.cs` (partial of MainPage) duplicated scaffold `MainPage.xaml.cs` members. → Removed duplicates from `SampleConfiguration.cs`.
3. **WMC1509 + WMC9999, hanging build** — cascade from unresolved CS0104. → Cleared by the HttpClient fix.
4. **Validate residue FAIL** — UWP namespace inside a XAML comment. → Rewrote the comment.

## Dev-agent struggles
- **HttpClient ambiguity** (~2-3 turns) — preventable by a documented CS0104-HttpClient pattern.
- **XAML compile hang** (~8 turns of retry/timeout thrash) — same root cause; fixing CS0104 earlier avoids the WMC cascade.

## Special APIs
- `Windows.Web.Http.IHttpFilter`/`HttpClient` — keep the WinRT HTTP stack for AdaptiveMediaSource interception; resolve ambiguity by removing the implicit `System.Net.Http`, not by rewriting the HTTP calls.
- `MediaPlayerElement` — namespace-only port, but its automation peer does not project `AutomationProperties.AutomationId/Name` to the UIA tree; wrap in a named `Grid`/`Border` if the surface must be individually discoverable for accessibility.

## Doc errors
- MIGRATION-PATTERNS.md documents CS0104 **only** for `LaunchActivatedEventArgs`; the very common `Windows.Web.Http` vs `System.Net.Http` ambiguity is absent.

## Env issues
- Sample streams unfetchable offline ('Unsupported video type'); Set/seek inert — identical in the UWP golden, so no regression.
