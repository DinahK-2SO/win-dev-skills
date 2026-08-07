# PersonalDataEncryption lessons

- **Bootstrap missed linked source:** the UWP csproj linked shared XAML, code, styles, and assets from outside `cs`; the directory walk copied only four physical files. The agent spent nine turns finding generated `obj` XAML and rebuilding pages.
- **Runtime availability defeated build-only validation:** `UserDataProtectionManager` compiled cleanly but `TryGetDefault()` returned `null` in the desktop process, so both pages hid every functional control behind the unavailable panel.
- **Build guidance was wrong:** `winapp build` does not exist in the installed CLI. `dotnet build` worked and exposed actionable `CA1416` warnings.
- **Dependent commands must be sequential:** both bootstrap/self-check and build/launch were raced, producing false “not found” and “unavailable” results.
- **Minimum OS matters separately from the TFM:** the retained protection APIs required `10.0.18362`, while the scaffold declared `10.0.17763`.

## Errors encountered

| Error | Root cause | Fix |
|---|---|---|
| Bootstrap target not found | Scaffold and bootstrap ran concurrently | Wait for scaffold completion |
| Mapping self-check `False` | Self-check raced bootstrap | Run the three gates sequentially |
| `winapp build` unrecognized | Skill named a nonexistent command | Use `dotnet build` |
| Launch output unavailable | Launch check raced build | Build before launch |
| `CA1416` warnings | Target minimum below API minimum | Reconcile `TargetPlatformMinVersion` |

## Dev-agent struggles

- **Linked XAML discovery:** nine turns; prevent by materializing csproj `Include`/`Link` items in bootstrap.
- **Build/launch recovery:** four turns; prevent with correct build command, sequential ordering, and explicit OS-minimum guidance.
