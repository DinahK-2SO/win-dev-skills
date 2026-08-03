# Dev-agent slips — CameraStarterKit

## 1. Duplicated/corrupted MainPage.xaml.cs after an edit (one-off)
- Turns 39–40: an edit left the original UWP body appended; agent noticed immediately and rewrote the file cleanly, recovering to a passing build.
- **No skill change:** edit-mechanics mistake, not a migration-pattern topic. A re-run would self-correct; encoding "don't corrupt files" is noise.
