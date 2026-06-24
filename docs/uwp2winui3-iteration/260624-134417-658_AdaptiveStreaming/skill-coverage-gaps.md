# Skill-coverage-gaps — AdaptiveStreaming

- **CS0103 `Colors` / `ColorHelper` not found.** Already in the Namespace Mapping table
  (`Windows.UI.Colors → Microsoft.UI.Colors`) but buried as a fully-qualified swap. The
  Initialize bootstrap rewrites only `Windows.UI.Xaml`, so sibling `Windows.UI.*` types
  used unqualified break with CS0103. Improvement: name it as a common build error and note
  the fix is `using Microsoft.UI;`. Generalizes to nearly all UWP code-behind.
