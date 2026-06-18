# Lessons — AdaptiveStreaming (Iteration 1)

**Score: 78 | Builds: ✅ | Runs: ✅ | 301 tool calls | 12 builds (6 failed → 6 succeeded)**

## Key Findings

### 1. Sub-agent delegation failed repeatedly
The outer agent tried to delegate the full migration to a background sub-agent **4 times**. Each attempt failed or was incomplete. The outer agent ended up doing all the work itself (~L873 onward). The migration scope (15+ files, 7 scenarios, 20 TODOs) was too large for a single sub-agent context.

**Fix:** Skill should scaffold more automatically (e.g., pre-copy SharedContent with namespace replacements) or provide a step-by-step checklist.

### 2. Six consecutive build failures
| # | Error | Root Cause | Fix |
|---|-------|-----------|-----|
| 1 | NETSDK1022 duplicate Page | SDK auto-globs .xaml; explicit entries duplicated | Remove explicit Page items |
| 2 | CS0104 HttpClient ambiguity | Implicit `System.Net.Http` vs `Windows.Web.Http` | `<Using Remove="System.Net.Http" />` |
| 3–6 | WMC9999 path not found | Long benchmark path + stale obj cache | Clean obj/bin + retry |

**Fix:** Skill csproj template should not add explicit Page items and should auto-detect `Windows.Web.Http` usage.

### 3. Threading TODO pattern incomplete
20 `Dispatcher.RunAsync → DispatcherQueue.TryEnqueue` TODOs were correctly placed, but the TODO text didn't mention that **callers must also drop `await`** since `TryEnqueue` returns `bool`, not `Task`. Agent discovered this through CS4008/CS0029 compile errors.

**Fix:** PATTERNS.md `#threading` section or TODO template should explicitly note caller-side changes.

### 4. PlayReadyHelper.cs UWP residue
File was marked `migrate-as-is` so bootstrap didn't scan it for removable `using Windows.UI.Core`. Agent found and fixed it manually.

**Fix:** Bootstrap should scan all files (including migrate-as-is) for UWP-only using directives.

### 5. MediaPlayerElement layout issue (root cause of score deduction)
In scenarios 3, 4, and 7, the MediaPlayerElement in `Grid.Row="1"` (star-height) is squeezed to ~30–80px because the Row 0 (`Height="Auto"`) containing description + controls expands to fill most of the window. Transport controls are invisible.

**Fix:** Skill should document that pages with tall control panels need `MinHeight` on the MediaPlayerElement row, or use a `ScrollViewer` in Row 0 with `MaxHeight` to cap its expansion.

## Tools

| Tool | Assessment |
|------|-----------|
| Bootstrap script | ✅ Helpful — correctly identified TODOs, mapped files |
| Validate-UwpMigration | ✅ Helpful — caught Styles.xaml residue |
| Sub-agent delegation | ❌ Failed 4 times; outer agent did all work |

## Missing Tooling
- **SharedContent copier** — automated copy + namespace replacement would save ~200 events
- **Grid layout guidance** — MediaPlayerElement MinHeight recommendation in migration docs
