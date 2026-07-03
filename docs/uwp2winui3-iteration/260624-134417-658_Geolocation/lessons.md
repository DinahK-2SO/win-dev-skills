# Lessons — Geolocation (UWP → WinUI 3)

## Headline
The migrated app **built clean (0 errors, 88 warnings) but never launched**: AppX
registration failed with **`0x80080204`** because the copied `Package.appxmanifest`
still declares three UWP **`windows.backgroundTasks`** in-process `EntryPoint`
extensions (Geofence / Location / Visit) with no matching
`windows.activatableClass.inProcessServer` activatable-class registration. All 8
scenarios were unreachable → **score 0/100**.

## Root cause
In a **packaged WinUI 3 / Windows App SDK** app, a non-audio background task declared
with `EntryPoint="..."` **must** have a corresponding
`windows.activatableClass.inProcessServer` `ActivatableClass` entry. A UWP manifest has
none — UWP auto-registered these. Copying the manifest "migrate-as-is" therefore
produces a manifest the AppX registrar rejects.

## Why it slipped through
- The manifest was mapped `migrate-as-is` / `copied` (session-log lines 323, 393).
- The build succeeded, so the dev-agent considered the task done.
- `Validate-UwpMigration.ps1` Section 5b checks `TargetDeviceFamily` / `rescap` /
  `runFullTrust` **but not** `windows.backgroundTasks` extensions.
- The migration skill (`SKILL.md`, `MIGRATION-PATTERNS.md`) has **zero** mention of
  background tasks or activatable-class registration (grep: no matches).

## Fix (generalizable)
Reconcile `windows.backgroundTasks` extensions when migrating a UWP manifest:
- **Default (foreground parity):** remove the `<Extension Category="windows.backgroundTasks">`
  blocks. The C# `BackgroundTaskBuilder` code still compiles; only in-app registration
  fails (caught by scenario handlers) — the app launches and every foreground scenario
  becomes reachable.
- **Full fidelity:** add the matching
  `<Extension Category="windows.activatableClass.inProcessServer">` `ActivatableClass`
  entries.

## Recurrence
UWP SDK samples frequently ship background tasks (geolocation, timer, push,
media-transport, etc.). Any such sample migrated as-is hits `0x80080204` and scores 0 on
launch. This is a high-frequency, high-impact UWP→WinUI 3 manifest difference.
