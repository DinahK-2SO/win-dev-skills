# Parity Rubric — SimpleImaging (UWP → WinUI 3)

Ground-truth feature list derived from the original UWP source and confirmed against
the live UWP golden capture (`parity/baseline/screenshots/00_launch.png`).

## Scenario 1 — Image properties (FileProperties)
Reads/edits bitmap properties via `Windows.Storage.FileProperties`.

- **Actions (buttons):** Open, Save, Close
- **Controls (14):** OpenButton, ApplyButton (Save), CloseButton, PreviewImage,
  TitleTextbox, KeywordsTextbox, Latitude (Deg/Min/Sec/Ref) textboxes,
  Longitude (Deg/Min/Sec/Ref) textboxes
- **Outputs:** Title, Keywords, Latitude, Longitude, Date Taken, Camera make,
  Camera model, EXIF orientation, Exposure, F Number, status message

## Scenario 2 — Image transforms/encode (BitmapDecoder)
Decodes, rotates and re-encodes an image via `BitmapDecoder`/`BitmapEncoder`.

- **Actions (buttons):** Open, Left 90°, Right 90°, Save, Save as, Close
- **Controls (8):** OpenButton, RotateLeftButton, RotateRightButton, SaveButton,
  SaveAsButton, CloseButton, PreviewImage, ScaleSlider
- **Outputs:** Scale, Width, Height, User rotation, EXIF orientation, status message

## Grading
`score = round(100 * (pass + 0.5*partial) / features_total)`, 0 if the migrated app
cannot run. A control present but DEAD (responds in UWP, not in WinUI) is at best
`partial`, never `pass`.
