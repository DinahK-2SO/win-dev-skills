# AdvancedCasting (ScreenCasting) — UWP→WinUI 3 parity rubric

Ground truth: the original UWP **ScreenCasting C# Sample** (built Release, launched
live). It exposes 6 scenarios via the left navigation list. Each scenario below is a
feature point the migrated WinUI 3 app must preserve (visual layout + behavior).

| # | Scenario (verbatim nav title) | Page class | Key UI surface |
|---|-------------------------------|-----------|----------------|
| 1 | 1 - Media Element Casting 101 | Scenario01 | `MediaElement player` w/ built-in transport controls (cast button) |
| 2 | 2 - Casting APIs and a Custom Cast Button | Scenario02 | `MediaElement player` + custom cast-button transport template |
| 3 | 3 - DIAL Sender Universal Windows app | Scenario03 | `MediaElement player` + DIAL App Name / Launch Args TextBoxes |
| 4 | 4 - DIAL Receiver Windows Universal app | Scenario04 | `MediaElement player` (DIAL receiver) |
| 5 | 5 - Multi-View Media Application | Scenario05 | `MediaElement player` (multi-view projection) |
| 6 | 6 - Combine Casting Methods | Scenario06 | `MediaElement player` + DIAL App Name / Launch Args TextBoxes |

Shared chrome: header "ScreenCasting", per-scenario Description text, `LicenseText`,
status area (`StatusBlock` / `StatusBorder`).

Scoring: each scenario reachable + structural control coverage + behavioral parity
(cast/transport controls and DIAL inputs function as in the UWP original).
score = round(100 * (pass + 0.5*partial) / 6).
