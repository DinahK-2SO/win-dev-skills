# Discrepancies — ApplicationData (UWP → WinUI 3)

**No functional discrepancies found.** Both scenarios are structurally complete and
behaviorally correct in the WinUI 3 migration, verified directly via UI Automation
against the UWP source semantics.

## Per-feature verification

### Scenario 1 — Clear
- `Clear` button present in the WinUI UIA tree (`btn-clear-73b7`, AutomationId set).
- Invoking it set `OutputTextBlock` to
  *"ApplicationData has been cleared.  Visit the other scenarios to see that their data
  has been cleared."* — an exact match for the UWP `Clear_Click` handler. **LIVE / correct.**

### Scenario 2 — SetVersion
- `SetVersion0` ("Set version to 0") and `SetVersion1` ("Set version to 1") buttons both
  present (AutomationIds `SetVersion0` / `SetVersion1`).
- Initial `OutputTextBlock` = "Version: 0" via `OnNavigatedTo` → `DisplayOutput()`.
- Invoking "Set version to 1" → `OutputTextBlock` = "Version: 1".
- Invoking "Set version to 0" → `OutputTextBlock` = "Version: 0".
- Matches the UWP `SetVersion0_Click` / `SetVersion1_Click` + `DisplayOutput` semantics.
  The automated sweep's "Set version to 0 = noop" is expected (the version was already 0),
  not a dead control. **LIVE / correct.**

## Environment limitations (not migration defects)

1. **UWP UIA unavailable.** The original UWP app launched and rendered (Clear-scenario
   visual golden captured), but its CoreWindow exposed 0 elements to `winapp`'s UIA, so the
   UWP app could not be driven per-control and no automated UWP behavioral golden exists.
   Behavioral grading therefore used the UWP **source** semantics as the reference.
2. **WinUI screenshots blank.** `winapp`'s PrintWindow capture returned blank frames for the
   WinUI 3 swapchain window and a full-screen capture failed ("handle is invalid") because
   this is a headless session with no interactive desktop surface. The WinUI UIA tree was
   fully populated with real on-screen content and every control responded live, confirming
   correct rendering. Visual pixel comparison was thus not possible; structural + behavioral
   checks (both PASS) were used instead.
