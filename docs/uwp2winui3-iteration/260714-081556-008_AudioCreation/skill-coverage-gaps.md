# Skill Coverage Gaps — AudioCreation (WILL change skill)

## 1. CS0227 unsafe is documented reactively, not prevented
- **Covered at:** MIGRATION-PATTERNS.md `### CS0227: Unsafe code ...` (says add
  `<AllowUnsafeBlocks>true</AllowUnsafeBlocks>`).
- **Why missed:** under-emphasized / purely reactive — only helps after the first build
  already failed with CS0227.
- **Evidence:** session-log ~turn 46 build FAIL (CustomEffect.cs, Scenario3_FrameInputNode.xaml.cs).
- **Improvement (Tier 1):** Initialize-UwpMigration.ps1 detects `unsafe` in copied `.cs`
  and auto-adds `<AllowUnsafeBlocks>` to the scaffold csproj at bootstrap.
- **Generalizes:** all raw-buffer media samples (AudioGraph frames, custom audio effects,
  SoftwareBitmap/pixel, camera frames) hit CS0227 — a whole recurring family.
