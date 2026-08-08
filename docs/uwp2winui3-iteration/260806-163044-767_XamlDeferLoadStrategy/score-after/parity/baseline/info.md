# x:DeferLoadStrategy — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Basic Deferral

- **Screenshot:** `screenshots/01_Basic_Deferral.png`
- **Page class:** `BasicDeferral`
- **UI elements:**
  - Button, name=RealizeElements, label="Realize Elements"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `BasicDeferral.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Realize Elements "Realize Elements" (Button)

## Scenario 2 - Adaptive Deferral

- **Screenshot:** `screenshots/02_Adaptive_Deferral.png`
- **Page class:** `AdaptivePage`
- **UI elements:**
  - ListView, name=AccountsList
  - ListView, name=MailList
  - Button, name=Send
  - RichEditBox, name=Body
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `AdaptivePage.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Send (Button)
- **Output elements:** From, Subject, Body, ToLabel, CCLabel

## Scenario 3 - Control Template Deferral

- **Screenshot:** `screenshots/03_Control_Template_Deferral.png`
- **Page class:** `DeferredControlTemplatePart`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `DeferredControlTemplatePart.xaml.cs`)_

