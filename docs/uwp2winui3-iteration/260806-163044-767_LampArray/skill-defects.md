# Skill defects

- **Linked project items were absent from bootstrap inventory.** The script copied four files despite 17 external linked items, forcing manual recovery. Fix: resolve explicit MSBuild items to safe `Link` destinations before triage. This recurs in shared UWP projects and SDK samples.
- **Win2D package mapping was absent.** `Win2D.uwp` did not provide WinUI 3 Canvas types. Fix: map it to `Microsoft.Graphics.Win2D`. This recurs in graphics-heavy migrations.
- **Namespace/type shadowing guidance was absent.** The scaffold namespace hid a platform type with the same name, producing `CS0118`. Fix: alias or fully qualify the platform type instead of renaming the entire project namespace.

