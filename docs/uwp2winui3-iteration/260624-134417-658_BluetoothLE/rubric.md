# Rubric — Bluetooth Low Energy C# Sample (4 scenarios)

Ground truth derived from the live UWP app + source checklist.

## Scenario 1 — Client: Discover servers
- Controls: 3 (incl. results list). Actions: `Start enumerating`, `Pair`.

## Scenario 2 — Client: Connect to a server
- Controls: 8. Actions: `Connect`, `Read Value`, `Subscribe to value changes`,
  `Write Value as Number`, `Write Value as UTF-8`.

## Scenario 3 — Server: Publish foreground
- Controls: 6. Actions: `Start Service`.

## Scenario 4 — Server: Publish background
- Controls: 6. Actions: `Start Service`.

Scoring: a feature is `pass` only if reachable, structurally ≥80% covered, and its
controls respond as in the UWP golden; `partial` if reachable but present-yet-dead or
<80% covered; `fail` if unreachable. The migrated app does not build/run → all FAIL.
