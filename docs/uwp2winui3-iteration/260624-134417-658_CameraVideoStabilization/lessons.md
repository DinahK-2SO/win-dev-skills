# Lessons — CameraVideoStabilization (UWP → WinUI 3), iteration 1

**Outcome:** build SUCCEEDED, app launched, **score 0 / 1 feature FAIL** — the single
migrated page renders **blank/white** (two byte-identical 7,464-byte captures).

## What went right
- The agent correctly identified `CaptureElement` (the camera preview hero control) as
  **unsupported → defer**, driven by `unsupported-api-inventory.json` (session-log L2058)
  and `PATTERNS.md#capture`. It did **not** try to fake the type. This is exactly what
  the skill prescribes.
- `Validate-UwpMigration.ps1` caught a residual `CaptureElement` token left in an XAML
  comment (L3553) and the agent sanitized it (L3561). Good signal.

## The core struggle (high-value)
- The whole page's visible surface **was** the camera preview. After deferral, the page
  was left with:
  1. a fallback message assigned in **`OnNavigatedTo`** (code-path dependent), and
  2. two overlay buttons anchored `HorizontalAlignment="Right"` flush to the window edge.
- Result on screen: **blank white**. The fallback text exists in the UIA tree but is not
  visibly rendered; the buttons are pushed to x=1248 in a 1280-wide window and clipped.
- The agent never caught this because the only launch tool (`Test-AppLaunch.ps1`) proves
  **process-alive only** — it cannot see a blank page.

## Root cause / preventable by
A deferred **hero/preview** control leaves the page with no reliably-visible content. The
skill tells the agent *not to fake the control* and tells it to *swap to a visible
fallback when init throws* — but a deferred-content page **does not throw**, so it falls
between the two pieces of guidance. Prevent by instructing: replace a deferred hero
control with a **visible declarative XAML placeholder** (Border filling the cell +
centered TextBlock), never relying on `OnNavigatedTo`/`Loaded` to populate the only
visible content.

## Errors encountered
- Residual `CaptureElement` identifier in an XAML comment → validator residue grep
  flagged it → rewrote comment to reference `PATTERNS.md#capture`.

## Environment
- No camera on the validation box → both buttons disabled in UWP **and** WinUI, matching
  the golden. So the disabled/no-op buttons are **not** a new behavioral regression; the
  fail is the blank render.
