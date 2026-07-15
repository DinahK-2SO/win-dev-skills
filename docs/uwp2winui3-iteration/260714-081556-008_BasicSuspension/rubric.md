# BasicSuspension — scoring rubric

Derived from the UWP source and the live UWP golden capture.

## Scenario 1 — BasicSuspension (`MainPage`)

- **Controls (structural):**
  - `ListView` name=`list`, label="Click on an item or click a button in the AppBar."
- **Actions (behavioral):** none on the main content surface (the checklist extracted
  0 action controls; AppBar `add`/`reset` commands live in the command bar).
- **Outputs:** the ListView is populated with `Item 1..N`; suspension persists/restores
  the session state.

**Pass criteria:** ListView present and reachable in the WinUI 3 UIA tree with its
label and items; no dead controls relative to the UWP golden.
