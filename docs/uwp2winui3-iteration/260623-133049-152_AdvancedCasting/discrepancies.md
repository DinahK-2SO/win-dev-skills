# Discrepancies — AdvancedCasting (UWP → WinUI 3)

**Score 0/100. builds=true, runs=false.** Single decisive defect cascades to all 6 features.

## Decisive defect
Migrated `Package.appxmanifest` carried over the UWP
`<uap:Extension Category="windows.dialProtocol">` block. Packaged WinUI 3 desktop cannot
register it → `0x80073CF6` / `AppxManifest.xml(35,10) 0x80070032 "The request is not
supported"` → app never launches → every scenario unreachable.

| # | Scenario | Status | Reason |
|---|----------|--------|--------|
| 1 | Media Element Casting 101 | fail | app unreachable (registration failure) |
| 2 | Casting APIs and a Custom Cast Button | fail | app unreachable |
| 3 | DIAL Sender Universal Windows app | fail | app unreachable |
| 4 | DIAL Receiver Windows Universal app | fail | app unreachable |
| 5 | Multi-View Media Application | fail | app unreachable |
| 6 | Combine Casting Methods | fail | app unreachable |

## Suspected skill gap
The migration skillset (a) tells the agent to carry over `<uap:Extension>` content
verbatim, and (b) its launch/validator tooling reports the resulting registration failure
as a benign environment WARN, yielding a false PASS.
