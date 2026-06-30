# CameraProfile — Skill Coverage Gaps (WILL change skill)

## 1. SDKTemplate sample-shell helpers under-named in the Shell-conversion table  *(Tier 3, prose)*
- **Problem:** Agent spent several turns reconstructing `MainPage.Current`, `NotifyUser`/
  `NotifyType`, `SampleConfiguration.cs` (partial `MainPage`), App.xaml sample styles, and the
  `SDKTemplate` → app-namespace consolidation.
- **Evidence:** build-events.jsonl R9-R11.
- **Covered at:** SKILL.md Step 1 Shell-conversion table — `MainPage + ListView + Frame
  (SDK-sample idiom)` row (names the idiom but not its helper scaffolding).
- **Why missed:** under-emphasized — the row points at the control mapping but not the
  SDKTemplate helpers/namespace every sample carries.
- **Improvement:** Add a few-line note under that row listing the helpers to recreate and the
  namespace consolidation. Sharpen existing content; no new topic.
- **Generalizes:** The whole Windows-universal-samples corpus shares this exact shell.
