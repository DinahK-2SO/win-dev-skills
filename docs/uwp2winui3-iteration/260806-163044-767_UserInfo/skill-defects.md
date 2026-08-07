# Skill defects

- **Linked project items absent:** the bootstrap missed shared shell XAML, code, styles, and assets declared with `<Link>`. This caused most build/runtime churn and the visual regression. Fixed in `Initialize-UwpMigration.ps1`.
- **Wrong build command:** `winapp build` does not exist in the installed CLI. Replaced with explicit x64 `dotnet build`.
- **Ambiguous threading sample:** unqualified `DispatcherQueue` conflicts with `Windows.System.DispatcherQueue`. The pattern now qualifies the WinUI type.
- **Shell identity guidance wrong/missing:** source theme, title, and branding were not invariants, while scaffold assets were preferred. Guidance now preserves source identity and rejects scaffold placeholders.
- **Deferred sentinel mismatch:** validator now accepts the initializer's `(none)` row.
