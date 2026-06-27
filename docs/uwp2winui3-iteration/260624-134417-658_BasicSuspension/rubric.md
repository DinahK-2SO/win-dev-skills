# BasicSuspension — Migration Scoring Rubric

Scenario: **BasicSuspension** (UWP → WinUI 3)

## Feature 1 — BasicSuspension (MainPage)

A single-page app that demonstrates UWP suspend/resume state preservation.

**Required UI (from UWP source `MainPage.xaml`):**
- `ListView` (`x:Name="list"`) with header **"Click on an item or click a button in the AppBar."**, `IsItemClickEnabled`, populated with items (Item 1…N).
- Bottom `CommandBar` with two `AppBarButton`s: **add** (Add icon) and **reset** (Refresh icon).
- Item click → navigates to `SubPage`.
- `SuspensionManager` saves/restores navigation + page state on suspend/resume.

**Pass criteria:**
- MainPage renders the ListView with its header and items (structural gate control = the ListView).
- add / reset CommandBar buttons present and wired.
- Item click navigates to SubPage.

**Scoring:** `score = round(100 * (pass + 0.5*partial) / features_total)`. One feature total.
