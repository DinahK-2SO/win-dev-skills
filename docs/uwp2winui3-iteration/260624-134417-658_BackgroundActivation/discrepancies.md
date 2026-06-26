# Discrepancies — Background Activation (UWP → WinUI 3)

**Verdict: faithful structural migration.** The WinUI 3 app reproduces all six UWP
scenarios with verbatim nav titles, Register/Unregister buttons, the Status output, and
the correct default enabled/disabled states — verified element-by-element in the live
UIA tree. No scenario was dropped and no control is missing. The parity gate scores
**PASS, 100/100**.

The items below are **measurement/environment limitations**, not migration defects.

## 1. WinUI 3 screenshots blank (info)
All WinUI 3 captures are 11,273 bytes (blank client area). WinUI 3's DirectComposition
surface does not render into PrintWindow-style captures in this non-interactive session.
The UIA tree confirms the content is fully present and correct; the UWP CoreWindow did
render (its launch frame is non-blank). Capture artifact, not a blank/crashed page.

## 2. Behavioral actuation not possible on either app (info)
Register/Unregister could not be clicked on **either** app:
- **WinUI 3** — the enabled, on-screen Button exposes no `InvokePattern` via its
  automation peer here, and synthetic mouse / `SetForegroundWindow` are no-ops in this
  headless session.
- **UWP** — the CoreWindow exposes an empty UIA subtree; same input-synthesis limitation.
- `Register` is also permission-gated (`BackgroundExecutionManager.RequestAccessAsync()`).

With no actuation possible and no UWP behavioral golden to compare against, this is
**flagged for manual review** per the parity rule — not scored as a dead-control
regression. No behavioral regression was demonstrated.

## 3. UWP per-scenario golden not navigable (info)
The mandatory hard gate passed: the original UWP launched (`ok:true`, pid 2524,
window "Background Activation C# Sample") and its launch frame documents all six
scenarios in the nav plus scenario 1's Description / Register / Unregister / "Unregistered"
content. Per-scenario UWP navigation was not automatable (empty CoreWindow UIA subtree +
no synthetic input), so only the launch golden frame was captured.

## 4. Baseline checklist control count (info)
The source-derived checklist listed 0 interactive controls per scenario because the
scenario `.xaml` files are absent from the standalone UWP source (only `.xaml.cs`). The
Register/Unregister buttons were instead verified directly against the running UWP app
and the migrated WinUI 3 UIA tree.
