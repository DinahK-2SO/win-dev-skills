# Skill defects

1. **Manifest/startup tooling contradicted the documented invariant.** Bootstrap replaced the scaffold manifest; validation missed `$targetentrypoint$`; diagnostics omitted the managed frame. Fixed in initializer, validator, launch helper, and patterns.
2. **Linked MSBuild items were absent from bootstrap.** External code, XAML, and assets are now imported to their `<Link>` paths.
3. **`winapp build` was invalid guidance.** Build instructions now use an explicit `dotnet build <csproj>`.
