# Skill coverage gaps

## G1 — CS0104 guidance was too narrowly framed

- **Evidence:** retained `Windows.Web.Http` collided with SDK implicit `System.Net.Http` imports.
- **Covered at:** `MIGRATION-PATTERNS.md` → `CS0104: 'LaunchActivatedEventArgs' is an ambiguous reference`.
- **Why missed:** the rule emphasizes UWP/WinUI XAML collisions rather than all same-simple-name collisions.
- **General improvement:** broaden the existing fully-qualify/remove-using rule to retained Windows projections versus SDK implicit usings.
