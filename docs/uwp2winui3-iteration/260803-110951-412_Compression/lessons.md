# Lessons — Compression (index 0)

**Outcome:** score 100/100, builds ✅, runs ✅, 1/1 feature pass. A clean migration — only a cosmetic theme difference (UWP dark vs WinUI light default) at scoring, no functional defects.

## Helpful tools
- `Initialize-UwpMigration.ps1` — seeded TODO markers + mapping; drove the port.
- `Validate-UwpMigration.ps1` — PASS gave a clean completion signal.

## Special APIs
- **Phone picker continuation** (`IFileOpenPickerContinuable` / `PickSingleFileAndContinue` / `ContinueFileOpenPicker`) wrapped in `#if WINDOWS_PHONE_APP`. No WinUI 3 equivalent — the whole `#if` branch is **dead code to delete**, not port. The desktop path (`PickSingleFileAsync` + `InitializeWithWindow`) is the only path.

## Errors encountered
- **CS8803 / CS0106 / CS1022 (14 errors, Scenario1.xaml.cs)** — a large replace edit of the converted class body did **not** span the full original file; the tail (the phone picker methods + closing braces) survived after the new class's closing brace → orphaned members. The source's `#if WINDOWS_PHONE_APP` branch made the real class longer than assumed. Fixed by truncating the orphaned tail.
- **WMC0909 / WMC1111 / WMC9999 (MainPage.xaml)** — purely cascading from the C# errors (MarkupCompilePass aborted, WMC1509 'No LocalAssembly'). The `x:DataType='local:Scenario'` was already correct; vanished once C# compiled.

## Dev-agent struggle (high-value)
- ~5 turns lost recovering from the partial-replace / leftover-`#if`-branch problem. **Preventable by:** skill guidance to delete phone-only preprocessor branches wholesale, verify no orphaned members after a big class-body replace, and a build-error entry mapping CS8803/CS0106/CS1022 to "orphaned tail from a partial replace".
