# Store parity discrepancies

**Score:** 0 · **Builds:** yes · **Runs:** no

The migrated app crashed during startup, so every feature failed:

1. Trial-mode
2. In-app purchase
3. Unmanaged consumable product
4. Managed consumable product
5. User collection
6. App listing URI
7. Business to Business

The UWP Trial-mode frame rendered (`parity/baseline/screenshots/01_Trial_mode_corewindow.png`); no WinUI frame was available. The common suspected cause is the unresolved local style dictionary path left after linked shared content was copied to the wrong logical location.
