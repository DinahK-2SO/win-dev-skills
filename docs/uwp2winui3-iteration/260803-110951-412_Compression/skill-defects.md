# Skill defects — Compression (index 0)

## 1. No guidance on `#if WINDOWS_PHONE_APP` dead branches + orphaned-tail build errors (absent)
- **Evidence:** session-log turns ~21-27 — 14 errors CS8803/CS0106/CS1022 in `Scenario1.xaml.cs` (+ cascading WMC0909/WMC1111/WMC9999). Agent: "leftover content from the old file … the edit only replaced the beginning".
- **Skill search:** `#if`, `WINDOWS_PHONE`, `Continuable`, `PickSingleFileAndContinue`, `dead code` → **no matches** anywhere in the skill.
- **Root cause:** (1) no rule to delete phone-only/device-family `#if` branches wholesale; (2) no build-error entry mapping CS8803/CS0106/CS1022 to an orphaned tail from a partial class-body replace.
- **Fix:** add a `Common build errors` entry (CS8803/CS0106/CS1022 → orphaned tail; ensure a class-body replace spans the whole original body) + note that `#if WINDOWS_PHONE_APP` picker-continuation code (`IFileOpenPickerContinuable`/`PickSingleFileAndContinue`/`ContinueFileOpenPicker`) is dead code to delete.
- **Generalizes:** phone/Xbox `#if` guards and the picker-continuation pattern appear across many UWP samples; partial replaces leaving orphaned tails are a recurring, costly failure mode.
