# Parity discrepancies — BasicInput

Score **100 / 100**, 5/5 features pass, builds + runs. **No functional discrepancies.**

All five rubric scenarios (Input Events, PointerPoint Properties, Device Capabilities,
XAML Manipulations, Gesture Recognizer) were present, matched the UWP source, and
responded when actuated.

The score notes' "discrepancies" are **eval-instrument limitations**, not migration
defects, and are explicitly out of scope:
- `winui_screenshot_blank`: winapp GDI/PrintWindow can't capture the WinUI 3
  DirectComposition swapchain (frames blank). Fidelity judged from the UIA tree.
- `uwp_golden_nav_failed`: UWP CoreWindow not deeply walkable via winapp; nav 2–5 reused
  the launch frame.

No skill change is warranted from parity. The actionable evidence lives in the build log
(see `lessons.md`).
