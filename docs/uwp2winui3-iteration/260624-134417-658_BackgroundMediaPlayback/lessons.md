# Lessons — BackgroundMediaPlayback (UWP → WinUI 3)

**Outcome:** score 50/100. Build PASS, app launches, Settings scenario PASS. **Background Media
Playback scenario FAILs** — its content frame renders empty (0/5 controls in the UIA tree).

## The core finding (high value)
The migration was faithful and the build was clean. The failure is a **silent navigation
failure**: the `Scenario1` content `Page` throws during construction/`Loaded` (it creates a
`MediaPlayer`, reads `PlaybackSession.PlaybackRate`, calls `SetMediaPlayer`, and loads an
`ms-appx:///` playlist asset / touches a service singleton). `Frame.Navigate` marshals that
exception out **without terminating the process**, leaving a blank content frame while the app
stays alive.

The skill's runtime verification only checks **process-alive**:
- `Test-AppLaunch [OK ] status=running` (session-log L6096)
- `[PASS] Smoke launch — app stayed alive after launch` (L6234)
- `Validate-UwpMigration: PASS` (L6237)

…so the agent got a green "it runs" signal and declared done while the primary scenario was dead.

## Tool notes
- **Helpful:** `Initialize-UwpMigration.ps1` (clean bootstrap + mapping), `Validate-UwpMigration.ps1`
  (caught residue / `Status=copied` on the first run).
- **Limitation:** `Test-AppLaunch.ps1` / Validator §7 are **process-alive only**. They never
  navigate the shell, so a content page that throws on navigation passes the gate. This recurs for
  every multi-scenario SDK sample (MainPage list/`NavigationView` + `Frame` + N scenario pages).

## Errors
- **Scenario1 blank** → root cause: page throws in ctor/`Loaded` (media/asset/service init);
  navigation failure swallowed; no defensive guard, no per-scenario render check. Fix is a skill
  change (see skill-defects + skill-coverage-gaps notes).

## Preventable by
1. Document silent navigation failures and require per-scenario render verification / wiring
   `Frame.NavigationFailed` during bring-up. *(skill-defect)*
2. Broaden the existing "defensive UI / visible fallback" rule from hardware-only to **any
   init-heavy page** (media, asset loads, service singletons, ViewModel wiring). *(skill-coverage-gap)*
