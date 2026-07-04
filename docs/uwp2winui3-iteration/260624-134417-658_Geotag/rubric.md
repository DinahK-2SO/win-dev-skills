# UWP Feature Rubric — Geotag C# Sample

Derived from the UWP source checklist (`parity/baseline/checklist.json`) and the live
UWP golden capture.

## Scenario 1 — Geotag a file

Controls (in source order):

1. **Choose file** (Button) — opens a file picker to select a JPEG/MP4. *Gates the rest.*
2. **Read geotag from file** (Button) — reads existing geolocation from the chosen file. *File-gated.*
3. **Set geotag from geolocator** (Button) — writes current device geolocation into the file. *File-gated.*
4. **Set geotag to Seattle Space Needle** (Button) — writes a fixed coordinate into the file. *File-gated.*

Outputs:
- `FileDisplayName` (Run) — name of the chosen file.
- `StatusBorder` / `StatusBlock` (shared TextBlocks) — status/result messages.

## Scoring guidance

- The initial screen (before choosing a file) shows only the **Choose file** button plus
  the Description text and the nav pane. Buttons 2–4 surface only after a file is chosen.
- A faithful migration must, at minimum, **render** the nav pane, sample title,
  description, and Choose file button (the UWP golden does). A blank page is FAIL.
- Choose file must open a file picker; the file-gated buttons must then read/write geotag
  data and update the status text.
