# Dev-agent slips

- Ran the mandatory bootstrap self-check concurrently instead of after bootstrap.
- Ran `dotnet run` from the parent directory without targeting the csproj.
- Added explicit SDK-default `Compile` items despite the fetched csproj guidance.
- Linked and regenerated shared XAML despite the prominent copy-verbatim fidelity rule.
- Deleted `MainWindow` while leaving references to it.
- Left all mapping rows at `copied` until the validator caught them.

These are excluded from skill edits because the current skill already covers each rule clearly or the error was a local edit-consistency mistake.
