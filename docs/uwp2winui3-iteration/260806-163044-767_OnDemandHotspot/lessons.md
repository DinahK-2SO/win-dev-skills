# Lessons: OnDemandHotspot

- **Helpful:** bootstrap inventory/TODO injection, anchored pattern lookup, and the validator's native `dotnet build` healthcheck.
- **Tool defects:** `winapp build` does not exist; the validator passed an explicit AppX schema failure; bootstrap copied legacy `Properties\AssemblyInfo.cs`.
- **Critical runtime failure:** `rescap:Capability` was placed after `uap4:CustomCapability`, so registration failed with `0xC00CE014` / `0x80080204`.
- **Main agent struggle:** external shared XAML was linked through several brittle paths instead of copied locally, causing repeated project/XAML compiler failures.
- **No environment issue was established:** the final failure was a deterministic invalid manifest, not Developer Mode, framework, certificate, or path state.
