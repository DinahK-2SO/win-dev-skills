# Skill coverage gaps — CameraGetPreviewFrame (WILL change skill)

## 1. SystemMediaTransportControls.GetForCurrentView() missing from the GetForCurrentView table
- **Evidence:** session-log turn 31 — agent swapped the SMTC `SoundLevel==Muted` foreground
  proxy for `Window_Activated`; the migrate-005 TODO routed to `#getforcurrentview`, but that
  table didn't list SMTC.
- **Covered at:** `## GetForCurrentView() Replacements` table (other GetForCurrentView APIs only).
- **Why missed:** under-emphasized (relevant section exists; this row absent).
- **Improvement:** add an SMTC row → `Window.Activated` / `#lifecycle` (folded into the
  lifecycle defect fix).
- **Generalizes:** camera/audio samples use SMTC mute as a minimize signal across scenarios.
