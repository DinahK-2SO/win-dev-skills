# Skill Defects (skill absent/wrong → WILL change skill)

## 1. No "source is local — never fetch from the web / retry the path" rule (SKILL.md Step 0)
- **Evidence:** Initialize threw "Source not found" (L268); 6 web_fetch to github Windows-universal-samples; same local path succeeded at Turn 22 (L736); `timeout:true`.
- **Skill state:** absent (no guidance on where source lives or not fetching from web).
- **Root cause:** Step 0 asks for `-Source <path>` but never says the source is the local prompt path, must not be fetched online, and a transient not-found should be retried on the same path.
- **Fix:** Add a Step 0 rule — UWP source is the local absolute path in the task prompt; never fetch sample source from GitHub/learn; on "Source not found", re-verify the prompt path and retry the same path.
- **Generalizes:** Every migration is driven from a local prompt path, and every sample exists on GitHub — the "go fetch it online" failure mode can recur anywhere and wastes large budget.

## 2. `Application.Suspending` not covered (MIGRATION-PATTERNS.md lifecycle)
- **Evidence:** CS1061 'Application' has no 'Suspending' (L4689), CS0103 'App' (L4563), agent fix to `CoreApplication.Suspending` (L4720/L4785). Grep for "Suspend" across the whole skill = 0 hits.
- **Skill state:** absent.
- **Root cause:** Lifecycle section covers OnLaunched/activation but omits Suspending/Resuming/OnSuspending.
- **Fix:** Add a Suspending/Resuming subsection under the lifecycle anchor — remove the subscription (desktop apps aren't OS-suspended), or use `CoreApplication.Suspending` as a compile-compatible fallback for packaged suspend/resume.
- **Generalizes:** `Application.Suspending`/`OnSuspending` is in the App.xaml.cs of the large majority of UWP samples — a near-universal build error, fixed once.
