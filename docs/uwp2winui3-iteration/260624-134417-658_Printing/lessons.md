# Lessons — Printing (UWP → WinUI 3)

## Outcome
- Build succeeded, process launched, UIA tree fully populated (all 6 scenarios, Print button, status text).
- **Score 0/6.** Every scenario renders a **blank white window**; the Photos print path crashes and makes Disable Preview unreachable.

## Root causes
1. **Blank window with a CLEAN MainWindow.** `MainWindow.xaml` has no `SystemBackdrop`, no `<TitleBar>`, no `ExtendsContentIntoTitleBar` — so the skill's existing backdrop/title-bar blank-window guidance did **not** apply. The window is still blank because:
   - The root `Grid Background="{ThemeResource ApplicationPageBackgroundThemeBrush}"` — a **UWP-only** brush that is **not defined in WinUI 3** → resolves to null → transparent root.
   - A WinUI 3 `Window` has **no page background of its own** (unlike a UWP `Page`), so with a transparent content root nothing opaque paints → blank white in automated capture.
   - The skill currently **recommends this exact brush** as the opaque fallback and claims a de-composed window "uses its normal opaque background" — both are wrong. → **skill-defect.**
2. **Startup crash (resolved by agent).** Invalid `{StaticResource}` theme-brush refs in `Styles.xaml`; agent switched to `{ThemeResource}`. Already covered → slip.
3. **Photos print crash.** No exception captured; migration agent never ran the print path. Printing interop (`PrintManagerInterop`) is already correct/covered. Insufficient evidence for a general skill change → slip.

## Tooling gap
- The migration agent can only verify via UIA/process-alive, which **passes on a blank window**. It has no screenshot capability. The reliable lever is a **static validator check** for the blank-window cause, not a visual instruction it cannot execute.
