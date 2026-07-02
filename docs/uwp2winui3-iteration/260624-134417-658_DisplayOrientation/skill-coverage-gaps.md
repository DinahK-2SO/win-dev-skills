# Skill coverage gaps — DisplayOrientation (WILL change skill)

## G1 — Defensive-init guidance omits OnNavigatedTo + view-bound WinRT APIs
- **Covered at:** SKILL.md 'Defensive UI for init-heavy and device-dependent pages' (~200-224).
- **Why missed:** under-emphasized — lists only constructor/Loaded as throw sites and hardware/media/asset/DI triggers. The real throws here are in `OnNavigatedTo` (App.MainWindow NRE; DisplayInformation.AutoRotationPreferences).
- **Improvement:** add `OnNavigatedTo` as a throw site and a trigger bullet for view-bound WinRT APIs (DisplayInformation, ApplicationView, UIViewSettings) that compile but throw in desktop.
- **Generalizes:** samples routinely init in OnNavigatedTo and touch view-bound APIs.
