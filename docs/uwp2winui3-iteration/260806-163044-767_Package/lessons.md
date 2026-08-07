# Lessons - Package

- `Initialize-UwpMigration.ps1` reliably copied and inventoried the eight source files.
- The data-bound NavigationView recipe was incomplete: a nested `NavigationViewItem`
  allowed selection highlighting while `Frame.Navigate` silently did not run.
- `Validate-UwpMigration.ps1` caught compiler and startup failures, but its final PASS
  did not cover this structural navigation anti-pattern.
- A project namespace can shadow a WinRT type (`Package`); a type alias fixes the
  resulting CS0234 errors without renaming the project.
- Concurrent launches of the same packaged identity can produce an empty-signature
  startup-crash result. Run build, launch, and final validation sequentially.

## Developer-agent struggles

- Turns 26-37 used four build/run attempts to repair data-template and `x:Bind` XAML,
  yet retained the silent nested-container defect.
- Turns 38-43 diagnosed a false startup crash while another app run remained active.
- The final response claimed all scenarios worked without performing the documented
  second-navigation switch check.

## Errors encountered

- CS0234 from namespace/type shadowing: alias `Windows.ApplicationModel.Package`.
- WMC0909/WMC1111/WMC9999 from an unresolved data-template model.
- WMC0503 from property-element `x:Bind`.
- WMC0035 from placing `MenuItemsSource` text in `NavigationView.Content`.
- Empty-signature startup crash from concurrent packaged-app launches.
