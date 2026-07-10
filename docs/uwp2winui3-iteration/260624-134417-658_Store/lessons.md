# Lessons — Store (UWP → WinUI 3), improve iteration 1

Final score: **93/100** (6 pass, 1 partial, 0 fail). Build clean, app launched.

## What worked
- **Bulk namespace rewrite** (`Initialize-UwpMigration.ps1`) reduced the manual work to a
  handful of code-level errors.
- **`Validate-UwpMigration.ps1`** gave a single go/no-go gate (residue grep, mapping
  consistency, build, smoke launch, visible-text fidelity).

## Real build struggles (generalizable)
1. **`CS0104` ambiguous `HttpClient` / `HttpResponseMessage`** in `Scenario7_B2B.xaml.cs`.
   UWP used `using Windows.Web.Http;` + unqualified `HttpClient`. In the WinUI 3 **.NET**
   project `System.Net.Http` is also in scope, so the type is ambiguous. Fix: fully
   qualify `Windows.Web.Http.HttpClient` / `Windows.Web.Http.HttpResponseMessage`.
   → The skill's `CS0104` section only documents the `Windows.UI.Xaml` vs
   `Microsoft.UI.Xaml` axis, not this **`System.Net.Http` vs `Windows.Web.Http`** axis.

2. **`WMC0909` "Cannot resolve DataType local:Scenario" + `WMC1111`** in `MainPage.xaml`,
   preceded by **`WMC1509` "No LocalAssembly parameter given during MarkupCompilePass2"**.
   Root cause: the CS0104 C# errors kept the project assembly from compiling, so the XAML
   markup pass had no LocalAssembly and could not resolve the valid project-local
   `Scenario` type. The agent downgraded `x:Bind`/`x:DataType` → `{Binding}` to silence it
   — unnecessary; fixing the C# errors and rebuilding clears the markup-pass errors while
   keeping compiled bindings.

## Non-defects
- **Blank WinUI screenshots** — headless/off-screen composition artifact in the scoring
  session; UIA trees are correct per scenario. The skill already avoids system backdrop /
  `ExtendsContentIntoTitleBar`.
- **"Missing QuantityComboBox" (scenario 4 → partial)** — the migrated
  `Scenario4_ConsumableProduct.xaml` **does contain** the `QuantityComboBox` (verified in
  the app tree). The scenario-4 UIA capture actually shows scenario-3 ("Unmanaged
  Consumables") content, so this is an **eval-capture/navigation artifact**, not a
  migration defect. Deferred to human; no migration-skill change.
