# Dev-agent slips — CameraVideoStabilization (no skill change)

## 1. Deferred camera functionality (no-op handlers, disabled buttons)
- Deferring `CaptureElement` is exactly what `PATTERNS.md#capture` prescribes. On a
  camera-less box the UWP golden's buttons are also disabled → `behavioral_regressions=0`.
- **No skill edit** — the deferral is correct. The only fixable issue is the blank render
  (handled as a coverage gap).

## 2. Overlay buttons clipped at the right edge
- The migration faithfully preserved the UWP edge-anchored `StackPanel`
  (`HorizontalAlignment="Right"`); the UWP golden places the same buttons at the right
  edge. The clipping is a per-pixel window-sizing artifact, **scenario-specific**.
- **No skill edit** — a general "add margins to edge-anchored controls" rule would over-fit
  and could damage faithful layouts elsewhere. The visible-placeholder change (which fills
  the page center) is the correct general remedy.
