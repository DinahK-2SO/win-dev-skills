# Skill defects — CameraAdvancedCapture (will change skill)

1. **Application.Suspending / .Resuming removed in WinUI 3 (CS1061)** — absent from skill.
   UWP subscribes to app suspend/resume (MainPage.xaml.cs 102-103; the default UWP App
   template also has `this.Suspending += OnSuspending;`). WinUI 3 `Application` has no such
   events. The #lifecycle section covers OnLaunched/activation but never this. Fix: build-error
   entry + lifecycle note + inventory pattern that injects an inline TODO. Generalizes across
   nearly every UWP app.

2. **`NavigationCacheMode = NavigationCacheMode.Disabled;` → CS0176** — absent from skill.
   Standard UWP page-template line; inside a Page the unqualified enum is shadowed by the
   Page.NavigationCacheMode property. Fix: build-error entry telling the agent to qualify the
   enum (`Microsoft.UI.Xaml.Navigation.NavigationCacheMode.Disabled`). Recurs across the sample
   suite.
