# Skill defects

- **External linked items absent:** bootstrap mapped 4 files instead of the 20 project items because it ignored legacy csproj `Link` entries.
- **Direct-host lifecycle guidance wrong:** a directly hosted `Page` never receives `OnNavigatedTo`; this caused both scored features to disappear while the app stayed alive.
- **Default build layout unsupported:** `Test-AppLaunch.ps1` missed `bin\Debug`.
- **Deferred sentinel mismatch:** bootstrap's `(none)` row triggered a validator warning.

