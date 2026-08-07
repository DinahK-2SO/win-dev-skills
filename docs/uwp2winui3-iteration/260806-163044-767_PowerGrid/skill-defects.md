# Skill defects

- **Linked project items absent:** bootstrap copied 4 files and ignored 16 external `Include`/`Link` inputs, forcing manual reconstruction. Fix project-item discovery in `Initialize-UwpMigration.ps1`.
- **Launch layout assumption wrong:** `Test-AppLaunch.ps1` only searched platform-qualified output and rejected a valid `bin\Debug` build. Discover complete layouts recursively.
- **WMC9999 diagnosis wrong:** it is a secondary compiler crash, not unique proof of a missing resource. Resolve preceding specific errors first.
- **Empty defer sentinel inconsistent:** bootstrap wrote a table placeholder while validator expected `No items deferred.`, producing a false warning.
