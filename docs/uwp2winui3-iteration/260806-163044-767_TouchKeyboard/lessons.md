# TouchKeyboard migration lessons

- **Linked source was invisible to bootstrap.** The UWP csproj linked shared App/MainPage XAML and code, scenario XAML, styles, and assets from sibling directories. The agent had to inspect `obj` and `SharedContent` and reconstruct the shell.
- **The generic current-view pattern was insufficient.** It prompted nonexistent `Microsoft.UI.Input` factories; the fallback UWP calls compiled but later produced five WUI0004 warnings.
- **Validation had a blind spot.** Removing an injected TODO was enough to pass even when `GetForCurrentView()` remained and no analyzer package was present.
- **`winapp build` was stale guidance.** The installed CLI rejected it; `dotnet build` worked.
- **Concurrent builds raced.** Running final build alongside validator produced missing generated-XAML files.

The full error/root-cause/fix chains and tool evidence are in `lessons.json`.
