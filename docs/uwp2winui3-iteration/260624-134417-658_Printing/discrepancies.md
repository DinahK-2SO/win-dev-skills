# Discrepancies — WinUI 3 migration vs. UWP original (Printing C# Sample)

## Critical

1. **Every scenario renders a BLANK white window (no content paints).**
   The migrated WinUI 3 app launches and its UI Automation tree is fully populated
   (navigation list with all 6 scenarios, `Description:` text, `Print` button,
   `Status:` banner with runtime text "Print contract registered with customization,
   use the Print button to print."), but **nothing renders visually** — the client
   area is pure white. Confirmed with **two independent capture methods**:
   - `winapp ui screenshot :root` (window PrintWindow bitmap) → blank white.
   - `winapp ui screenshot :root --capture-screen` (GDI/DWM screen-region) → blank white.
   The original UWP app renders the full UI correctly (see `uwp_golden_basic.png`).
   Per the parity rule "blank screenshot = fail", this defeats every scenario.

2. **App crashes when Printing the Photos scenario.**
   Invoking **Print** on Scenario 5 (Photos) produced no response (`noop`) and the app
   process (PID 40504) terminated immediately afterward, making Scenario 6
   (Disable Preview) unreachable (capture returned "No process found with PID 40504",
   0-byte screenshot). Reproduced across capture runs.

## Behavioral

3. **Scenario 5 (Photos) — Print is dead / fatal.** In WinUI the Print button was
   invoked but produced 0 new text tokens and crashed the process, versus the UWP
   original where each scenario's Print drives the print contract. Dead + crash.

4. **Scenario 6 (Disable Preview) — unreachable.** Not testable because the app had
   already crashed. Structural coverage 0/1 (control not captured).

## Structural / behavioral that DID work (for context)

- Scenarios 1 (Basic), 3 (Custom Options), 4 (Page Range): the **Print** button was
  present in the UIA tree and, when invoked, opened the print experience (print
  preview text + "Close" appeared in the UIA output) — behaviorally alive, but the
  underlying page still renders blank.
- Scenario 2 (Standard Options): no interactive control expected (matches UWP), but
  page renders blank.
- Navigation titles preserved verbatim; all 6 scenarios present in the UIA tree.

## Net assessment

The migration reproduced the control **structure** and wired up several handlers, but
the app is **visually non-functional** (blank render on every page) and **crashes** on
the Photos print path. From a user's perspective the migrated app shows nothing usable.
