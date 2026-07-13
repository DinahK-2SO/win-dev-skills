# Dev-Agent Slips — ApplicationData (index 0)  (NOT skill changes)

1. **Mapping rows left at `copied`** → validator FAIL, fixed in one turn (session-log 2952-2987). The validator names the exact fix; normal review loop. No skill change.
2. **CoreDispatcher → DispatcherQueue** — applied correctly per the prominent Threading section (MIGRATION-PATTERNS.md #threading). No friction. No skill change.
3. **Light-vs-dark default theme** — minor/non-functional scoring observation, not a general migration rule. Forcing RequestedTheme would be scenario-specific cosmetics. No skill change.
