# Rubric — KeyCredentialManager C# sample

Scenario source: `uwp-samples-standalone\Samples\KeyCredentialManager\cs`

## Scenario 1 — Sign In Scenario

The app starts on the **Contoso login page** (SignIn / Content page). The
`UserSelect` page (with `listView_UserTileList` and the `+` add-user button) is
reached **only after a successful Microsoft Passport sign-in**, so on a machine
where Passport/Windows Hello is not enrolled it is unreachable in **both** the
original UWP app and the migrated WinUI 3 app.

### UI elements (startup state — what both apps actually render)

- `Contoso` — header brand `TextBlock`
- `textbox_Username` — Username `TextBox`
- `passwordbox_Password` — Password `PasswordBox`
- `Sign In` — standard sign-in `Button`
- `button_PassportSignIn` — "Sign In with Microsoft Passport" `Button` (disabled when Passport not enrolled)
- `textblock_PassportStatusText` — status message; shows
  "Microsoft Passport is not set up. Please go to Windows Settings and connect an MSA account!"

### Gated / hardware-dependent elements (not shown at startup in either app)

- `listView_UserTileList` (ListView) — UserSelect page
- `+` (Button) — UserSelect add-user; the sole checklist action, **dead in both**
  UWP golden and WinUI because Passport is not set up. Not a migration regression.

### Pass criteria

The migrated app faithfully reproduces the Sign In (Contoso login) page control-for-
control, including the identical Passport-not-set-up status text and the disabled
Passport button, and exhibits the same behavioral state (Passport gated) as the UWP
golden.
