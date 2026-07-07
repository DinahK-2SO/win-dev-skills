# Dev-agent slips — LanguageFont (will NOT change skill)

## 1. CS8618 nullable warnings on SDK-sample idiom
- **Evidence:** session-log TURN 29-31 — agent made `Scenario.Title/ClassType` and
  `MainPage.Current` nullable and null-guarded `Find`/`Navigate`; rebuilt to 0 warnings.
- **Why no skill change:** routine nullable-reference hygiene, not a UWP→WinUI 3 pattern;
  resolved in one pass without looping.

_(Eval-tool caveats — blank WinUI screenshots, font-only behavioral false-negative,
non-UIA UWP golden — are measurement limitations, not agent slips or migration-skill
issues; they are deferred to human in the improvement plan.)_
