# Skill coverage gaps — KeyCredentialManager (WILL change skill)

## 1. Validator build-fail hint is generic for the name-collision CS0234 (under-emphasized)

- **Problem:** On build failure the validator prints distinct `error CSxxxx` lines + one generic
  pointer. It does not name the project-name/WinRT-type collision even though the CS0234 message
  literally contains the project's own namespace (machine-detectable).
- **Evidence:** `Validate-UwpMigration.ps1` ~lines 507–518; dev-agent reasoned out the collision
  manually (session-log turns 39–50).
- **Covered at:** `Common build errors after the namespace rewrite`; validator build-fail branch.
- **Fix:** Detect `CS0234` whose namespace token == project base name and print a targeted pointer
  to the new namespace-collision anchor.
- **Generalizes:** Keys only on the generic collision signature; fires for any API-named sample.
