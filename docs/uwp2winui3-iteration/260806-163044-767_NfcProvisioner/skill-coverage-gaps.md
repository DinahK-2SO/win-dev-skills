# Skill coverage gaps

- **WinUI manifest entry point:** the checklist correctly said to keep `EntryPoint="$targetentrypoint$"`, but the validator did not enforce it and the agent partially applied the manifest guidance. Added a mechanical gate because this requirement is universal for packaged migrations.
