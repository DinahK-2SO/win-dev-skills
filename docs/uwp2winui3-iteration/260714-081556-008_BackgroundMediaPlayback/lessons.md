# Lessons — BackgroundMediaPlayback (UWP → WinUI 3)

**Outcome:** score 0, builds=false, runs=false, timeout=true. The migrated app fails to
build, so nothing launched and both features scored `fail`.

## Root cause (single, high-leverage)
- The Windows Universal Samples put the **entire app in `namespace SDKTemplate`** (App,
  MainPage, every scenario Page, plus shared `MainPage.Current` / `NotifyUser` /
  `NotifyType` / `Scenario` helpers). `x:Class="SDKTemplate.*"` and
  `xmlns:local="using:SDKTemplate"` in XAML.
- The WinUI scaffold uses the **project name** as its root namespace. The bootstrap only
  rewrites `Windows.UI.Xaml → Microsoft.UI.Xaml`; it does not reconcile the root namespace.
- The agent renamed `SDKTemplate → BackgroundMediaPlayback` across 26 files but left **one**
  stray `using SDKTemplate;` in `Settings.xaml.cs:15`. With no `namespace SDKTemplate`
  declared anywhere, that using is orphaned → **CS0246** → the code-behind partial class
  fails → the XAML compiler crashes with a **cascading WMC9999**. Whole build fails.

## Errors
- `Settings.xaml.cs(15,7): CS0246 'SDKTemplate' not found` — orphaned partial-rename residue.
- `WMC9999 Xaml Internal Error: Object reference not set` — cascade from the CS0246.

## Dev-agent struggle
- Spent turns 5–39 doing an ad-hoc, file-by-file namespace rename + XAML re-authoring and
  **timed out mid-rename** before running the final build/validate. The reconciliation is a
  large manual task with no doc or tooling support; one missed line broke everything.

## Prevent (generalizes to 88/94 corpus samples that use `namespace SDKTemplate`)
1. Doc: SKILL.md Step 1 + MIGRATION-PATTERNS.md — reconcile the root namespace in **one
   tree-wide sweep** (.cs + .xaml), then grep for residual `SDKTemplate` before building.
2. Tooling: `Validate-UwpMigration.ps1` fails on an orphaned `SDKTemplate` reference (no
   `namespace SDKTemplate` declared) — catches a missed spot deterministically, pre-build.
