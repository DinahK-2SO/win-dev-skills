# Skill coverage gaps (WILL change skill) — Geolocation

## 1. Manifest checklist reads as "complete" but omits extension reconciliation

- **Problem:** The Manifest migration checklist lists TargetDeviceFamily/rescap/
  runFullTrust as though that is everything, so a manifest passing those three looks
  done — even while its `windows.backgroundTasks` extensions still break registration.
- **Evidence:** MIGRATION-PATTERNS.md checklist items 1–4; the migrated manifest passed
  them yet failed with 0x80080204.
- **Covered at:** MIGRATION-PATTERNS.md "Manifest migration checklist" + Validate Section 5b.
- **Why missed:** under-emphasized — the list implies completeness.
- **Proposed improvement:** add an explicit "reconcile UWP `<Extension>` blocks
  (esp. `windows.backgroundTasks`)" item to the same checklist.
- **Generalizes:** prevents under-migration of any UWP manifest carrying extensions.

> Note: this gap is addressed by the same MIGRATION-PATTERNS.md edit that implements the
> skill-defect fix (one checklist item covers both).
