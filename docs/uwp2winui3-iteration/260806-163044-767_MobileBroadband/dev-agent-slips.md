# Dev-agent slips

1. **Bare launch command:** despite prominent `Test-AppLaunch.ps1` guidance, the agent ran `dotnet run` from the wrong directory and then waited on a long-lived process.
2. **Unfinished mapping ledger:** despite explicit per-file and final-gate instructions, all 16 rows remained `copied` until validation failed.

Neither warrants skill changes.
