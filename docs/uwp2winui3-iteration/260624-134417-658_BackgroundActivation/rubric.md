# Parity Rubric — Background Activation (UWP → WinUI 3)

Scored scenario: **BackgroundActivation** (subject trial `000_BackgroundActivation`).

The original UWP sample is the SDK "Background Activation" sample: a left-hand scenario
list and, per scenario, a **Description**, a **Register** button, an **Unregister**
button, and a **Status** text line. Each scenario differs only in the trigger/condition
it registers.

| # | Scenario (verbatim title) | Required controls | Output | Default state |
|---|---|---|---|---|
| 1 | Background Task | Register, Unregister | Status | Register enabled, Unregister disabled, "Unregistered" |
| 2 | Background Task with Condition | Register, Unregister | Status | same |
| 3 | Servicing Complete Task | Register, Unregister | Status | same |
| 4 | Background Task with Time Trigger | Register, Unregister | Status | same |
| 5 | Background Task with Application Trigger | Register, Unregister (+ signal) | Status | same |
| 6 | Grouped Background Task | Register, Unregister | Status | same |

## How each scenario is graded
- **Reachable** — the nav item with the verbatim title selects the page (title-driven nav).
- **Structural** — Register + Unregister buttons and the Status output are present in the
  captured UIA tree, with the correct default enabled/disabled states.
- **Behavioral** — Register transitions Status to "Registered" and toggles button enabled
  states. This path calls `BackgroundExecutionManager.RequestAccessAsync()` and is
  **permission-gated**, so it is environment-dependent and treated as manual-review when
  it cannot be actuated and there is no UWP behavioral golden to compare against.

## Ground truth
- Original UWP app launched in Release (pid 2524, window "Background Activation C# Sample")
  and rendered all six scenarios in the nav plus scenario 1's Description / Register /
  Unregister / "Unregistered" content — captured as the golden launch frame.
