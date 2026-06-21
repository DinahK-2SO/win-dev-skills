# Skill Coverage Gaps — ApplicationData

## 1. Storage section omits ApplicationData.ClearAsync/SetVersionAsync
- **Covered at:** MIGRATION-PATTERNS.md#storage (lines 408-416)
- **Why missed:** under-emphasized — only LocalSettings and LocalFolder listed
- **Proposed improvement:** Add note that all ApplicationData members work unchanged in packaged WinUI 3
- **Generalizes:** Many UWP samples use ApplicationData members beyond LocalSettings/LocalFolder
