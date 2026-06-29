# Skill defects — CameraGetPreviewFrame (WILL change skill)

## 1. CaptureElement steered to "defer" despite a working preview migration path
- **Evidence:** session-log turns 33-35 — agent replaced `PreviewControl.Source=_mediaCapture`
  with a `DispatcherTimer` `GetPreviewFrameAsync` → `<Image>` loop and scored 4/4 parity.
- **Skill state:** *wrong.* PATTERNS.md said CaptureElement has "no compatible replacement"
  and to mark the file `defer`; `unsupported-api-inventory.json` listed it under `unsupported`
  (any hit collapses the file to triage label `defer`, and the validator would flag a migrated
  preview as residue).
- **Root cause:** conflates a missing XAML *control* with a missing *feature*. Live preview
  migrates via a frame loop or `MediaPlayerElement`+`MediaFrameSource`.
- **Fix:** new PATTERNS.md `#capture` section + rewrite the CS0246 note to route there; move
  CaptureElement to `adaptable` (anchor:capture, tier:sensitive) in the inventory.
- **Generalizes:** every UWP camera SDK sample hosts preview in CaptureElement.

## 2. Application.Suspending/Resuming — no replacement documented (CS1061)
- **Evidence:** `error CS1061: Application does not contain a definition for Suspending`;
  turns 30-38 churned before rewiring to `Window.Activated`.
- **Skill state:** *absent.* The lifecycle section covers activation only.
- **Root cause:** Suspending/Resuming are removed in WinUI 3 desktop; the foreground/background
  resource handling they drive must move to `Window.Activated`.
- **Fix:** add `Suspend/Resume -> Window.Activated` to `#lifecycle`, a CS1061 build-error entry,
  and a `.Suspending/.Resuming` analyzer entry (anchor:lifecycle).
- **Generalizes:** any UWP sample owning a hardware/media resource subscribes to these events.
