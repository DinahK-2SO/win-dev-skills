# Migration Score: ApplicationData

| Metric | Value |
|--------|-------|
| Features evaluated | 9 |
| Pass | 9 |
| Partial | 0 |
| Fail | 0 |
| **Weighted score** | **100.0%** |

Note: UWP screenshots unavailable (UWP app crashed at startup: 0xc000027b). All scoring based on UIA tree inspection and functional interaction testing.

---

## Navigation / Application title display
**Verdict:** ✅ Pass
UIA tree shows SampleTitle Text 'ApplicationData' visible at top.

## Navigation / Scenario list
**Verdict:** ✅ Pass
NavigationView with '1) Clear' and '2) SetVersion' items present.

## Navigation / Scenario navigation
**Verdict:** ✅ Pass
Clicking scenario items navigates to correct content pages.

## Clear Scenario / Description text
**Verdict:** ✅ Pass
'The ClearAsync method clears data from ApplicationData.' text visible.

## Clear Scenario / Clear button
**Verdict:** ✅ Pass
Button invokable, returns correct confirmation message.

## SetVersion Scenario / Description text
**Verdict:** ✅ Pass
Versioning description text visible.

## SetVersion Scenario / Version buttons
**Verdict:** ✅ Pass
Both SetVersion0 and SetVersion1 buttons present.

## SetVersion Scenario / Version display
**Verdict:** ✅ Pass
Version toggles correctly between 0 and 1.

## Shell / Status area
**Verdict:** ✅ Pass
StatusPanel and StatusBlock elements present, collapsed when empty.

---
SCORE COMPLETE: 9 features, weighted score 100.0%
