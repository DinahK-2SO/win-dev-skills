# Dev-agent slips — SimpleImaging (will NOT change skill)

1. **Ran the bare `.exe` directly** (turn ~4541) — the skill prominently says *"never run the .exe directly"* and to use `Test-AppLaunch`. Read-but-ignored. (The tool's misattribution of the resulting artifact is a separate defect that IS fixed.)

2. **Downgraded `Microsoft.WindowsAppSDK` 2.2.0 → 1.7.x** (turns ~5585-5720), breaking deployment — an exploratory misstep, not something the skill invites. Correct `0xc0000409` guidance (added as a defect fix) would have redirected to the startup XAML instead.
