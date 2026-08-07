# Skill coverage gaps

- **Manifest activation invariant:** the patterns file correctly required `EntryPoint="$targetentrypoint$"`, but the mandatory validator did not enforce it or reject a retained manifest combined with `WindowsPackageType=None`. This omission allowed a clean build followed by a startup crash that made all scenarios unreachable.

