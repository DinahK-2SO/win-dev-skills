# Skill defects

- **Launch layout discovery:** `Test-AppLaunch.ps1` assumed `bin\<arch>\Debug`; default SDK output used another valid layout. Replace path inference with executable/manifest discovery.
- **WMC9999 diagnosis:** the patterns file incorrectly treated this generic cascade as proof of a dangling resource. Specific compiler errors must be fixed first.

