# ApplicationResources — scoring rubric

Derived from the UWP source feature checklist and the live UWP golden capture.

> Note: `Extract-UwpFeatureChecklist.ps1` flattened this sample to a single
> `MainPage` feature (it found no scenario list in `SampleConfiguration.cs`). The
> live UWP app actually shows a 13-item scenario `ListBox`. The rubric scores the
> single extracted feature — the MainPage shell that hosts the scenario list and the
> shared status/output region.

## Feature 1 — ApplicationResources (`MainPage`), weight 1.0

**Required controls (UIA coverage gate):**
- `ScenarioControl` (ListBox / scenario list)
- `Trademarks` (HyperlinkButton)
- `PrivacyLink` (HyperlinkButton)
- `WindowsLogo` (Image)

**Actions:**
- Trademarks → opens external trademarks page (no in-app visual response; dead in UWP golden too)
- Privacy → opens external privacy page (no in-app visual response; dead in UWP golden too)

**Output elements:** SampleTitle, Copyright, StatusLabel, StatusBlock, Header

**PASS** — page renders visibly, title + scenario list + output region match the UWP
golden, all controls present, actions behave as in UWP.

**FAIL** — blank/empty render, missing scenario list, or dropped controls.
