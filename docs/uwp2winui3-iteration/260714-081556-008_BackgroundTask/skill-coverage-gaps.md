# Skill coverage gaps — BackgroundTask (WILL change skill)

## G1 — "Carry over UWP <Extensions>" is buried
- **Problem:** The manifest checklist never explicitly tells the agent to merge the UWP manifest's
  `<Extensions>` into the WinUI 3 build manifest; it's only a parenthetical inside the image-reference
  paragraph. The agent left both `windows.backgroundTasks` extensions in an unused nested manifest.
- **Covered at:** `Package.appxmanifest — reconcile image references` (~line 455 parenthetical) and
  `Manifest migration checklist` (~lines 473-505, no extensions step).
- **Why missed:** under-emphasized.
- **Improvement:** add an explicit checklist step: carry over every `<Extension>` (backgroundTasks,
  protocol, fileTypeAssociation, appService, shareTarget) — they are activation/registration
  prerequisites; omitting them fails at runtime (often a dead control), not at build.
- **Generalizes:** protocol/file/app-service/share-target/background-task apps all silently lose the
  feature otherwise.
