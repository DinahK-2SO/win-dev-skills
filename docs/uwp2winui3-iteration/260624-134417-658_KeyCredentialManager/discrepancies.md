# Discrepancies — KeyCredentialManager (UWP → WinUI 3)

Comparison method: UWP **golden screenshot** vs WinUI 3 **UIA tree**. The WinUI
screenshot could not be rasterized in this non-interactive session (see below), so
the UIA tree is used as the authoritative structural + textual evidence for the
migrated app.

## Real UI discrepancies (UWP golden vs WinUI)

**None.** The WinUI UIA tree reproduces the UWP Sign In (Contoso login) page
control-for-control:

| Control | UWP golden | WinUI 3 |
|---|---|---|
| `Contoso` header | ✓ | ✓ |
| Username label + `textbox_Username` | ✓ | ✓ |
| Password label + `passwordbox_Password` | ✓ | ✓ |
| `Sign In` button | ✓ | ✓ |
| `button_PassportSignIn` ("Sign In with Microsoft Passport") | ✓ (disabled) | ✓ (disabled) |
| `textblock_PassportStatusText` | "Microsoft Passport is not set up. Please go to Windows Settings and connect an MSA account!" | *identical text* |

No missing controls, no dead controls, no wrong output text, no layout differences.

## Non-defect notes

1. **WinUI screenshot blank (environment artifact).** The WinUI 3 frame rendered blank
   white. This is *not* a blank/crashed page — the UIA tree has 33 fully laid-out,
   on-screen elements with real text at real coordinates. The blank frame results from
   this being a **non-interactive session** that cannot composite WinUI 3 swapchain
   (`DesktopChildSiteBridge`) content: both GDI `PrintWindow` and
   `Graphics.CopyFromScreen` ("handle is invalid") fail for swapchain content. The UWP
   app captured fine because its `CoreWindow` uses a GDI-capturable path.

2. **Checklist page mismatch (false-negative coverage).** The extracted checklist keyed
   scenario 1 on the `UserSelect` class (`listView_UserTileList` + `+` button). Neither
   app shows those at startup; both show the Contoso login page. `UserSelect` is reached
   only after a successful Passport sign-in (unavailable — Passport not enrolled). So
   `Compare-Parity`'s `0/2` coverage is measured against controls that render on a
   different, hardware-gated page.

3. **`+` action dead in both.** The `+` action produced no visible response in the UWP
   golden (`responded:false`) *and* the WinUI app (`responded:false`). Gated behind
   Passport enrollment. Dead in both ⇒ no WinUI-specific behavioral regression.
