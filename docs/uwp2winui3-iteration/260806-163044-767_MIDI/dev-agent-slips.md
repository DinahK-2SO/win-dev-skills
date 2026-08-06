# Dev-agent slips

1. **Manifest assets were not reconciled before launch.** The agent had already fetched a dedicated section describing the exact `-sdk` asset failure, so no skill change is warranted.
2. **Mapping statuses stayed copied.** Step 1 and the validator both clearly require resolved statuses; the existing validator caught the slip.
3. **The app was left crashing.** Final code still navigated from `MainWindow` construction despite the prominent inert-constructor rule, and the agent stopped while mandatory validation was failing. This single crash caused all three feature failures.
