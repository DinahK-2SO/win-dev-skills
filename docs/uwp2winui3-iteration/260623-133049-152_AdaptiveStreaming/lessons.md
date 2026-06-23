# Lessons — AdaptiveStreaming (UWP → WinUI 3)

**Outcome:** score 0 — the migrated app never compiled. Session ended mid-build with 7
errors outstanding; Validate-UwpMigration.ps1 was never reached.

## What worked
- `Initialize-UwpMigration.ps1` scaffolded the shell, mass-rewrote `Windows.UI.Xaml →
  Microsoft.UI.Xaml`, and drove a file-by-file mapping.

## Tool limitation
- The bootstrap namespace rewrite only covers the **`Windows.UI.Xaml.*`** family
  (script line 113). The **sibling non-Xaml** `Windows.UI.*` namespaces are left as-is:
  `Windows.UI` (`Colors`, `ColorHelper`), `Windows.UI.Text` (`FontWeights`). Simple-name
  references like `Colors.Red` therefore resurface as **CS0103** during the build.

## Errors → root cause → fix
1. **CS0103 `Colors`** (LogView) — bootstrap doesn't remap the non-Xaml `Windows.UI`
   namespace; add `using Microsoft.UI;` (note: the `Color` *struct* stays
   `Windows.UI.Color`; only `Colors`/`ColorHelper` move — a per-type split).
2. **CS0104 `HttpMethod` / `HttpCompletionOption` ambiguous** (Scenario3) —
   `System.Net.Http` (BCL, referenced by default in WinUI3 desktop) collides with
   `Windows.Web.Http` (used by the UWP sample's `IHttpFilter` stack). Keep
   `Windows.Web.Http`; drop/alias the `System.Net.Http` using or fully qualify.
3. **CS0103 `CoreDispatcherPriority`** (Scenario5) — `Dispatcher.RunAsync` left
   un-migrated in one file though `MIGRATION-PATTERNS.md#threading` covers it clearly.
   (dev-agent slip — most files were migrated.)
4. **CS0165 unassigned `currentPosition`** — ordinary coding slip, no UWP API involved.
5. **WMC9999 XAML internal NRE** — cascade from the un-compilable code-behind above;
   clears once the C# errors are fixed. (Distinct from the namespace-collision WMC9999
   the bootstrap root-namespace guard already prevents.)

## Highest-leverage, generalizable gaps
- **CS0104 ambiguity** is documented only for the `Windows.UI.Xaml` ↔ `Microsoft.UI.Xaml`
  axis; the **`System.Net.Http` ↔ `Windows.Web.Http`** axis (very common in any UWP app
  doing HTTP) is uncovered.
- **CS0103 after the namespace rewrite** has no "Common build errors" entry, so the
  sibling non-Xaml `Windows.UI.*` remap (`Colors`, `FontWeights`, …) is easy to miss.
