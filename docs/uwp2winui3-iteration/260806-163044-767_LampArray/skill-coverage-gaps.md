# Skill coverage gaps

- **DispatcherQueue ambiguity:** `MIGRATION-PATTERNS.md#threading` correctly required the WinUI dispatcher but did not cover files that retain `Windows.System`. Add an alias example so common `Launcher` imports do not produce `CS0104`.

