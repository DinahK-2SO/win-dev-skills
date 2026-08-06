# OCR migration lessons

- **Helpful:** bootstrap/TODO generation, focused pattern lookup, iterative builds, and the final validator all produced actionable signals.
- **Tool gaps:** bootstrap ignored MSBuild-linked files outside the source directory, and the documented `winapp build` command does not exist in the installed CLI.
- **Documentation error:** `Microsoft.Graphics.Display.DisplayInformation` does not retain UWP orientation/DPI members as the current mapping claims.
- **Special handling:** `CaptureElement` requires an `Image`/`SoftwareBitmapSource` preview path; all renamed code-behind references must move with the XAML element.
- **Recovered errors:** CaptureElement, display orientation, lifecycle events, namespace ambiguity, compiled binding, stale element names, and Launcher qualification were fixed before a successful build and launch.
- **Scored lesson:** preserving controls is insufficient when root `RequestedTheme` and inherited platform typography semantics change.
