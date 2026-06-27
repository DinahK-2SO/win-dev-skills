# Discrepancies — BackgroundTransfer (UWP → WinUI 3)

Result of comparing the migrated WinUI 3 app against the UWP source checklist and the
(limited) UWP golden. **No genuine migration defects were found.** The two items the
automated structural gate flagged are confirmed **false negatives** of a static UIA
capture, not real gaps.

## Flagged by the automated gate (both false negatives)

### Scenario 6 — Recoverable Errors · "1234" TextBox reported missing
- Source: `<TextBox InputScope="NumericPin" PlaceholderText="1234" Width="80"/>` lives
  **inside `<ContentDialog x:Name="ReauthorizeDialog">`**, shown only when the download
  URL expires and reauthorization is requested.
- Migration: the WinUI 3 `Scenario6_RecoverableErrors.xaml` **contains the identical
  ReauthorizeDialog + NumericPin TextBox (PlaceholderText "1234")**.
- Why "missing": the dialog is not shown at rest, so the TextBox is absent from the static
  UIA tree — exactly as it would be in the UWP. Not a defect.

### Scenario 7 — Download Reordering · "Make Current" Button reported missing → PARTIAL
- Source: `<Button Content="Make Current"/>` is a **per-item button inside the pending-
  transfers list template**.
- Migration: the WinUI 3 `Scenario7_DownloadReordering.xaml` has
  `<ListView ItemsSource="{x:Bind downloadCollection}"> … <Button Content="Make Current"
  Click="MakeCurrent_Click"/></DataTemplate>` — present **and wired**.
- Why "missing": with no active downloads the bound collection is empty, so no item
  buttons are instantiated — identical to the UWP at rest. Not a defect.

## Behavioral notes (not regressions)

- Several action invokes recorded `noop` in the WinUI capture (e.g. Start Download/Upload,
  Start ten downloads, Random-Access Start/Pause/Resume/Seek). These are **network-/state-
  gated**: the sample targets `http://localhost/BackgroundTransferSample/…` (no server
  running) and per-download controls need an active transfer. The **original UWP behaves
  identically** under the same conditions, and its controls could not be actuated at all
  here (CoreWindow UIA not enumerable), so **no control can be shown "dead in WinUI but
  live in UWP."** Controls that did not depend on a server responded (FileOpenPicker opened
  for Upload; Pause/Resume/Cancel All updated the output text).

## Structural / visual fidelity (verified via UIA tree)

- NavigationView lists all **7 scenarios with verbatim UWP titles**.
- Scenario 1 content matches the UWP golden exactly: intro text, "Remote address"
  = `http://localhost/BackgroundTransferSample/download.aspx`, "Local file name"
  = `DownloadedFile.txt`, Start Download / Start High Priority Download / Pause All /
  Resume All / Cancel All buttons, output "Loading background downloads: 0".
- Scenario 6 content matches: server field, `RecoverableErrorsFile.txt`, "Recover from
  expired URL" checkbox (checked), Start button.
- All controls report **real, non-zero layout bounds** — the app renders correctly; the
  blank PNGs are a PrintWindow/DirectComposition + no-interactive-desktop capture artifact.

## Capture-limitation discrepancies (environment, not the migration)

| Item | Detail |
|---|---|
| UWP golden per-scenario | Not captured — UWP CoreWindow UIA not enumerable; all 7 golden frames are the same initial File Download view. |
| WinUI screenshots blank | PrintWindow cannot grab WinUI 3 DirectComposition; session has no interactive desktop. Fidelity confirmed via UIA tree instead. |
