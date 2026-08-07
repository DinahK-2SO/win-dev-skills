# Skill defects

- **Linked project items absent:** Bootstrap copied only files under `-Source`, omitting shared authored files referenced with MSBuild `Include`/`Link`. This caused manual reconstruction and multiple secondary build errors.
- **Wrong compile command:** `SKILL.md` prescribed `winapp build`, but that command does not exist in the installed WinApp CLI. Use native `dotnet build`.
- **Launch output discovery wrong:** `Test-AppLaunch.ps1` ignored standard `bin\Debug\<tfm>\win-<rid>` output and incorrectly reported that no build existed.
