# PenHaptics migration lessons

- **Bootstrap gap:** only 7 physical project files were copied. Explicit csproj `Include` + `Link` items for shared shell XAML, styles, scenarios, and assets were omitted, forcing about 20 turns of manual reconstruction.
- **Build recovery:** compiler diagnostics identified unsupported inking controls, namespace ambiguity, XAML model activation/binding issues, deferred-type references, projected-type comparison, style-resource access, and definite assignment. Five build iterations eventually succeeded.
- **Runtime blocker:** the app repeatedly crashed with `0xc000027b` in `Microsoft.UI.Xaml.dll`. `App.xaml` referenced `/Styles/Styles.xaml`, while manual reconstruction placed `Styles.xaml` at the root. Existing diagnostics did not check this deterministic mismatch.
- **Tool friction:** `Test-AppLaunch.ps1` ignored default `bin\Debug` output and initially returned unavailable; the validator later found the crash only after its architecture-specific rebuild.
- **Correct defer:** `InkCanvas`/`InkToolbar` have no WinUI 3 desktop equivalent. The full XAML/code-behind pair must be mapped and deferred together.

See `lessons.json` for the full error-to-root-cause-to-fix chains and agent struggle evidence.
