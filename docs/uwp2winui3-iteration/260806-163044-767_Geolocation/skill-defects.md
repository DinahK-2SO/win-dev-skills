# Skill defects

1. **Incomplete bootstrap inventory:** linked MSBuild items were omitted and legacy `AssemblyInfo.cs` was copied. Fix the bootstrap to evaluate `Include`/`Link`.
2. **Invalid manifest/background-task guidance:** copied UWP task declarations caused `0x80080204`. Preserve the scaffold manifest and require real activation registration.
3. **Invalid build command:** replace `winapp build` with `dotnet build`.
