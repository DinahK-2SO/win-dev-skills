# Skill Coverage Gaps — ApplicationData (index 0)

## 1. Non-Xaml `Windows.UI.*` namespaces not mechanized by the bootstrap
- **Problem:** `Windows.UI.Colors.Green/Red` survived the bootstrap → CS0234 → cascaded into XamlCompiler WMC0909/WMC1111 (session-log turn 26, lines 2491-2497).
- **Covered at:** MIGRATION-PATTERNS.md Namespace Mapping table row `Windows.UI.Colors | Microsoft.UI.Colors` (line 92); intro line 3 says bootstrap only rewrites `Windows.UI.Xaml`.
- **Why missed:** under-emphasized — the bootstrap mechanizes the sibling `Windows.UI.Xaml` rewrite but silently skips Colors, and the table heading implies only Xaml rows matter.
- **Improvement:** auto-rewrite `Windows.UI.Colors` in the bootstrap; add a validator residue flag for `Windows.UI.(Colors|Text|Composition|Input)`; clarify the table note on what is auto vs. manual.
- **Generalizes:** named colors + other non-Xaml `Windows.UI.*` namespaces recur across most UWP samples and always relocate to `Microsoft.UI.*`.

## 2. WMC0909 XAML cascade mis-read as an x:DataType bug
- **Problem:** WMC0909 "Cannot resolve DataType" + WMC1509 "No LocalAssembly" were downstream of the CS0234, not a real XAML bug (fixing C# cleared them with no XAML edit).
- **Covered at:** MIGRATION-PATTERNS.md x:Bind section (line 593) covers only XLS0414/MC3074.
- **Why missed:** not prominent — the note addresses a different error family and gives no guidance on the MarkupCompilePass2 cascade.
- **Improvement:** add a note that WMC0909/WMC1509/WMC9999 during MarkupCompilePass2 usually means the C# failed to compile — fix CS errors first, don't edit the XAML.
- **Generalizes:** any project with a C# error + compiled XAML bindings emits this cascade.
