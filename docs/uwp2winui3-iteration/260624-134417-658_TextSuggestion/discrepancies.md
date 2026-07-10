# Discrepancies — TextSuggestion (UWP → WinUI 3)

Score **100**, builds ✅, runs ✅, 3/3 pass.

| id | requirement | status | note |
|----|-------------|--------|------|
| 0 | Conversion | pass | Create Generator correct; Execute collapsed-by-design (matches UWP) |
| 1 | Prediction | pass | Full end-to-end verified; Execute -> "No candidates." |
| 2 | ReverseConversion | pass | Shared reveal/Execute code, identical to Prediction |

**Visual:** WinUI screenshots blank = composition/PrintWindow capture artifact (content
confirmed via UIA). Scorer-side, not a migration defect.

All three items the scorer flagged (Execute structural miss, blank screenshots, UWP not
UIA-drivable) are **measurement artifacts**, not migration defects.
