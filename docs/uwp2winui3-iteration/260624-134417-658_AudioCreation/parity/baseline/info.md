# AudioCreation — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - File Playback

- **Screenshot:** `screenshots/01_File_Playback.png`
- **Page class:** `Scenario1_FilePlayback`
- **UI elements:**
  - Button, name=fileButton, label="Load File", events=Click
  - Button, name=graphButton, label="Start Graph", events=Click
  - ToggleSwitch, name=loopToggle, label="Loop", events=Toggled
  - Slider, name=playSpeedSlider, label="Playback Speed", events=ValueChanged
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_FilePlayback.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Load File "Load File" (Button)
  - Start Graph "Start Graph" (Button)
  - Loop "Loop" (ToggleSwitch)
- **Output elements:** SampleHeader, SampleDescription, speaker, StatusBlock, StatusBorder

## Scenario 2 - Capture From Device

- **Screenshot:** `screenshots/02_Capture_From_Device.png`
- **Page class:** `Scenario2_DeviceCapture`
- **UI elements:**
  - ListBox, name=outputDevicesListBox, events=SelectionChanged
  - ListBox, name=inputDevicesListBox, events=SelectionChanged
  - Button, name=fileButton, label="Pick Output File", events=Click
  - Button, name=recordStopButton, label="Record", events=Click
  - Button, name=createGraphButton, label="Create Graph", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_DeviceCapture.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Pick Output File "Pick Output File" (Button)
  - Record "Record" (Button)
  - Create Graph "Create Graph" (Button)
- **Output elements:** outputDevice, StatusBlock, StatusBorder

## Scenario 3 - Using A FrameInput Node

- **Screenshot:** `screenshots/03_Using_A_FrameInput_Node.png`
- **Page class:** `Scenario3_FrameInput`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_FrameInput.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 4 - Using A Submix Node

- **Screenshot:** `screenshots/04_Using_A_Submix_Node.png`
- **Page class:** `Scenario4_Submix`
- **UI elements:**
  - Button, name=fileButton1, label="Load File 1", events=Click
  - Button, name=fileButton2, label="Load File 2", events=Click
  - ToggleSwitch, name=echoEffectToggle, label="Echo", events=Toggled
  - Button, name=graphButton, label="Start Graph", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_Submix.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Load File 1 "Load File 1" (Button)
  - Load File 2 "Load File 2" (Button)
  - Echo "Echo" (ToggleSwitch)
  - Start Graph "Start Graph" (Button)
- **Output elements:** submixLabel, speaker, StatusBlock, StatusBorder

## Scenario 5 - Inbox Effects

- **Screenshot:** `screenshots/05_Inbox_Effects.png`
- **Page class:** `Scenario5_InboxEffects`
- **UI elements:**
  - Button, name=fileButton, label="Load File", events=Click
  - Button, name=graphButton, label="Start Graph", events=Click
  - ToggleSwitch, name=echoEffectToggle, label="ECHO EFFECT", events=Toggled
  - Slider, name=echoSlider, events=ValueChanged
  - ToggleSwitch, name=reverbEffectToggle, label="REVERB EFFECT", events=Toggled
  - Slider, name=decaySlider, events=ValueChanged
  - ToggleSwitch, name=limiterEffectToggle, label="LIMITER EFFECT", events=Toggled
  - Slider, name=loudnessSlider, events=ValueChanged
  - ToggleSwitch, name=eqToggle, label="EQUALIZER EFFECT", events=Toggled
  - Slider, name=eq1Slider, events=ValueChanged
  - Slider, name=eq2Slider, events=ValueChanged
  - Slider, name=eq3Slider, events=ValueChanged
  - Slider, name=eq4Slider, events=ValueChanged
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario5_InboxEffects.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Load File "Load File" (Button)
  - Start Graph "Start Graph" (Button)
  - ECHO EFFECT "ECHO EFFECT" (ToggleSwitch)
  - REVERB EFFECT "REVERB EFFECT" (ToggleSwitch)
  - LIMITER EFFECT "LIMITER EFFECT" (ToggleSwitch)
  - EQUALIZER EFFECT "EQUALIZER EFFECT" (ToggleSwitch)
- **Output elements:** speaker, echoLabel, decayLabel, loudnessLabel, eq1SliderLabel, eq2SliderLabel, eq3SliderLabel, eq4SliderLabel, StatusBlock, StatusBorder

## Scenario 6 - Custom Effects

- **Screenshot:** `screenshots/06_Custom_Effects.png`
- **Page class:** `Scenario6_CustomEffects`
- **UI elements:**
  - Button, name=fileButton, label="Load File", events=Click
  - Button, name=graphButton, label="Start Graph", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario6_CustomEffects.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Load File "Load File" (Button)
  - Start Graph "Start Graph" (Button)
- **Output elements:** speaker, StatusBlock, StatusBorder

