# Classified problems — Store (improve iteration 1)

## skill-defects.json → none
No section was outright absent or wrong; both eligible problems have a natural home
section that just needs sharpening (see coverage-gaps).

## skill-coverage-gaps.json → 2 (both will change the skill)
1. **CS0104 `HttpClient`/`HttpResponseMessage` ambiguity** (`System.Net.Http` vs
   `Windows.Web.Http`). The CS0104 section only covers the `Windows.UI.Xaml` vs
   `Microsoft.UI.Xaml` axis. Extend it with the Http axis. Generalizes to any UWP app
   using `Windows.Web.Http`.
2. **WMC0909/WMC1111 x:Bind DataType cascade.** The x:Bind section doesn't note that these
   "cannot resolve DataType/local type" errors (with `WMC1509 No LocalAssembly`) are a
   cascade of C# compile failures — fix C# first, rebuild, don't downgrade `x:Bind` to
   `{Binding}`. Generalizes to every SDK-sample scenario-list DataTemplate migration.

## dev-agent-slips.json → 1 (no skill change)
- Nullable-reference warnings — ordinary C# cleanup the agent handled without guidance.
