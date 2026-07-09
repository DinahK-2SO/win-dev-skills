# Lessons — RelativeInclinometer (UWP → WinUI 3)

**Outcome:** score 100, builds=true, runs=true, 2/2 features pass. Clean parity with the
UWP golden (both hardware-gated: no relative inclinometer sensor present).

## Tools that worked
- `Initialize-UwpMigration.ps1` — bootstrap namespace rewrite + per-file TODO seeding.
- `Get-MigrationPattern.ps1` — anchored pattern fetches (csproj, startup-crashes, threading, windowing).
- `Validate-UwpMigration.ps1` — build/residue gate, reported PASS.
- `Test-AppLaunch.ps1` — smoke launch confirmed runs=true.

## Errors encountered (both fixed, ~3 turns)
1. **CS0103 `App` does not exist** in `Scenario1_DataEvents.xaml.cs` / `MainPage.xaml.cs`.
   Root cause: SDK-sample sources are `namespace SDKTemplate` and reference `App`
   unqualified, but `dotnet new winui` scaffolds `App` in the **root** namespace
   (`RelativeInclinometer`). Fixed by adding `using RelativeInclinometer;`.
2. **WMC0909 / WMC1111 / WMC1509** on the `MainPage.xaml` scenarios `DataTemplate`
   (`x:Bind Title` over `x:DataType="local:Scenario"`). Root cause: cascade of the
   CS0103 code-behind failure aborting MarkupCompilePass. Fixed by switching to
   `Text="{Binding Title}"`.

## Key struggle → prevention
The single stuck point (first full build) was entirely the **SDKTemplate vs root
namespace split**. Preventable by documenting that build error + fix in the migration
skill's "Common build errors" section, and clarifying the x:Bind DataTemplate cascade.

## Environmental (eval-side, not migration defects)
- WinUI 3 PNG screenshots blank (DirectComposition capture limit) → graded via UIA tree.
- UWP CoreWindow exposes no inner UIA tree; mouse injection dead → UWP golden = default frame.
