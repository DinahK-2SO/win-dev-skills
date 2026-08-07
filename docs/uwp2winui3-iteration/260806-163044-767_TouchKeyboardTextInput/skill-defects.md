# Skill defects

1. **MSBuild-linked files were absent from bootstrap inventory.** The project linked its shell, pages, styles, code, and assets from sibling shared folders, but the script copied only the physical project tree. Fix the bootstrap to resolve `Include`/`Link` items before mapping.
2. **`0xc000027b` guidance was wrong and caused unsafe diagnosis.** With `Microsoft.UI.Xaml.dll` and no managed stack, prioritize startup XAML/resource isolation and preserve merged dictionaries; do not infer an unsupported API without evidence.
3. **`winapp build` was invalid.** Compile with `dotnet build`; use the launch helper for packaged execution.
