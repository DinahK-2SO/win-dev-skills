# Lessons — AudioCreation (UWP → WinUI 3)

Final score: **100/100** (6/6 scenarios pass). All signal is in the build-error
struggles the dev-agent hit and recovered from — these recur across scenarios.

## Errors encountered (root cause → fix)
1. **CS0103 `The name 'Colors' does not exist`** (47×, every scenario code-behind).
   - Root cause: WinUI 3 moved the `Colors` static palette to **`Microsoft.UI.Colors`**,
     but the `Color` struct it returns stays in **`Windows.UI`**. Files had
     `using Windows.UI;` but not `using Microsoft.UI;`, so unqualified `Colors.Red`
     failed to resolve.
   - Fix: add `using Microsoft.UI;` to every code-behind that uses `Colors`.
2. **CS1022 / WMC9999** — cascading symptoms of (1); cleared with the same fix.
3. **CS0579 `Duplicate 'Assembly*Attribute'`** (12×).
   - Root cause: UWP `Properties\AssemblyInfo.cs` copied into the migrated tree
     collides with the SDK-style project's auto-generated assembly attributes.
   - Fix: `<GenerateAssemblyInfo>false</GenerateAssemblyInfo>` (or delete the legacy
     `AssemblyInfo.cs`, the cleaner equivalent).
4. **CS0227 unsafe** — already documented in the skill; agent applied `AllowUnsafeBlocks`.

## Dev-agent struggles
- 2+ failed build cycles on the `Colors` errors before the agent inferred the missing
  `using Microsoft.UI;`. The mapping table mentions the namespace move but not the
  required `using` or the `Color`/`Colors` split.
- 1 build cycle on the duplicate `AssemblyInfo.cs`; the skill never mentions it.

## Tooling note
`Initialize-UwpMigration.ps1` rewrites `Windows.UI.Xaml` → `Microsoft.UI.Xaml` but
(a) does not handle the `Colors` split and (b) copies `AssemblyInfo.cs` into the build
tree.
