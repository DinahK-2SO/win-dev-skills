# Parity Rubric — Printing C# Sample

Ground-truth feature list derived from the UWP source
(`uwp-samples-standalone/Samples/Printing/cs`) and confirmed against the live UWP app.

The UWP app renders a left navigation list of 6 scenarios; each scenario page shows a
`Description:` block, an optional **Print** button, and a shared **Status** bar
(green success banner). Standard Options prints automatically with no button.

| # | Scenario | Key control(s) | Action | Expected output |
|---|----------|----------------|--------|-----------------|
| 1 | Basic | Print (`InvokePrintingButton`) | Click Print | Print preview / print contract; StatusBlock updates |
| 2 | Standard Options | (none) | — | Prints via standard options; StatusBlock updates |
| 3 | Custom Options | Print (`InvokePrintingButton`) | Click Print | Print preview with custom options; StatusBlock updates |
| 4 | Page Range | Print (`InvokePrintingButton`) | Click Print | Print preview with page-range option; StatusBlock updates |
| 5 | Photos | Print (`InvokePrintingButton`) | Click Print | Photo print preview; StatusBlock updates |
| 6 | Disable Preview | Print (`InvokePrintingButton`) | Click Print | Direct print (no preview); StatusBlock updates |

Shared output element across all scenarios: `StatusBlock` / `StatusBorder` (status banner).

## Grading dimensions
1. **Structural** — control present in captured UIA tree (AutomationId / name / label).
2. **Visual** — scenario page renders a non-blank frame that resembles the UWP page.
3. **Behavioral** — clicking Print produces a visible response (preview/dialog/status),
   as it does in the UWP original.

A scenario that renders **blank** (empty page, indistinguishable from a crash) is a
**fail** regardless of structural coverage.
