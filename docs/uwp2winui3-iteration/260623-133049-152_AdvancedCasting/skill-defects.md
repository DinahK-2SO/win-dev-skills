# Skill defects — AdvancedCasting (WILL change skill)

1. **UWP `<uap:Extension>` carried over verbatim breaks packaged registration.**
   - Evidence: migrated manifest L27-29 has `windows.dialProtocol`; `winapp run` fails
     `0x80073CF6 / AppxManifest.xml(35,10) 0x80070032 "The request is not supported"`.
   - Skill state: **wrong** — MIGRATION-PATTERNS.md ~L440 tells the agent to merge
     `<uap:Extension>` from the UWP manifest, with no warning that some extensions abort
     registration.
   - Fix: add a "strip unsupported UWP `<Extensions>`" checklist step **and** a
     Validate-UwpMigration.ps1 static lint that FAILs on known-unregisterable extensions.
   - Generalizes: UWP samples commonly declare dialProtocol / share / protocol / bg-task /
     file-association extensions; any unregisterable one zeroes the whole app.

2. **Launch/validator tooling reports a manifest-registration failure as a benign env WARN.**
   - Evidence: session-log ~L9145 `[WARN] Smoke launch ... not a migration defect ... PASS`.
   - Skill state: **wrong** — Test-AppLaunch.ps1 L246 hard-codes "no AUMID => Developer
     Mode off / missing framework / MAX_PATH — not a migration defect".
   - Fix: detect manifest-registration HRESULTs in the winapp error string and classify as
     a defect (`crashed`) so Validate FAILs.
   - Generalizes: every migrated manifest defect surfaces as a no-AUMID registration
     failure; without this the validator false-PASSes broken apps in any scenario.
