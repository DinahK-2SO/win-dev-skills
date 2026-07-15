# Skill coverage gaps (WILL change skill — sharpen existing content)

## 1. Unknown UWP theme-resource key → opaque WMC9999 XAML compiler crash
- **Evidence:** `{ThemeResource SystemErrorTextColor}` (15x) → `Xaml Internal Error WMC9999: Object reference not set` + `WMC1509`. Agent first blamed FaceDetectionEffect.
- **Covered at:** MIGRATION-PATTERNS.md L593-609 (DynamicResource → ThemeResource).
- **Why missed:** under-emphasized — the section says key names changed but never warns that a *dangling* key crashes the markup compiler opaquely.
- **Improvement:** add the failure-mode warning + rule "verify every `{ThemeResource}`/`{StaticResource}` key exists in WinUI 3; replace removed UWP `System*` keys with a Fluent equivalent or literal brush," and list WMC9999-on-a-resource-key as the signature.
- **Generalizes:** removed/renamed Fluent v2 `System*` keys affect most XAML-heavy migrations.
