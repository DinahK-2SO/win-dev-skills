# PenHaptics — Lessons

**Outcome:** score 80/100, builds clean, runs. 4/5 scenarios pass; **Scenario 1 (Ink Canvas Tactile Feedback) FAILs** — dropped entirely from the WinUI navigation.

## Root cause (single, high-leverage, generalizable)
`Initialize-UwpMigration.ps1` auto-collapses **any** file containing an `unsupported`
inventory hit to `Triage = defer` ("any hit collapses the file to defer", script §1).
`InkCanvas` is an unsupported entry, so the whole `Scenario1_InkCanvasTactileFeedback`
page was labeled `defer` / `unsupported-only` (see `.bootstrap-meta.json deferredCount:1`,
mapping L303). `SKILL.md` navigation invariant #4 then told the agent that "deferred items
are **omitted** from the navigation surface", so it registered only 4 scenarios — losing
one whole scenario the UWP app has.

This **contradicts** the skill's own placeholder guidance (`SKILL.md` L229-236 and
`MIGRATION-PATTERNS.md` L57-65): a page whose hero control is unsupported should be **kept**
with a visible declarative placeholder, not dropped.

## dev_agent_struggles
- **SampleConfiguration.cs nav:** followed the pre-seeded `defer` label mechanically; only
  4/5 scenarios registered. Preventable by fixing the tooling collapse + the invariant #4
  contradiction (both below).

## Tool notes
- `Initialize-UwpMigration.ps1` — helpful bootstrap, but cannot tell a whole-file-killing
  unsupported API (CoreWindow, phone, kiosk) from a single unsupported **visual hero control**
  on an otherwise-migratable scenario page. It defers both.
- `InkCanvas`/`InkToolbar` are genuinely absent from the **stable** WinAppSDK channel
  (experimental-only) — so deferring the *control* is defensible; deferring the *scenario*
  is not.
