# Lessons — ApplicationData (UWP → WinUI 3)

**Outcome:** score 100/100, both features pass. The leverage is in the *build journey*, not the final parity.

## Errors encountered
- **CS0118: 'ApplicationData' is a namespace but is used like a type.**
  Root cause: the WinUI 3 project is named `ApplicationData` (after the UWP sample, which
  is named after the `Windows.Storage.ApplicationData` API it demos). The project's default
  root namespace therefore *shadows* the identically-named Windows type, so
  `using Windows.Storage;` + `ApplicationData.Current` bound to the namespace.
  Fix: fully-qualify (`Windows.Storage.ApplicationData.Current`, `Windows.Storage.SetVersionRequest`…).

- **WMC0909 / WMC1111 / WMC1509 / WMC9999 XAML errors (MainPage.xaml).**
  Root cause: a *cascade* from the CS0118 C# failure — MarkupCompilePass2 ran without a
  LocalAssembly (WMC1509) and couldn't resolve project-local x:Bind/x:DataType types.
  Stale `obj/x64` made it worse. Fix the C# error + clean stale `obj` first; the XAML
  "errors" vanish with no XAML change.

## Dev-agent struggle
At TURN 28-30 the agent diagnosed "two issues" (namespace conflict + XAML type resolution)
when there was really one root cause plus a cascade. Both are undocumented in the skill,
so it had to infer them. Documenting them removes the guesswork.
