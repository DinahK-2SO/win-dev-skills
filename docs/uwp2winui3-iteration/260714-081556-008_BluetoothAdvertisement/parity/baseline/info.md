# Bluetooth Low Energy Advertisement — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Foreground watcher

- **Screenshot:** `screenshots/01_Foreground_watcher.png`
- **Page class:** `Scenario1_Watcher`
- **UI elements:**
  - CheckBox, name=Watcher1MAndCodedPhysCheckBox
  - CheckBox, name=WatcherPerformanceOptimizationsCheckBox
  - Button, name=RunButton, label="Run"
  - Button, name=StopButton, label="Stop"
  - ListBox, name=ReceivedAdvertisementListBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Watcher.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Run "Run" (Button)
  - Stop "Stop" (Button)
- **Output elements:** Watcher1MAndCodedPhysReasonRun, WatcherPerformanceOptimizationsReasonRun, StatusBorder, StatusBlock

## Scenario 2 - Foreground publisher

- **Screenshot:** `screenshots/02_Foreground_publisher.png`
- **Page class:** `Scenario2_Publisher`
- **UI elements:**
  - CheckBox, name=Publisher2MAndCodedPhysCheckBox
  - Button, name=RunButton, label="Run"
  - Button, name=StopButton, label="Stop"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_Publisher.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Run "Run" (Button)
  - Stop "Stop" (Button)
- **Output elements:** Publisher2MAndCodedPhysReasonRun, PublisherPayloadBlock, PublisherStatusBlock, StatusBorder, StatusBlock

## Scenario 3 - Background watcher

- **Screenshot:** `screenshots/03_Background_watcher.png`
- **Page class:** `Scenario3_BackgroundWatcher`
- **UI elements:**
  - CheckBox, name=WatcherTrigger1MAndCodedPhysCheckBox
  - CheckBox, name=WatcherTriggerPerformanceOptimizationsCheckBox
  - Button, name=RunButton, label="Run"
  - Button, name=StopButton, label="Stop"
  - ListBox, name=ReceivedAdvertisementListBox
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_BackgroundWatcher.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Run "Run" (Button)
  - Stop "Stop" (Button)
- **Output elements:** WatcherTrigger1MAndCodedPhysReasonRun, WatcherTriggerPerformanceOptimizationsReasonRun, StatusBorder, StatusBlock

## Scenario 4 - Background publisher

- **Screenshot:** `screenshots/04_Background_publisher.png`
- **Page class:** `Scenario4_BackgroundPublisher`
- **UI elements:**
  - CheckBox, name=PublisherTrigger2MAndCodedPhysCheckBox
  - Button, name=RunButton, label="Run"
  - Button, name=StopButton, label="Stop"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_BackgroundPublisher.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Run "Run" (Button)
  - Stop "Stop" (Button)
- **Output elements:** PublisherTrigger2MAndCodedPhysReasonRun, PublisherPayloadBlock, PublisherStatusBlock, StatusBorder, StatusBlock

