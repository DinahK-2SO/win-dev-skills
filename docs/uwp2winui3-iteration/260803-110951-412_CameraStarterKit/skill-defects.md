# Skill defects — CameraStarterKit

## 1. `Get-MigrationPattern.ps1` has no anchor discoverability (Tier-1 tooling)
- **Problem:** On an unknown anchor the script prints only "Anchor #x not found"; it matches only exact `<a id>` anchors, so the 7 `##` sections without an `<a id>` are unreachable, and the agent must guess or open the whole file (which the docstring warns trips the content-safety filter).
- **Evidence:** session-log turns 30–34 — `-Anchor media` fail, `-Anchor camera-preview` fail, then heading enumeration + grep to find the anchor is `capture`.
- **State:** wrong (not-found branch offers no recovery; match is anchor-only).
- **Fix:** case-insensitive substring fallback against anchor ids AND heading text; on total miss, print the full anchor+heading list and exit 1.
- **Generalizes:** every scenario routes lookups through this helper and agents guess ids from feature terms; discoverability removes guess-loops universally and unlocks the unanchored sections.
