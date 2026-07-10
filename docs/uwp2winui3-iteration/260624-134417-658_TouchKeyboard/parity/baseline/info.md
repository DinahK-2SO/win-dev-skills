# TouchKeyboard — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Display touch keyboard automatically

- **Screenshot:** `screenshots/01_Display_touch_keyboard_automatically.png`
- **Page class:** `Scenario1_Launch`
- **UI elements:**
  - TextBox, label="TextBox control"
  - Button, label="Button"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Launch.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Button "Button" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Listen for Show/Hide events

- **Screenshot:** `screenshots/02_Listen_for_Show_Hide_events.png`
- **Page class:** `Scenario2_ShowHideEvents`
- **UI elements:**
  - TextBox, label="Tap to show the touch keyboard"
  - Button, label="Button"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_ShowHideEvents.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Button "Button" (Button)
- **Output elements:** LastInputPaneEventRun, StatusBorder, StatusBlock

## Scenario 3 - Programmatically Show/Hide\nthe touch keyboard

- **Screenshot:** `screenshots/03_Programmatically_Show_Hide_nthe_touch_keyboard.png`
- **Page class:** `Scenario3_ShowHideMethods`
- **UI elements:**
  - TextBox, name=WordListBox, label="Type a few words and hit Enter."
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_ShowHideMethods.xaml.cs`)_
- **Output elements:** WordListBox, ResultsTextBlock, StatusBorder, StatusBlock

## Scenario 4 - Showing the Emoji keyboard

- **Screenshot:** `screenshots/04_Showing_the_Emoji_keyboard.png`
- **Page class:** `Scenario4_ShowView`
- **UI elements:**
  - TextBox, label="What is your reaction?"
  - Button, label="Button"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_ShowView.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Button "Button" (Button)
- **Output elements:** StatusBorder, StatusBlock

