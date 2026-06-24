# Skill defects — Altimeter (WILL change skill)

## 1. Defensive-UI rule destroys parity by hiding controls
- **Problem:** The device fallback collapses all scenario controls (Enable/Disable/Get Data +
  altitude output) when no sensor is present. Both scenarios score **fail** — controls absent.
- **Evidence:** `migration-score.json` (both features fail, `winui_responded:false`);
  `discrepancies.json#global-fallback-overrides-scenarios`; migrated `Scenario1_DataEvents.xaml.cs`
  `ShowFallback()` collapses `MainContent`; original UWP keeps controls and calls
  `NotifyUser("No altimeter found")`.
- **Skill state:** **wrong** — `SKILL.md` L198–204 "Defensive UI for device-dependent features"
  says: *"Wrap the init call in try/catch; on catch, swap the page's main content for the fallback"*
  with the exact sentence the migrated app shipped.
- **Root cause:** The rule prescribes **replacing** content (contradicting the Fidelity rule) and is
  applied to the normal `null GetDefault()` no-device path that UWP samples handle without hiding UI.
- **Fix:** Make the fallback **additive**; preserve the original's device-absent handling (report via
  status/NotifyUser, keep controls visible); treat null `GetDefault()` as normal; only add a separate
  (non-replacing) message when init *throws* and would leave a blank window. Reconcile with Fidelity.
- **Generalizes:** Every UWP sensor/hardware SDK sample shares this null-handling shape and is built
  on a device-less validation box. The current rule breaks the whole family; the fix repairs it.
