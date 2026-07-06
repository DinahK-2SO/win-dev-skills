# Feature Rubric — Hotspot Authentication (UWP ground truth)

Authoritative reference for scoring the migrated WinUI 3 app. Derived from the UWP
source and the **live UWP app** (launched via `uwp-app-runner`; window title
"Hotspot Authentication C# sample"). The app renders the standard UWP SDK sample
shell: a left scenario `ListBox` + a per-scenario content pane.

## Scenario 1 — Initialization
Provision a WLAN profile and register/unregister the background task for the hotspot
authentication event.

UI elements:
- **Provision** button — *enabled* (confirmed in UWP golden screenshot).
- **Register** button — *enabled* (confirmed in UWP golden screenshot).
- **Unregister** button — *disabled* initially (greyed out in UWP golden; enabled only
  after a task has been registered).
- Shared status area (`StatusBlock` text + `StatusBorder`).

## Scenario 2 — Authentication by background task
Informational. Authentication is handled by the registered background task; no
interactive controls beyond the shared status area.

## Scenario 3 — Authentication by foreground app
Foreground authentication of a hotspot event.

UI elements:
- **Authenticate** / **Skip** / **Abort** buttons — *disabled* until a live
  `NetworkOperatorHotspotAuthenticationContext` event fires (hardware/event-gated).
- Shared status area (`StatusBlock` text + `StatusBorder`).

## Scoring notes
Most actions require a real Wi-Fi hotspot authentication context (signed WLAN
provisioning XML, a live auth event) that is unavailable on a dev box, so the key
behavioral signal is **initial control presence + enabled/disabled state** rather than
click side-effects.
