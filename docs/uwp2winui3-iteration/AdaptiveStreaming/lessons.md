# Lessons: AdaptiveStreaming

## Tools helpful
- **Initialize-UwpMigration.ps1** — bootstrap completed successfully
- **Validate-UwpMigration.ps1** — all checks passed

## Dev agent struggles
- **Shell conversion**: Agent preserved UWP SplitView + ListBox structure instead of converting to NavigationView + Frame. The skill table says `ListView` but UWP SDK samples use `ListBox`. The SplitView pane fails to render in WinUI 3, making all scenarios unreachable.

## Missing tooling
- Validator should check that the navigation surface renders and all scenarios are reachable (currently only checks process-alive)
