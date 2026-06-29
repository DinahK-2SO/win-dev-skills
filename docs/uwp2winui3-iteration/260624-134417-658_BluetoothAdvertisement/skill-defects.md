# Skill defects

- **OnBackgroundActivated override breaks build:** Background Tasks section omits the #1 compile breaker — the copied `App.OnBackgroundActivated` override (CS0115, no method on Microsoft.UI.Xaml.Application). Fix: tell agent to delete override + IBackgroundTask classes. Generalizes to all UWP bg-task samples.
