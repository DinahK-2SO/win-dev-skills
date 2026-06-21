# Feature Rubric: ApplicationData

## Navigation / NavigationView shell with scenario list

**ID:** `nav-shell`
**Weight:** 2

App uses NavigationView with scenario items matching source SampleConfiguration.cs

**Expected behaviour:**
- NavigationView is present with menu items
- Clear and SetVersion scenarios are listed
- Selecting an item navigates to the corresponding page

**UWP reference screenshot:**
_UWP screenshot not captured (eval focuses on source-code parity)_

---

## Scenario 6 / Clear ApplicationData

**ID:** `clear-scenario`
**Weight:** 2

Clear button calls ApplicationData.Current.ClearAsync() and shows result

**Expected behaviour:**
- Clear button is present
- Clicking Clear shows success message about data being cleared
- Error case shows appropriate error message

**UWP reference screenshot:**
_UWP screenshot not captured_

---

## Scenario 7 / SetVersion with handlers

**ID:** `setversion-scenario`
**Weight:** 2

Two buttons set version 0 or 1, with version handlers and output display

**Expected behaviour:**
- Set version to 0 and Set version to 1 buttons present
- Clicking either button updates version display
- OnNavigatedTo shows current version

**UWP reference screenshot:**
_UWP screenshot not captured_

---

## Build / App builds cleanly

**ID:** `app-builds`
**Weight:** 2

dotnet build succeeds with 0 errors and 0 warnings

**Expected behaviour:**
- Build succeeds with exit code 0
- No compiler errors
- No WUI analyzer warnings

---

## Runtime / App launches and stays alive

**ID:** `app-runs`
**Weight:** 2

App process starts and remains running without crash

**Expected behaviour:**
- Process starts successfully
- Window is visible with correct title
- No crash within first 10 seconds

---

## Migration process / Unsupported APIs correctly deferred

**ID:** `deferred-handling`
**Weight:** 1

Scenario5 (ms-appdata protocol) correctly deferred with documentation

**Expected behaviour:**
- Scenario5 excluded from build
- MIGRATION-DEFERRED.md documents the reason
- Scenario5 not in navigation
