# Skill defects

- **Legacy XAML deferral absent:** Four old lazy directives survived bootstrap and validation; all scored features were blocked by native XAML startup failure. Add an automatic equivalent rewrite and residue check.
- **Build command wrong:** `winapp build` is unavailable. Standardize on `dotnet build -p:Platform=x64`.
- **Deferred sentinel mismatch:** Bootstrap `(none)` and validator `No items deferred` disagree, causing a warning in every zero-defer migration.
- **Shared assets absent:** Bootstrap does not report unresolved `ms-appx` assets that live outside the selected source subtree.
