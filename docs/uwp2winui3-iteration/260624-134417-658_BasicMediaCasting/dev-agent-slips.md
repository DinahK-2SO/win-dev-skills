# Dev-agent slips — BasicMediaCasting (NO skill change)

## 1. Copied `<MediaElement>` verbatim, hit WMC0001
- Covered clearly at: `MIGRATION-PATTERNS.md` Controls table (~L416) and element-swap
  table (~L623); `unsupported-api-inventory.json` flags `MediaElement`.
- The bare XAML type swap is documented; the agent recovered in one turn. Only the
  *code-behind delegation* (separate skill-defect) was genuinely under-documented.

## 2. `SampleConfiguration.cs` CS8618 nullable warning
- Trivial, self-resolved, not migration-specific. No skill change.
