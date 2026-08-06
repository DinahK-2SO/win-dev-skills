# Dev-agent slips

- Ran bootstrap and its `Test-Path` self-check concurrently despite explicit sequencing.
- Ran `dotnet run` from the parent directory once instead of targeting the csproj.
- Added `required` members to a XAML-created model, causing generated-code `CS9035`.
- Ran `dotnet run` and final validation concurrently, locking `resources.pri`.

No skill edits were made solely for these slips.
