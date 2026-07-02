# AdaptiveStreaming — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Simplest Adaptive Streaming

- **Screenshot:** `screenshots/01_Simplest_Adaptive_Streaming.png`
- **Page class:** `Scenario1_SimplestAdaptiveStreaming`
- **UI elements:**
  - Button, name=Load, label="Load", events=Click
  - MediaPlayerElement, name=mediaPlayerElement
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_SimplestAdaptiveStreaming.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Load "Load" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Event Handlers

- **Screenshot:** `screenshots/02_Event_Handlers.png`
- **Page class:** `Scenario2_EventHandlers`
- **UI elements:**
  - MediaPlayerElement, name=mediaPlayerElement
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_EventHandlers.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 3 - Network Request Modification

- **Screenshot:** `screenshots/03_Network_Request_Modification.png`
- **Page class:** `Scenario3_RequestModification`
- **UI elements:**
  - RadioButton, name=RadioButtonNone, label="None", events=Click
  - RadioButton, name=RadioButtonAuthorizationHeader, label="Authorization Header", events=Click
  - RadioButton, name=RadioButtonUrlQueryParameter, label="Url Query Parameter", events=Click
  - RadioButton, name=RadioButtonApplicationDownloaded, label="Application Downloaded", events=Click
  - RadioButton, name=HcdpOff, label="HDCP Off", events=Click
  - RadioButton, name=HcdpOn, label="HDCP On", events=Click
  - RadioButton, name=HdcpOnWithTypeEnforcement, label="HDCP On With Type Enforcement", events=Click
  - MediaPlayerElement, name=mediaPlayerElement
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_RequestModification.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - None "None" (RadioButton)
  - Authorization Header "Authorization Header" (RadioButton)
  - Url Query Parameter "Url Query Parameter" (RadioButton)
  - Application Downloaded "Application Downloaded" (RadioButton)
  - HDCP Off "HDCP Off" (RadioButton)
  - HDCP On "HDCP On" (RadioButton)
  - HDCP On With Type Enforcement "HDCP On With Type Enforcement" (RadioButton)
- **Output elements:** EffectiveHdcpProtectionText, DesiredMaxBitrateText, StatusBorder, StatusBlock

## Scenario 4 - Adaptive Streaming Tuning

- **Screenshot:** `screenshots/04_Adaptive_Streaming_Tuning.png`
- **Page class:** `Scenario4_Tuning`
- **UI elements:**
  - ComboBox, name=DesiredMinBitrateList, events=SelectionChanged
  - ComboBox, name=InitialBitrateList, events=SelectionChanged
  - ComboBox, name=DesiredMaxBitrateList, events=SelectionChanged
  - TextBox, name=BitrateDowngradeTriggerRatioText
  - Button, label="Set"
  - TextBox, name=BitrateHeadroomTriggerRatioText
  - Button, label="Set"
  - MediaPlayerElement, name=mediaPlayerElement
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_Tuning.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Set "Set" (Button)
  - Set "Set" (Button)
- **Output elements:** BitrateDowngradeTriggerRatioText, BitrateHeadroomTriggerRatioText, StatusBorder, StatusBlock

## Scenario 5 - Metadata

- **Screenshot:** `screenshots/05_Metadata.png`
- **Page class:** `Scenario5_Metadata`
- **UI elements:**
  - MediaPlayerElement, name=mediaPlayerElement
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario5_Metadata.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 6 - Ad Insertion

- **Screenshot:** `screenshots/06_Ad_Insertion.png`
- **Page class:** `Scenario6_AdInsertion`
- **UI elements:**
  - MediaPlayerElement, name=mediaPlayerElement
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario6_AdInsertion.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 7 - Live Seekable Range

- **Screenshot:** `screenshots/07_Live_Seekable_Range.png`
- **Page class:** `Scenario7_LiveSeekableRange`
- **UI elements:**
  - MediaPlayerElement, name=mediaPlayerElement
  - TextBox, name=DesiredSeekableWindowSize, label="DesiredSeekableWindowSize"
  - Button, name=DesiredSeekableWindowSizeButton, label="Set", events=Click
  - TextBox, name=DesiredLiveOffset, label="DesiredLiveOffset"
  - Button, name=DesiredLiveOffsetButton, label="Set", events=Click
  - Slider, name=PositionSlider
  - Button, name=LogCurrentTimeCorrelation, label="Log Times", events=Click
  - Button, name=GoToStart, label="GoToStart", events=Click
  - Button, label="&lt;&lt;15m", events=Click
  - Button, label="&lt;&lt;5m", events=Click
  - Button, label="&lt;&lt;30s", events=Click
  - Button, label="&lt;&lt;2s", events=Click
  - Button, name=PlayButton, events=Click
  - Button, name=PauseButton, events=Click
  - Button, label="2s&gt;&gt;", events=Click
  - Button, label="30s&gt;&gt;", events=Click
  - Button, label="5m&gt;&gt;", events=Click
  - Button, label="15m&gt;&gt;", events=Click
  - Button, name=GoToLive, label="GoToLive", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario7_LiveSeekableRange.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Set "Set" (Button)
  - Set "Set" (Button)
  - Log Times "Log Times" (Button)
  - GoToStart "GoToStart" (Button)
  - &lt;&lt;15m "&lt;&lt;15m" (Button)
  - &lt;&lt;5m "&lt;&lt;5m" (Button)
  - &lt;&lt;30s "&lt;&lt;30s" (Button)
  - &lt;&lt;2s "&lt;&lt;2s" (Button)
  - PlayButton (Button)
  - PauseButton (Button)
  - 2s&gt;&gt; "2s&gt;&gt;" (Button)
  - 30s&gt;&gt; "30s&gt;&gt;" (Button)
  - 5m&gt;&gt; "5m&gt;&gt;" (Button)
  - 15m&gt;&gt; "15m&gt;&gt;" (Button)
  - GoToLive "GoToLive" (Button)
- **Output elements:** MaxSeekableWindowSize, DesiredSeekableWindowSize, DesiredLiveOffset, MinLiveOffset, StartPosition, CurrentPosition, EndPosition, StatusBorder, StatusBlock

