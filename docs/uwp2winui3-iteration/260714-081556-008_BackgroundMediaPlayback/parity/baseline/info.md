# BackgroundMediaPlayback — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Background Media Playback

- **Screenshot:** `screenshots/01_Background_Media_Playback.png`
- **Page class:** `Scenario1`
- **UI elements:**
  - MediaPlayerElement, name=mediaPlayerElement
  - Button, name=prevButton
  - Button, name=playButton
  - Button, name=nextButton
  - Button, name=speedButton, label="Speed"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - prevButton (Button)
  - playButton (Button)
  - nextButton (Button)
  - Speed "Speed" (Button)
- **Output elements:** currentTrackTitle, currentStateTextBlock, StatusBlock, StatusBorder

## Scenario 2 - Settings

- **Screenshot:** `screenshots/02_Settings.png`
- **Page class:** `Settings`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Settings.xaml.cs`)_
- **Output elements:** StatusBlock, StatusBorder

