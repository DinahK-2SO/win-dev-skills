# Discrepancies — ApplicationResources (iteration 0)

- **score:** 100 · **builds:** ✅ · **runs:** ✅

## Requirements
- **#0 (pass)** — shell + scenario navigation + default x:Uid resource string. Faithful.

## Visual differences (non-defect)
- Initial frame: UWP splash 'Windows platform sample' → WinUI goes straight to scenario 1,
  header 'Windows App SDK sample'. Expected modernization rebrand.

## Non-defect notes
- Structural parity gate reported cov 1/4 — a NavigationView **collapsed-pane capture
  artifact**, not a real gap (expanding the pane shows all 13 scenarios + footer links).
- Trademarks/Privacy links are dead in-app in **both** UWP and WinUI (external URLs).

## Real generalizable defect
- **UWP MRT residue (WUI1001)** in `scenario7/8/10/12/13.xaml.cs` — see skill-defects.json.
