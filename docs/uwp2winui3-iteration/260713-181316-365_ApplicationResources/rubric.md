# UWP Feature Rubric — ApplicationResources

Derived by launching the original UWP app (`uwp-app-runner`, PID 2996, window
"Application Resources C# sample") and extracting the source feature checklist.

> **Extraction note:** `Extract-UwpFeatureChecklist.ps1` could not parse the sample's
> scenario list (SampleConfiguration) and modeled the app as a single `MainPage` feature
> with 4 shell controls (ScenarioControl ListBox, Trademarks link, Privacy link, Windows
> logo Image). The live app has 13 scenarios reachable from that shell. The rubric reflects
> the single feature the parity pipeline actually measured.

## Shell / Application Resources sample shell + scenario navigation

**ID:** `app-resources-shell`
**Weight:** 2

MainPage shell hosting the sample title, a scenario navigation list (UWP `ListBox`
`ScenarioControl`), copyright, Trademarks/Privacy footer `HyperlinkButton`s, and the
default scenario content demonstrating `x:Uid` string-resource lookup from `resources.resw`.

**Expected behaviour:**
- App launches and presents a non-blank window
- A scenario navigation list exposes every scenario; selecting an item navigates to it
- Default scenario shows the `x:Uid`-bound resource string ("Hello World")
- Sample title and "© Microsoft Corporation" copyright are shown
- Trademarks and Privacy footer links are present (open external URLs; no in-app response)

**UWP reference screenshot:**
![app-resources-shell](parity/baseline/screenshots/01_ApplicationResources.png)
