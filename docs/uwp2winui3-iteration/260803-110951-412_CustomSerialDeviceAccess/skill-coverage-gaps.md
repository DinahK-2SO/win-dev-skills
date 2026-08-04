# Skill Coverage Gaps — CustomSerialDeviceAccess (WILL change skill)

1. **WMC0909/WMC1111 DataTemplate x:Bind/x:DataType resolution** (grey-zone)
   - Evidence: turns 79-98, 'Cannot resolve DataType local:Scenario'; fixed via {Binding Title}.
   - Covered near the WMC9999/WMC1509 failure-mode note, but WMC0909/WMC1111 not disambiguated.
   - Improvement: one line distinguishing WMC0909 (binding DataType) from WMC9999 (dangling resource key); simple item templates -> classic {Binding}.
   - Generalizes: migrated list/nav templates commonly use x:Bind with a local DataType.
