# Skill coverage gaps

- **`TargetPlatformMinVersion` reconciliation was under-emphasized** in `MIGRATION-PATTERNS.md#csproj`. Retained APIs can require a newer OS than the scaffold minimum; preserve the higher source minimum and treat `CA1416` as a required correction.
