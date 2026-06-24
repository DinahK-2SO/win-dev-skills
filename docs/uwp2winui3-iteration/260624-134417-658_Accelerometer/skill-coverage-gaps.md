# Skill coverage gaps — Accelerometer (→ change skill)

Both gaps live in `MIGRATION-PATTERNS.md#startup-crashes`; the content exists but is too weak to stop the agent.

### 1. "Throw at `Application.Start` ⇒ blame the entry point" rabbit hole + MTA regression
- **Evidence:** crash at `Application.Start` reproduced with the correct generated `[STAThread]` Main (session-log L5200-5206); agent then "Let me try adding a custom Program.cs to override with MTA threading" (L7815); final csproj has `DISABLE_XAML_GENERATED_MAIN` and `Program.cs` Main lacks `[STAThread]`+`InitializeComWrappers()`.
- **Covered at:** L297 blockquote + SKILL.md L134 parenthetical — but buried; the `0x8001010E` table row (L293) lists only "UWP API in a static initializer".
- **Fix:** promote to a prominent ANTI-PATTERN naming the forbidden edits ([STAThread] removal / MTA / `DISABLE_XAML_GENERATED_MAIN` / hand-rolled `Program.cs`); state a throw at `Application.Start` does not implicate the entry point.
- **Generalizes:** every WinUI 3 startup crash bottoms out at `Application.Start <- Program.Main`.

### 2. Where is `Program.Main`?
- **Evidence:** ~250+ turns (L5207-7815) searching NuGet/targets/templates for the entry point.
- **Covered at:** not stated anywhere.
- **Fix:** one sentence — `Program.Main` is auto-generated into `obj/.../App.g.i.cs` (gated by `DISABLE_XAML_GENERATED_MAIN`); you normally have no `Program.cs`, don't search for it or create one.
- **Generalizes:** recurring confusion on any startup-crash trial.
