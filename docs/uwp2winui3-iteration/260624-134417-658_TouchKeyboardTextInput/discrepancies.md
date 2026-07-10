# Discrepancies — TouchKeyboardTextInput (index 0)

- **Score 0/11, builds: false, runs: false.**
- All 11 rubric features `fail` for one reason: the WinUI 3 app never compiled.
- UWP golden launched and captured; WinUI has no counterpart frames.

## Suspected skill gap (all features)
The bootstrap copied the scenario pages' `*.xaml.cs` without their `*.xaml` markup (orphaned
code-behind), so the XAML compile pass failed (WMC0909/WMC1111/WMC9999) and cascaded into
`InitializeComponent` CS0103/CS1061. Recovering the missing markup during bootstrap removes the
root cause.
