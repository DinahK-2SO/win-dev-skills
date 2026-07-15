# Dev-agent slips (will NOT change skill) — BackgroundMediaPlayback

## 1. Missed one `using SDKTemplate;` and timed out before validating
- **Problem:** Renaming the root namespace file-by-file, the agent missed one line and ran
  out of budget before the mandatory Step 4 validation.
- **Covered clearly at:** SKILL.md Step 4 ("NOT done until Validate-UwpMigration.ps1 reports
  PASS") and the Step 3 build loop — both prominent.
- **Slip type:** one-off mistake (partial edit) + timeout.
- **Why no skill change for the slip itself:** the "always validate" rule is already clear.
  The *underlying* friction — an undocumented, large, error-prone manual namespace rename —
  is a genuine skill-defect and is fixed separately (doc recipe + validator guard), which
  also shrinks the manual work that produced this slip. Recorded here as context only.
