# Skill coverage gaps — CameraVideoStabilization

## 1. Deferred hero control → page renders blank (no visible declarative placeholder)
- **Problem:** the page's only visible surface (the camera `CaptureElement`) was correctly
  deferred, but the substitute was wired in `OnNavigatedTo` and the page rendered **blank
  white** (scored FAIL).
- **Already covered at:** `PATTERNS.md#capture` ("don't fake the element") + `SKILL.md`
  *Defensive UI* ("on catch, swap to a visible fallback"). Both exist but only fire for
  the build-error and the *throwing-init* cases — not for a **deferred-content page**,
  which does not throw.
- **Why missed:** grey-zone / under-emphasized; the "visible fallback" is framed as
  runtime try/catch code, which the agent rendered as `OnNavigatedTo` text that did not
  visibly appear.
- **Improvement (sharpen existing):**
  - `PATTERNS.md#capture`: add a positive instruction to replace a deferred hero/preview
    control with a **visible declarative XAML placeholder** (Border filling the cell +
    centered TextBlock), not code-behind text.
  - `SKILL.md` Defensive-UI Rule: extend it to **deferred-content** pages and prefer a
    declarative placeholder over `OnNavigatedTo`/`Loaded`-only text.
- **Generalizes:** every SDK sample built around a single unsupported hero control
  (CaptureElement, InkCanvas, MapControl, …) — deferring it must not produce a blank page.
