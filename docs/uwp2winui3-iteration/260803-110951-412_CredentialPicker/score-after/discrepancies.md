# CredentialPicker — Parity Discrepancies

## Summary

Structural and visual parity are **excellent** — every control is present and the
layout faithfully matches the UWP app. However, the app's **core feature is broken**:
clicking **Launch** throws `System.Runtime.InteropServices.COMException: The handle is
invalid.` instead of showing the Windows Security credential dialog.

In the UWP golden, clicking Launch spawns a **"Windows Security" credential dialog
window** (visible as a second HWND in `01_Message__a01_Launch.png`). In the migrated
WinUI 3 app, no dialog appears — only an error in the Status band.

This regression affects **all three scenarios** because they share the same
`CredentialPicker.PickAsync` code path.

## Discrepancies

| Scenario | Control | Type | Severity |
|---|---|---|---|
| 1 — Message | Launch | dead core feature | high |
| 2 — Message+Caption | Launch | dead core feature | high |
| 3 — CredentialPickerOptions | Launch | dead core feature | high |

**Likely cause:** On WinUI 3 desktop, `CredentialPicker.PickAsync` must be initialized
with the app window handle (`IInitializeWithWindow` / `InitializeWithWindow`). The
migration did not associate the HWND, so the shell rejects the call with "handle is
invalid".

**Evidence:**
- WinUI: `parity/winui3/screenshots/01_Message__a01_Launch.png` (red error band)
- UWP golden: `parity/baseline/screenshots/01_Message__a01_Launch.png` (Windows Security dialog window appears)

## Non-issues (correctly migrated)

- All controls present in the WinUI UIA tree — structural coverage 9/9, 10/10, 14/14.
- Visual layout, labels, default text, and Fluent theming faithful to the UWP app.
- No blank frames; every scenario rendered.
