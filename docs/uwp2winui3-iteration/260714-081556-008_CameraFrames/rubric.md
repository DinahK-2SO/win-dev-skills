# UWP Feature Rubric: CameraFrames

**Created:** 2026-07-16T16:00:03Z
**UWP capture status:** partial — UWP launched via `uwp-app-runner` (`ok:true`, pid 20260) and scenario 1 was captured live from the CoreWindow (hwnd 918596). The UWP UI thread then hung (`Responding=false`) with no camera present, freezing on "No source groups found". The legacy CoreWindow exposes an opaque UIA tree (single Pane, no child controls), so scenario 2 could not be driven via UIA or simulated input. Scenario 2's reference is therefore source-derived.

---

## Scenario 1 / Shared mode access to color, depth and infrared frame sources

**ID:** `scenario-1-shared-mode`
**Weight:** 1

Displays multiple frame sources (color/depth/infrared) simultaneously in shared mode. Has a "Next Source Group" button to cycle source groups, three preview panes labelled Color/Depth/Infrared frame source, and a status/output text line.

**Expected behaviour:**
- Reachable from the navigation list with the verbatim title
- Description reads "Display multiple frame sources to screen simultaneously in shared mode access."
- "Next Source Group" button present and invokable
- Three labelled preview areas: Color / Depth / Infrared frame source
- Status/output line reports source-group state (e.g. "No source groups found." with no camera)

**UWP reference screenshot:**
![scenario-1](parity/baseline/screenshots/01_Shared_mode_access_to_color_depth_and_infrared_frame_sources.png)

---

## Scenario 2 / Find and display all media frame sources

**ID:** `scenario-2-find-sources`
**Weight:** 1

Enumerates frame sources and initializes a selected source via a frame reader. Provides three ComboBoxes (Source Group, Frame Source, Media Format) and Start/Stop buttons, plus a preview image and output text.

**Expected behaviour:**
- Reachable from the navigation list with the verbatim title
- Description reads "Enumerate frame sources, and initialize selected source using frame reader and display frames on screen."
- Three ComboBoxes: Source Group ("Select ..."), Frame Source ("Select ..."), Media Format ("Default format")
- Start and Stop buttons present; disabled until a source group is selected (no camera => remain disabled)
- Output/status text area present

**UWP reference screenshot:**
_UWP screenshot not captured (app UI thread hung on no-camera hardware before scenario 2 could be navigated; reference is source-derived)._
