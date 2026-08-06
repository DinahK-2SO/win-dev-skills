# LanguageFont lessons

- **Bootstrap inventory:** only 4 physical files were mapped although the legacy csproj linked 16 additional code, XAML, resource, and asset items from sibling folders.
- **Silent runtime failure:** `<sdk:MainPage />` directly hosted the page, so its `OnNavigatedTo` scenario population never ran. The process stayed alive and the validator passed with an empty scenario list.
- **Build recovery:** manual reconstruction caused duplicate partial members, `DispatcherQueue` ambiguity, cascading XAML type errors, and namespace/alias errors; two fix rounds produced a clean build.
- **Launch helper:** a default `dotnet build` emitted `bin\Debug`, which `Test-AppLaunch.ps1` did not discover.
- **API result:** `Windows.Globalization.Fonts.LanguageFontGroup` itself carried over; the functional loss was shell initialization, not font API incompatibility.

