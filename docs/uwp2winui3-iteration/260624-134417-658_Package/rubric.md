# Parity Rubric — Package (UWP → WinUI 3)

Ground truth: original UWP `PackageSample` (C#), launched live (PID 4888, window
"PackageSample C# sample"). Each scenario has one input button and a status/output
`TextBlock`. A scenario PASSES only if the migrated control is present AND produces
the same *kind* of output the UWP handler produced.

## Scenario 1 - Identity
- Control: `GetPackage` Button ("Get Package") → `GetPackage_Click`.
- Expected output: current package identity (Name, Version, Architecture, ResourceId,
  Publisher, PublisherId, FullName, FamilyName, IsFramework, ...).

## Scenario 2 - Installed Location
- Control: `GetInstalledLocation` Button ("Get Installed Location") → handler.
- Expected output: `Installed Location: <path>` (the package's AppX install folder).

## Scenario 3 - Dependencies
- Control: `GetDependencies` Button ("Get Dependencies") → handler.
- Expected output: `Count: N` followed by each dependency package full name.
  (Dependency *values* legitimately differ between the UWP package and the WinUI 3
  package — the correct behavior is that the API is called and the real list rendered.)
