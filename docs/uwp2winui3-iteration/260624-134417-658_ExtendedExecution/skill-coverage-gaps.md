# Skill coverage gaps — ExtendedExecution (→ WILL change skill)

## 1. Notifications section under-specifies AppNotificationManager (buried mapping only)
- **Problem:** Agent correctly switched UWP `ToastNotificationManager` → WinAppSDK `AppNotificationManager` + `Register()`, app crashed at startup (`0xc000027b`), and — lacking lifecycle/manifest guidance — reverted to the UWP API (latent runtime defect for unpackaged desktop).
- **Evidence:** session-log turns 40–46 (add `Register()` → Test-AppLaunch FAIL → remove → revert `DisplayToast` to `ToastNotificationManager.CreateToastNotifier()`).
- **Covered at:** `MIGRATION-PATTERNS.md#notifications` (lines 456–464) — a 2-row table + doc link, no code, no lifecycle, no manifest detail.
- **Fix:** Add the `Register()`/`Unregister()` lifecycle, the required `windows.toastNotificationActivation` + `windows.comServer` manifest extensions, an explicit "do not revert to `ToastNotificationManager` (parameterless `CreateToastNotifier()` throws unpackaged)" warning, and a minimal before/after snippet.
- **Generalizes:** Toasts are ubiquitous in UWP apps; this trap recurs on any of them.

## 2. 0xC000027B startup-crash row nudges "defer" instead of "fix registration"
- **Problem:** The startup-crash guidance told the agent to defer/remove the startup API, reinforcing the revert.
- **Evidence:** Test-AppLaunch hint + `#startup-crashes` line 387 ("if unsupported … defer it"); agent removed `Register()` at turn 45.
- **Covered at:** `MIGRATION-PATTERNS.md#startup-crashes`, `0xC000027B` row (line 387).
- **Fix:** Name the specific cause — `0xC000027B` right after `AppNotificationManager.Default.Register()` = missing manifest COM activator; declare it (see #notifications), don't defer.
- **Generalizes:** Any startup COM-activator registration can hit this; naming it prevents the reflexive "defer the API" misfix.
