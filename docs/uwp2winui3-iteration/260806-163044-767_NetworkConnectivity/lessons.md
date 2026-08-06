# NetworkConnectivity migration lessons

- **Helpful tooling:** Bootstrap triage found the dispatcher adaptation; the anchored pattern supplied the correct replacement; build, launch, and validation tools exposed compile/runtime state precisely.
- **Largest friction:** The bootstrap copied only six local files and ignored MSBuild-linked shared content. The agent spent turns 5-18 reconstructing the linked shell, scenario XAML, styles, and assets manually.
- **Build errors:** SDK implicit usings caused `HttpClient` ambiguity; unresolved `x:DataType` caused the `WMC0909` -> `WMC1111`/`WMC9999` chain; nullable profile dereferences and an inherited minimum-OS mismatch caused warnings.
- **Tool inconsistency:** The validator warned about its own generated `(none)` deferred placeholder.
- **Agent slip:** The first bootstrap self-check was incorrectly parallelized and returned `False`; rerunning it after bootstrap returned `True`.

