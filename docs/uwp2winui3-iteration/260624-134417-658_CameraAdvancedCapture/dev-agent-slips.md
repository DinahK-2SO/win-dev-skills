# Dev-agent slips — CameraAdvancedCapture (will NOT change skill)

Both items are non-blocking `WUI0004` warnings the build tolerated (score 100):

1. **`DisplayInformation.GetForCurrentView()`** left in MainPage.xaml.cs(638).
   Covered clearly at `MIGRATION-PATTERNS.md#getforcurrentview` L262 (named replacement)
   and the WUI0004 row L554. → read-but-ignored.
2. **`SystemMediaTransportControls.GetForCurrentView()`** left in MainPage.xaml.cs(655).
   Covered by the general GetForCurrentView rule L256 + WUI0004 row L554. → read-but-ignored.

No skill change: the guidance is prominent; a capable re-run resolves both without edits.
