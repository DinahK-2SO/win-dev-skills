# OCR — Parity Discrepancies

Score **100/100**, builds:true, runs:true. Both requirements PASS; `discrepancies: []`.

| id | feature | status | note |
|----|---------|--------|------|
| 0 | OCR image file | pass | All checklist controls present; UserLanguageToggle responded (+3 tokens). |
| 1 | OCR captured image | pass | PreviewImage present; defensive "No camera device!" fallback; camera hardware-gated in both apps. |

No missing controls, no dead controls, no wrong text. Improvement value is in the build-log
friction (see lessons.md / skill-defects.md), not a scored regression.
