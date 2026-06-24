# Dev-agent slips — Accelerometer (skill already covers; NO skill change)

1. **Static-window init-order race (latent).** `MainWindow` ctor navigates to `MainPage` before `App.MainWindow` is assigned; `MainPage.OnNavigatedTo` dereferences `App.MainWindow!`. Covered prominently by MIGRATION-PATTERNS.md "keep MainWindow's constructor inert / navigate after Activate" + the `0x80004003` row. Latent only (app dies earlier). → slip.
2. **Did not revert the regressive entry-point edit** despite repeated identical validator FAILs. Skill already says the `[STAThread]` Main is correct and that deleting a hand-written entry point is the simplest path. Generic engineering discipline. → slip.
