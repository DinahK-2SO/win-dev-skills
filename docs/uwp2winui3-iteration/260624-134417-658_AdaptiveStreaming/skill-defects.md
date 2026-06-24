# Classified problems — AdaptiveStreaming

## Skill-defects (WILL change skill)
- **CS0104/CS0535 Windows.Web.Http vs System.Net.Http.** Skill has no entry. The
  WinUI 3 scaffold's `ImplicitUsings` injects a global `System.Net.Http`, colliding with
  the `Windows.Web.Http` types that `AdaptiveMediaSource`/`IHttpFilter` request-modification
  code requires. → Add a named common-build-error subsection.

## Skill-coverage-gaps (WILL change skill)
- **CS0103 `Colors` not found.** Covered only as one row in the namespace table
  (`Windows.UI.Colors → Microsoft.UI.Colors`). The bootstrap rewrites only
  `Windows.UI.Xaml`, leaving `Windows.UI` types unqualified/out of scope. → Name it as a
  common build error and note `using Microsoft.UI;` is the fix.

## Dev-agent-slips (NO skill change)
- None. The remaining items in the scorer's discrepancies are *measurement artifacts*
  (MediaPlayerElement AutomationId not projected, HTML-escaped button names, ambiguous
  text-invoke of duplicate "Set" buttons, blank headless screenshots) — not migration
  mistakes and not skill issues.
