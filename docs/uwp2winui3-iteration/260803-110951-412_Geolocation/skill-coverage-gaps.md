# Skill coverage gaps — Geolocation

## Duplicate-definition flood from header-only edits — **under-emphasized**
- **Evidence:** agent: "the edit replaced the header but left the original body intact,
  duplicating it"; 359× CS0111, 127× CS0102, 109× CS0106.
- **Covered at:** PATTERNS.md ~line 700 tells you to copy files verbatim (XAML only), but
  says nothing about the duplicate-body failure mode or its recovery, and nothing for `.cs`.
- **Improvement:** add a prominent "Common build errors" note — replace the WHOLE copied
  `.cs` file rather than editing a header; a CS0111/CS0102/CS0106 flood means a partial
  edit left a duplicated body → overwrite in full.
- **Generalizes:** partial-edit body duplication is a model-agnostic hazard in any
  multi-file migration.
