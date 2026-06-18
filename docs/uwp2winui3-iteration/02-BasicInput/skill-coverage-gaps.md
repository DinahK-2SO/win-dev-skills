# Skill Coverage Gaps — BasicInput (iteration 2)

**Category:** skill-coverage-gap → WILL change skill

## Items

### 1. Namespace mapping table doesn't warn about inline fully-qualified references surviving bootstrap

- **Evidence:** ~30 CS0234 errors at first build (line 994) — `Windows.UI.Colors.RoyalBlue` etc. in multiple code-behind files.
- **Covered at:** MIGRATION-PATTERNS.md line 87 — Namespace Mapping table row for `Windows.UI.Colors` → `Microsoft.UI.Colors`.
- **Why missed:** Under-emphasized — the table lists the mapping but doesn't note that the bootstrap only rewrites `using` statements, not inline fully-qualified references.
- **Proposed improvement:** Add a note under the Namespace Mapping table: *"The bootstrap rewrites `using` statements but NOT inline fully-qualified type references. Expect CS0234 errors for mapped namespaces on first build — grep and fix remaining `Windows.UI.` references in code-behind."*
- **Generalizes:** Common in any UWP app with inline color/type references (event handlers, animations). Setting this expectation saves a build-fix cycle.
