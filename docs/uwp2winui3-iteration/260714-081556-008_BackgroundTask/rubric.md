# Parity rubric — Background tasks (BackgroundTask)

The original UWP sample exposes **6 scenarios**, each a page with the same shape:
a **Register** button, an **Unregister** button (initially disabled), a **Status**
text (initially "Unregistered") and a **Progress** text. Scenario 5 additionally has a
**Signal** button and a **Result** text.

The documented core behavior of every scenario: clicking **Register** registers the
background task and updates **Status → "Registered"** and enables **Unregister**;
**Unregister** reverses it. This registration is a deterministic API (not hardware-gated).

## Grading each scenario
- **pass** — reachable, controls present, non-blank, AND Register produces the documented
  Status change (behaviorally live).
- **partial** — reachable, controls present, non-blank, but Register is **dead** (no state
  change) — "looks right, buttons do nothing."
- **fail** — blank / unreachable / scenario missing / controls absent.

## Score
`round(100 * (pass + 0.5*partial) / 6)`
