# Skill defects

- **Linked project items absent:** bootstrap copied only physical descendants of `Source`, omitting shared XAML/code/assets referenced by `Include` + `Link`.
- **Defensive UI wrong:** replacing/collapsing the feature panel removed every scored control; unavailable hardware must leave controls visible and disable actions.
- **Build/launch workflow outdated:** `winapp build` is not a command, and launch lookup missed default `dotnet build` output.
- **Minimum contract absent:** project guidance did not reconcile `TargetPlatformMinVersion`/manifest `MinVersion` with retained APIs or `CA1416`.

