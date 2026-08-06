# Skill defects

1. **External linked project items were absent from bootstrap.** The UWP project linked shared shell, styles, and assets outside its directory, but bootstrap mapped only 9 local files. Add Tier 1 linked-item materialization and explicit failure for unresolved links. This recurs across legacy UWP projects and SDK samples.
2. **Build commands were wrong.** `winapp build` is unsupported, an unscoped `dotnet build` failed from the parent directory, and platform-unspecified output was not discoverable by the launch helper. Prescribe `dotnet build <csproj> -c Debug -p:Platform=<host-arch>`.
