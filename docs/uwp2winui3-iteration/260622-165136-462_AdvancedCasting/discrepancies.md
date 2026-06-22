# Discrepancies — AdvancedCasting (improve trial classification)

| Feature | Status | Reason |
|---------|--------|--------|
| DIAL Receiver Windows Universal Application | FAIL | WinUI 3 app unreachable — package registration fails on `windows.dialProtocol` manifest extension (0x80073CF6). |

**Summary:** Build is clean (0 errors) but the app cannot register/launch because the
UWP `<uap:Extension Category="windows.dialProtocol">` was carried into
`Package.appxmanifest`. Single, generalizable manifest-extension defect; no per-control
parity could be measured.
