# Dev Agent Slips: AdaptiveStreaming

**Category:** dev-agent-slip → will NOT change skill

## 1. Missing image assets (microsoft-sdk.png, windows-sdk.png)

**Problem:** MainPage.xaml references decorative images that weren't copied to the migrated project.

**Covered clearly at:** MIGRATION-PATTERNS.md § image reference reconciliation

**Slip type:** one-off-mistake — bootstrap mapped build artifacts as source files

**Why no skill change:** The skill already covers asset reconciliation. This is a bootstrap quirk, not a generalizable gap.
