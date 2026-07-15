# Parity Discrepancies — CameraAdvancedCapture (UWP → WinUI 3)

## Summary
The migrated WinUI 3 app is a **faithful replica** of the original UWP single-page
camera app. All source controls are present in the WinUI UIA tree with correct
`AutomationId`s, the layout matches, and the app renders a non-blank frame. No missing
controls, no dead-control regressions.

## Ground-truth capture notes
- **UWP golden**: launched successfully via `uwp-app-runner` (`ok:true`, window title
  "Camera Advanced Capture C# Sample", SDK 10.0.26100.0). This machine has **no camera
  device**, so the running UWP app remained on its extended splash ("Windows platform
  sample") and its content Pane exposed no interactive XAML controls. The UWP controls
  were therefore never in a *responding* state to compare against.
- **WinUI 3 candidate**: built clean (`dotnet build`), launched via `winapp run`
  (PID 10716), rendered a full non-blank frame.

## Control-by-control comparison (from source + live UIA)
| Control | UWP source | WinUI UIA | Verdict |
|---|---|---|---|
| PreviewControl (camera preview) | CaptureElement | Image `PreviewControl` (offscreen w/o camera) | present |
| CycleModeButton + ModeTextBlock "Standard" | Button (disabled until camera) | Button `CycleModeButton` [disabled] + Text "Standard" | present, correctly gated |
| PhotoButton | Button (disabled until camera) | Button `PhotoButton` [disabled] | present, correctly gated |
| HDR Analyzer label | TextBlock | Text "HDR Analyzer:" | present |
| HdrImpactBar | ProgressBar | ProgressBar `HdrImpactBar` | present |
| SceneTypeTextBlock | TextBlock | Text `SceneTypeTextBlock` | present |

## Behavioral note
Both `CycleModeButton` and `PhotoButton` start disabled and only enable after successful
camera initialization (`IsEnabled="False"` in both UWP and WinUI source). With no camera
present, both are correctly disabled in the WinUI app — this **matches** the UWP intent,
not a regression. The UWP golden could not demonstrate a responding control on this
hardware, so there is no "responded in UWP but dead in WinUI" downgrade to apply.

## Enhancements over the original (not defects)
- WinUI adds a graceful **FallbackPanel** ("This sample requires a camera device that is
  not available on this machine." / "No camera device was found on this machine.")
  making the no-camera state visible instead of an empty preview.

## Discrepancies found
None material. The only limitation is environmental: the live UWP visual could not be
fully compared because the original app stayed on its splash on this camera-less machine.
Structural + source comparison confirms full parity.

## Instrument note
`Extract-UwpFeatureChecklist.ps1` scanned only the `cs` folder; this sample keeps its
XAML in the sibling `shared\` folder, so the generated checklist listed 0 controls and
the structural gate was trivially satisfied. The verdict above is based on direct
inspection of the source XAML and the live WinUI UIA tree, not the empty checklist.
