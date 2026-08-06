# Skill defects

1. **Manifest schema failure passed validation.** Capability ordering was absent and explicit schema rejection was wrongly classified as environmental. General rule: `rescap:Capability` precedes custom/device capabilities, and registrar schema errors are hard failures.
2. **Wrong build command.** `winapp build` does not exist in the observed CLI. General rule: compile with `dotnet build`; use winapp-backed tooling for launch.
3. **Legacy assembly metadata copied.** Bootstrap copied `Properties\AssemblyInfo.cs`, causing CS0579. General rule: SDK-style targets generate these attributes, so legacy assembly-info files are not migration inputs.
