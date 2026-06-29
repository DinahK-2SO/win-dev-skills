# Dev-agent slips — CameraGetPreviewFrame (will NOT change skill)

## 1. CS0227 unsafe code
- Covered clearly at PATTERNS.md `### CS0227` with the exact `<AllowUnsafeBlocks>true</AllowUnsafeBlocks>` fix.
- Agent recovered in one iteration (turns 26-27). One-off; no skill edit.

## 2. Dispatcher.RunAsync → DispatcherQueue.TryEnqueue
- Covered at PATTERNS.md `#threading`; scaffold pre-injected `TODO[migrate-NNN]: see PATTERNS.md#threading` at each call site.
- Agent followed the anchors successfully (turns 31-34). No skill edit.
