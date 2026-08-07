# Skill defects

- **Linked project items absent:** bootstrap ignored external csproj `Include`/`Link` items, a common UWP shared-content pattern. Fix in `Initialize-UwpMigration.ps1`.
- **Wrong build command:** `winapp build` does not exist. Use `dotnet build <project.csproj>`.
- **Personal-data protection absent from inventory:** `UserDataProtectionManager` compiled but was unavailable at runtime, hiding both feature pages. Pre-classify it as unsupported rather than accepting fallback-only success.
