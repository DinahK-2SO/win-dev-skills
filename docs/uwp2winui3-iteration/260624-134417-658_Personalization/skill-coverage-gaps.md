# Skill coverage gaps — Personalization (WILL change skill)

## 1. WMC0909/WMC1509 XAML type-resolution errors are often a cascade from a C# compile error
- **Covered at (weakly):** MIGRATION-PATTERNS.md line 810 — attributes `XLS0414/MC3074`
  "type not found" *only* to stale UWP namespace prefixes in the XAML.
- **Why missed:** under-emphasized; never mentions that a C# compile failure starves
  `MarkupCompilePass2` of a local assembly and produces these XAML errors as symptoms.
- **Evidence:** failed build had CS0102/CS0111 *and* WMC0909/WMC1111/WMC1509 together;
  fixing only the C# duplicate class cleared the WMC errors with no XAML change.
- **Improvement:** add a "Common build errors" subsection: fix all `CSxxxx` errors first,
  rebuild, and only chase stale XAML namespaces if the WMC error survives a clean C# build.
- **Generalizes:** any C# compile failure breaks XAML local-type resolution — recurs across
  every migration touching `x:DataType`/`x:Bind`/converters.
