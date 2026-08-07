# Skill defects

- **Wrong build contract:** `winapp build` exited 1 and the first runtime check had no host-architecture layout. Replace it with a completed `dotnet build -p:Platform=<host-arch>`.
- **Managed HRESULT omitted:** the helper reported wrapper code `0xe0434352` instead of using event 1026 HRESULT `0x8001010E` for diagnosis.
- **Namespace-boundary pattern absent:** scaffold types and copied XAML classes can retain different root namespaces; explicit imports are safer than partial global renames.
