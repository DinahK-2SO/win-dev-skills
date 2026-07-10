# Lessons — TouchKeyboard (index 1)

Score 100/4 pass, builds=true, runs=true. The score is clean, but the build carries
**5 WUI0004 warnings**: every `GetForCurrentView()` call for `InputPane` and
`CoreInputView` was left as UWP-only code and defensively wrapped in an empty
`try/catch{}`, so the touch-keyboard features **compile but silently no-op at runtime**.

## Key findings
- **InputPane.GetForCurrentView()** (Scenario2 events, Scenario3 TryShow/TryHide) has a
  clean WinUI 3 replacement — `InputPaneInterop.GetForWindow(hwnd)`
  (`Windows.UI.ViewManagement.InputPaneInterop`) — but the skill's `#getforcurrentview`
  table doesn't list it.
- **CoreInputView.GetForCurrentView().TryShow(Emoji)** (Scenario4) has **no supported
  WinUI 3 desktop path**: no `*Interop.GetForWindow`, and `GetForUIContext` needs a
  `Windows.UI.UIContext` that WinUI 3 elements no longer expose. The skill never mentions
  it.
- **Anti-pattern:** the agent silenced WUI0004 with empty `try/catch{}` in all three
  files. That's the worst outcome — green build, muted analyzer, dead feature. The skill
  doesn't warn against it.

## Root cause
The `GetForCurrentView Replacements` table is prominent and the inventory correctly routed
the calls to it, but the table is **incomplete** for the two most common soft-keyboard
APIs, so the agent fell back to catch-and-ignore.

## Tooling
- Helpful: the WindowsAppSDK analyzer flagged every offending call site precisely.
- Gap: the replacement table the agent was routed to lacked the target rows.
