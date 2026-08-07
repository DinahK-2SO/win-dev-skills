# Store migration lessons

## Outcome

- Score: **0**; build: **pass**; run: **fail**.
- The clean build still crashed during XAML activation with `0xc000027b` in `Microsoft.UI.Xaml.dll`.
- `App.xaml` referenced `/Styles/Styles.xaml`, but the migrated tree contained only root `Styles.xaml`.

## Reusable lessons

- Legacy UWP project files can define important shared code, XAML, and assets through external `Include` + `Link` items. A project-directory walk is not a complete source inventory.
- Preserve each linked item's logical `Link` path. Package-root XAML URIs depend on that path.
- Build WinUI 3 with native `dotnet build`; the installed `winapp` has no `build` command.
- Launch discovery must accept both `bin/<arch>/Debug` and native `bin/Debug`.
- Validate local `ResourceDictionary Source` paths before launch; native stowed XAML failures may provide no managed event 1026.
- `DispatcherQueue.TryEnqueue` correctly marshals Store license-change UI updates.

## Errors and fixes

| Error | Root cause | Fix |
|---|---|---|
| `winapp build` rejected | Stale skill command | Use `dotnet build` |
| `NETSDK1022` duplicate Page | Explicit Page items plus SDK defaults | Remove explicit local Page entries |
| `CS0103` generated window members absent | XAML `x:Class` differed from code-behind | Match the fully qualified type |
| `CS0104` HTTP types ambiguous | Implicit System imports collided with Windows projection | Fully qualify/remove competing using |
| `WMC1509` warning and `WMC0909/1111/9999` errors | Unnecessary x:Bind DataTemplate introduced | Preserve source Binding template |
| Nullable warnings | New scaffold enabled nullable analysis | Initialize or mark deferred fields nullable |
| Launch helper unavailable | Only platform-qualified output was searched | Also search `bin/Debug` |
| Mapping rows copied | Status workflow skipped | Mark rows done/deferred |
| `0xc000027b` startup crash | Missing local merged-dictionary target | Restore the linked path or correct `Source` |

## Dev-agent struggles

- **Shared-content reconstruction (turns 5-23):** bootstrap copied only ten local files, so the agent manually recreated linked shell/pages/assets. The style dictionary landed at the wrong logical path.
- **Build loop (turns 24-32):** one invalid command and two failed builds preceded a clean build.
- **Launch diagnosis (turns 33-46):** the launch helper first missed valid output; four launch attempts and three validator runs then repeated the native crash. Removing Mica was an unsupported guess and did not help.

## Missing tooling addressed

- Linked MSBuild item materialization in bootstrap.
- Local XAML dictionary URI validation.
- Default native dotnet output discovery.
