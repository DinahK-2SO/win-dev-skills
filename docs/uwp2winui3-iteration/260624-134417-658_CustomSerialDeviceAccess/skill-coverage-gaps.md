# Skill coverage gaps (WILL change skill) — CustomSerialDeviceAccess

## 1. WMC XAML DataType errors are a C#-compile cascade — not called out
- **Evidence:** `WMC0909`/`WMC1111`/`WMC9999` reported on `MainPage.xaml` together with the
  4 `CS1061`, even though `x:DataType="local:Scenario"` and `public class Scenario` in
  `namespace SDKTemplate` are both valid.
- **Covered at:** `MIGRATION-PATTERNS.md` → `### x:Bind and compiled bindings` (~L683).
- **Why missed:** under-emphasized — the section only mentions `XLS0414`/`MC3074`.
- **Improvement:** add a sentence that WMC0909/WMC1111/WMC9999 are usually a cascade from a
  failed C# compile — fix CS errors first, don't delete valid `x:DataType`.
- **Generalizes:** the XamlCompiler runs after C# type resolution and mis-reports /
  crashes whenever code-behind fails to compile — a common intermediate migration state.
