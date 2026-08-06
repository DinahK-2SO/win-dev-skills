# Skill defects

- **Build command is wrong.** `winapp build` is not available; compile with `dotnet build <project.csproj>`.
- **External linked inputs are absent from bootstrap.** The mapping contained only five local files while the project linked its shared App, shell, styles, code, and assets from outside `-Source`. Add linked-item resolution to the bootstrap.
- **DisplayInformation guidance is wrong.** `Microsoft.Graphics.Display.DisplayInformation` does not expose UWP `CurrentOrientation`, `NativeOrientation`, DPI, or `OrientationChanged`; correct the mapping.
- **Suspend/resume subscriptions are uncovered.** Add desktop lifetime guidance for resource-owning pages that used `Application.Current.Suspending/Resuming`.
