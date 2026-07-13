# Discrepancies — AssociationLaunching (WinUI 3 vs. UWP)

## Measurement caveat (not a migration defect)
- **UWP behavioral golden unavailable.** `uwp-app-runner` launched the original app
  (`ok:true`, pid 22876, window "AssociationLaunching C# sample"), so the hard launch
  gate passed. However the legacy .NET Native app stayed on the SDK sample-framework
  splash ("Windows platform sample") and never presented its inner XAML content to UI
  Automation (empty content Pane, all 17 golden frames identical splash bitmaps). No
  per-control behavioral golden could be captured. The WinUI app was therefore graded
  against the **source-derived checklist** plus direct visual/structural/behavioral
  judgment of the migrated app against the UWP source code. This is a property of the
  legacy sample on this machine, not a defect of the migration.

## Per-feature findings (WinUI 3 candidate)
- **1. Launching a file** — 6/6 controls present; renders full SDK-sample layout.
  `Launch default handler` (+status text), `Launch with warning` (+status text) respond;
  `Launch Open With` and `Launch with view preference` produced no in-app text under
  automated invoke because they raise a system Open-With dialog / FileOpenPicker — the
  same behavior as the UWP source handlers. No discrepancy.
- **2. Launching a URI** — 6/6 controls; 3/4 actions emit status text; `Launch Open With`
  raises the system dialog (matches source). No discrepancy.
- **3. Receiving a file** — 3/3 controls; the migrated handlers are line-for-line faithful
  to the UWP source (create file in PicturesLibrary + `LaunchFolderAsync`, delete files).
  These actions intentionally emit **no in-app status text** in the original, so the
  "0/3 text responses" is expected, not a dead-control regression.
- **4. Receiving a URI** — display-only page (0 controls, matches checklist); renders the
  correct description text. No discrepancy.

## Capture artifacts (not defects)
- Lingering "Open" file dialogs appear in the background of the Scenario 3/4 frames.
  These are `FileOpenPicker` windows opened by Scenario 1/2's automated button invokes
  (`Pick and launch`, `Launch with view preference`) that the non-interactive harness
  could not dismiss. They belong to earlier scenarios and do not indicate a Scenario 3/4
  problem.

## Net
No behavioral or structural regressions found. Structural parity gate = PASS (100%),
coverage 6/6, 6/6, 3/3, n/a. All four scenarios render non-blank with faithful layout
and behavior relative to the UWP source.
