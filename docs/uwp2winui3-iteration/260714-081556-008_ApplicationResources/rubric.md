# UWP Feature Rubric — ApplicationResources

**Scenario:** ApplicationResources
**UWP capture status:** partial — the original UWP app launched (`uwp-app-runner` `ok:true`, pid 7136) but remained on its **extended splash screen** ("Windows platform sample"); its XAML content never became UIA-accessible, so a per-scenario interactive golden could not be captured. Only the splash frame exists (`parity/baseline/screenshots/01_ApplicationResources.png`). Features are graded against the well-documented source behaviour of this SDK sample and the migrated app's own rendered/behavioural output.

The app is the "Application Resources C# sample" with 13 scenarios (from `constants.cs`). Each scenario is a feature.

## 1. String Resources In XAML
x:Uid loads localized string. **Expected:** output shows "Hello World".

## 2. File Resources In XAML
Logical Image references resolve to scale/language/contrast variants. **Expected:** two images displayed.

## 3. String Resources In Code
ResourceLoader in code. **Expected:** "Show Message" → "Hello World".

## 4. Resources in the AppX manifest
Explains ms-resource: manifest references. **Expected:** descriptive text.

## 5. Additional Resource Files
Strings from additional .resw files. **Expected:** text + Show Message wired.

## 6. Class Library Resources
Resources from a class library. **Expected:** text + Show Message wired.

## 7. Runtime Changes/Events
React to language/scale/contrast changes. **Expected:** text + Show Message wired.

## 8. Application Languages
PrimaryLanguageOverride via ComboBox. **Expected:** ComboBox + current app language(s) shown.

## 9. Override Languages
Per-view override via ResourceContext.GetForCurrentView. **Expected:** reachable scenario demonstrating per-view override.

## 10. Multi-dimensional fallback
Language/Scale/Contrast/HomeRegion qualifiers. **Expected:** four ComboBoxes + Show Message resolves resource.

## 11. Working with webservices
Resolve a URL resource. **Expected:** "Get Url" → resolved URL.

## 12. Retrieving resources in non-UI threads
Non-UI-thread resource retrieval. **Expected:** Show Results + two output labels.

## 13. File resources in code
ms-appx file resource with DXFeatureLevel qualifier. **Expected:** ComboBox + "Data read from file".
