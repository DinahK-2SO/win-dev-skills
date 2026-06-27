# BasicSuspension — Parity Discrepancies

**Summary:** No migration defects found. The WinUI 3 app structurally reproduces
the UWP `MainPage` in full — `ListView` (header *"Click on an item or click a
button in the AppBar."*) with Items 1-4, plus the **add** / **reset** CommandBar
buttons — confirmed via the captured UIA tree. Structural parity gate: **PASS,
1/1 control, 100/100**.

The items below are **measurement-environment limitations**, not migration faults.

## Measurement limitations (not defects)

1. **Original UWP golden is splash-only.** `uwp-app-runner` returned `ok:true`
   (window *"Basic Suspension C# Sample"*), but the app only reached its splash
   screen (*"Windows platform sample"*) and then crashed ~3-8s after launch —
   WER `MoAppCrash`, `combase.dll`, exception `0x80131500` (managed) — before
   MainPage's ListView rendered. So there is no live UWP feature visual/behavior
   to pixel-diff against; the baseline screenshot shows the splash only.

2. **WinUI 3 pixel screenshots are blank in this environment.** PrintWindow can't
   capture WinUI 3 DirectComposition content, and there is no interactive desktop
   session for screen-pixel capture (`winapp --capture-screen` / `CopyFromScreen`
   both return blank). The **UIA tree is authoritative** and shows the full page
   rendered on-screen (`isOffscreen=false`, real coordinates):
   - `ListView` `list`, header *"Click on an item or click a button in the AppBar."*
   - `ListViewItem` Item 1, Item 2, Item 3, Item 4 (all `isInvokable=true`)
   - `AppBarButton` **add**, **reset**, plus More-options (all `isInvokable=true`)

## Control / behavior gaps

- Missing controls: **none**
- Dead controls: **none**
- Behavioral regressions vs UWP: **none measurable** (UWP crashed before exposing
  behavior; WinUI controls are all present and invokable).
