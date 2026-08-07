# Skill defects

1. **External linked items absent from bootstrap:** project-linked shared XAML, C#, resources, and assets outside `-Source` are omitted. Add evaluated-item copying before mapping.
2. **Wrong build command:** `winapp build` does not exist in the installed CLI. Use platform-qualified native `dotnet build`.
3. **Shell fidelity unspecified:** the NavigationView pattern omits theme, Settings visibility, pane geometry, title-bar, and wrapping rules.
4. **WMC0503 undocumented:** add valid `x:Bind` attribute syntax and code-assignment fallback.
