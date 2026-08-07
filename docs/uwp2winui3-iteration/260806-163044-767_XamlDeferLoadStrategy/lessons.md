# Lessons: XamlDeferLoadStrategy

- **Helpful:** Bootstrap inventory/TODO generation, focused pattern lookup, native `dotnet build`, and the launch/validation gates all produced actionable results.
- **Wrong guidance:** `winapp build` is unavailable; builds must use `dotnet build -p:Platform=x64`.
- **Missing rule:** Four `x:DeferLoadStrategy="Lazy"` occurrences passed through as migrate-as-is. The equivalent successor is `x:Load="False"`.
- **Main unresolved error:** Clean builds repeatedly crashed at startup with `0xc000027b` in `Microsoft.UI.Xaml.dll`; no managed event 1026 stack was captured.
- **Agent slips:** Dependent commands were parallelized twice, namespace reconciliation was piecemeal, and `required` members broke generated XAML activation.
- **Tool mismatch:** The bootstrap emitted `(none)` for deferred rows while the validator expected `No items deferred`.
