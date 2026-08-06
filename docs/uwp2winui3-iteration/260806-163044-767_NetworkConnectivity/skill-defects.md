# Skill defects

- **Linked project items absent:** Bootstrap ignored external `Include` + `Link` items, forcing manual reconstruction of shared UI and assets. This recurs in SDK samples and shared UWP projects.
- **False deferred warning:** Validator counted the bootstrap-generated `(none)` row as deferred content.
- **Misleading XAML diagnostic guidance:** `WMC0909` can be the root of later `WMC1111`/`WMC9999`; the existing text did not cover local `x:DataType` resolution.
- **Minimum OS omitted:** Project reconciliation did not preserve a higher UWP `TargetPlatformMinVersion`, causing avoidable `CA1416` churn.

