# Lessons — KeyCredentialManager (UWP → WinUI 3)

**Outcome:** score 100/100, builds ✓, runs ✓. Parity control-for-control on the Sign In page.
The migration succeeded, but the log shows **one substantive, generalizable struggle**.

## Headline struggle — project name collides with a WinRT type name

- The WinUI project (and root namespace) is named **`KeyCredentialManager`**, identical to the
  WinRT class `Windows.Security.Credentials.KeyCredentialManager`.
- Every unqualified static call — `KeyCredentialManager.OpenAsync/DeleteAsync/IsSupportedAsync/RequestCreateAsync`
  — bound to the **app namespace** instead of the WinRT class, producing **5× `CS0234`**
  ("The type or namespace name 'OpenAsync' does not exist in the namespace 'KeyCredentialManager'").
- The same build also emitted **`WMC1509` + `WMC9999` (Xaml Internal Error: Object reference not set…)**.
  This was a **cascade** of the failed C# compile (MarkupCompilePass2 had no LocalAssembly), **not** a
  XAML bug — it vanished once CS0234 was fixed.
- The dev-agent diagnosed it correctly (~10 turns) and fixed it with a using-alias:
  `using KeyCredentialManagerWinRT = Windows.Security.Credentials.KeyCredentialManager;` then rewrote each call.

**Why it generalizes:** Windows-universal-samples are routinely **named after the API they demo**
(`KeyCredentialManager`, `Clipboard`, `AppBar`, `Geolocator`, …). Any such sample migrated with
project-name == WinRT-type-name reproduces this exact CS0234 + WMC9999 pattern.

## Tools
- `Initialize-UwpMigration.ps1`, `Get-MigrationPattern.ps1`, `Validate-UwpMigration.ps1` all worked as intended.
- Gap: the validator's build-fail hint is generic; it does not call out CS0234-into-own-namespace as a name collision.

## Environment (not a defect)
- WinUI screenshot rendered blank in the non-interactive scoring session (swapchain cannot be composited);
  scoring fell back to the UIA tree. Eval artifact only.
