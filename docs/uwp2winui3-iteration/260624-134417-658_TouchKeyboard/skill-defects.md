# Skill defects — TouchKeyboard (WILL change skill)

## SD1 — CoreInputView.GetForCurrentView() has no coverage at all
- **Problem:** `CoreInputView.GetForCurrentView().TryShow(CoreInputViewKind.Emoji)`
  ported verbatim (Scenario4), wrapped in empty try/catch, emits WUI0004, no-ops.
- **Evidence:** `Scenario4_ShowView.xaml.cs(29,19): warning WUI0004`.
- **Skill search:** `CoreInputView` / `InputView` → **zero hits** anywhere in the skill.
- **State:** absent.
- **Root cause:** view-bound UWP API with no `*Interop.GetForWindow`; `GetForUIContext`
  needs a `Windows.UI.UIContext` WinUI 3 elements no longer expose → no supported path.
- **Fix:** add a CoreInputView row to the GetForCurrentView table stating there is no
  supported desktop path and to drop the dead call rather than swallow it.
- **Generalizes:** emoji/handwriting/soft-input samples use CoreInputView; agents need an
  explicit "no path — remove, don't swallow" verdict for view-bound APIs with no analog.
