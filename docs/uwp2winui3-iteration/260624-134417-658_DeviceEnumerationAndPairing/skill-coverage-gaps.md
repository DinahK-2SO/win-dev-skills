# Skill coverage gaps (present but unclear → WILL change skill)

## 1. `DispatcherQueue` in non-Page helper classes — under-emphasized
- **Evidence:** CS0246 `DispatcherQueue` not found in DeviceWatcherHelper.cs (session-log
  5851-5852). Fixed by adding `using Microsoft.UI.Dispatching;` + injecting a
  `DispatcherQueue` through the constructor from each Page.
- **Covered at:** MIGRATION-PATTERNS.md `## Threading: CoreDispatcher → DispatcherQueue`
  (117-132); namespace-map row (114); WUI0003 row (606).
- **Why missed:** the sample `DispatcherQueue.TryEnqueue(...)` reads as if `DispatcherQueue`
  is ambient (only true inside a Page/DependencyObject) and omits the `using`. The
  non-Page helper-class case — exactly where CS0246 hit — is not flagged.
- **Improvement (Tier 3):** add `using Microsoft.UI.Dispatching;` to the sample and one
  sentence: helper classes must inject a `DispatcherQueue` (pass the Page's
  `this.DispatcherQueue`) or use `DispatcherQueue.GetForCurrentThread()`.
- **Generalizes:** UWP samples commonly marshal watcher callbacks in non-Page helpers;
  the missing-using / no-ambient-queue CS0246 recurs.
