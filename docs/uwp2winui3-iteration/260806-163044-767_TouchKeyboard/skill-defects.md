# Skill defects

1. **Linked project items were not copied.** Bootstrap saw only physical descendants of `-Source`, omitting shared code/XAML/assets referenced through csproj `Link` metadata.
2. **`GetForCurrentView` handling and validation were incomplete.** InputPane/CoreInputView need HWND interop, and unresolved calls passed without analyzer coverage.
3. **`winapp build` guidance was wrong.** Compilation must use native `dotnet build`.
