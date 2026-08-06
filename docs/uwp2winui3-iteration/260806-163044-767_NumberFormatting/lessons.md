# Lessons: NumberFormatting

## What worked

- `Initialize-UwpMigration.ps1` established the mapping and mechanical rewrite baseline.
- `Get-MigrationPattern.ps1` returned useful csproj and navigation guidance.
- `Validate-UwpMigration.ps1` caught residue/build/startup issues and ultimately passed.
- Project-qualified `dotnet` commands exposed actionable compiler and deployment errors.

## Reusable failures

- The bootstrap copied only nine physical project-directory files and missed 21 linked shared items declared by the csproj, including all authored XAML, styles, shared code, and branded assets.
- Missing linked XAML pushed the agent into manual reconstruction from `obj`, producing four rounds of duplicate-type and malformed-XAML errors.
- Shell guidance encouraged `NavigationView` even though the source `SplitView`, `ListView`, and `Frame` remain supported. The redesign changed theme, footer, wrapping, and available viewport.
- `winapp build` is invalid in the installed CLI; compilation must use `dotnet build <path-to-csproj>`.
- The manifest launch failure (`0x80070002`/`0x80073CF6`) came from absent linked assets and retaining the UWP manifest shape.

## Scored consequence

All seven scenarios remained functional, but every feature was partial because the redesigned shell clipped headings and placed outputs below or partly outside the visible viewport.
