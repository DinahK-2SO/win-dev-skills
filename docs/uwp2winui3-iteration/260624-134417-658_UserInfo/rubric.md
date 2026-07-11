# UWP Feature Rubric — UserInfo (Account picture name C# sample)

**UWP capture status:** partial — UWP app launched via `uwp-app-runner` (ok=true, pid=14080,
windowTitle "User Info C# Sample"); the initial/default view (Scenario 1) was captured as a
non-blank golden. The SDK sample hosts a `Windows.UI.Core.CoreWindow` whose inner UIA subtree is
not reachable via `winapp`, and foreground activation is blocked in this non-interactive session,
so programmatic per-scenario navigation/actuation of the UWP could not be performed. Structural
checklist (from source) + the Scenario-1 visual golden are the usable baseline.

## Scenario 1 / Find users and display user properties

**ID:** `find-users`
**Weight:** 2

A ComboBox lists the machine's users; clicking **Show properties** enumerates the selected user's
properties and displays them in the results text.

**Expected behaviour:**
- Scenario reachable from the "Find users" navigation item
- A user-selection ComboBox (`UserList`) is present
- A "Show properties" button that populates `ResultsText` with the selected user's properties

**UWP reference screenshot:**
![find-users](screenshots/01_Find_users.png)

## Scenario 2 / Watch users with a UserWatcher

**ID:** `watch-users`
**Weight:** 1

Start/Stop buttons control a `UserWatcher` that enumerates users into a ListBox and reports status.

**Expected behaviour:**
- Scenario reachable from the "Watch users" navigation item
- A "Start watching" button that begins enumeration and lists users plus a status message
- A "Stop watching" button and a user ListBox are present

**UWP reference screenshot:**
_UWP screenshot not captured for this scenario (UWP CoreWindow could not be navigated programmatically; see capture status)._

## Scenario 3 / Check user consent group

**ID:** `check-user-consent-group`
**Weight:** 1

A ComboBox selects a user; clicking **Show Consent Group** displays the child/minor/adult content
consent verdicts.

**Expected behaviour:**
- Scenario reachable from the "Check user consent group" navigation item
- A user-selection ComboBox (`UserList`) is present
- A "Show Consent Group" button that shows the child/minor/adult content consent results

**UWP reference screenshot:**
_UWP screenshot not captured for this scenario (UWP CoreWindow could not be navigated programmatically; see capture status)._

---

RUBRIC COMPLETE: 3 features written to rubric.json
