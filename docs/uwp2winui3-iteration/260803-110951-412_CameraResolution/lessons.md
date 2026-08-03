# Lessons — CameraResolution (UWP → WinUI 3)

**Score: 83.** Builds ✅ Runs ✅. 2/3 features pass, 1 partial.

## What worked
- Bootstrap + TODO-anchor workflow drove a faithful file-by-file migration.
- `CaptureElement → Image + SoftwareBitmapSource` camera-preview pattern applied correctly.
- Defensive-UI fallback rendered non-blank screenshots on the camera-less validation box, so the only "dead" control (Initialize Camera) was a legitimate hardware-gated false positive, matched by the UWP golden.

## The one real problem (dev_agent_struggle)
The **Video Settings ComboBox was invisible to the UIA automation tree**, dropping Scenario 3 to *partial* (2/3 coverage).

- **Root cause:** the migrated ComboBoxes (`PreviewSettings`, `VideoSettings`) have only `Name` + `PlaceholderText`, no `AutomationProperties.Name`/`Header`. A placeholder-only ComboBox in WinUI 3 exposes no stable UIA Name until an item is selected, so parity/structural automation can't locate it. The agent *did* add `AutomationProperties.Name` to the nav ListBox and the preview Image — it just didn't generalize that to placeholder-labelled ComboBoxes.
- **Prevented by:** a prominent skill rule requiring every interactive control to expose a stable `AutomationProperties.Name` (or `Header`/`AutomationId`) after migration, explicitly flagging placeholder-only controls. Today that guidance exists only as a buried aside inside the `CaptureElement` camera example.

## Errors encountered
None (clean build, clean launch).
