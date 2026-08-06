# Skill defects

- **Linked project items absent:** bootstrap copied only physical files under `-Source`, omitting common UWP shared-content links. Fixed in `Initialize-UwpMigration.ps1`.
- **Capability ordering absent:** runFullTrust presence passed even when AppX schema order made registration invalid. Added prose and a validator check.
- **Unavailable launch treated as success:** an inconclusive smoke launch could satisfy the mandatory gate. The validator now requires an observed live process.
