# AdaptiveStreaming — UWP Feature Rubric

> **UWP capture status:** failed — App crashed at startup in Windows.UI.Xaml.dll (0xc000027b), native XAML stowed exception on newer OS build. All features derived from source code analysis.

---

## Navigation / Scenario list navigation

**ID:** `scenario-navigation`  
**Weight:** 2  

The app displays a list of 7 scenarios in a sidebar/list and allows selecting each to navigate to its content page.

**Expected behaviour:**
- A list of 7 scenario titles is visible: Simplest Adaptive Streaming, Event Handlers, Network Request Modification, Adaptive Streaming Tuning, Metadata, Ad Insertion, Live Seekable Range
- Clicking a scenario title navigates to that scenario's page content
- The currently selected scenario is visually highlighted

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 1 - Simplest Adaptive Streaming / Load button triggers playback

**ID:** `scenario1-load-button`  
**Weight:** 2  

Scenario 1 has a Load button that sets the media source on the MediaPlayerElement to begin adaptive streaming playback.

**Expected behaviour:**
- A 'Load' button is displayed at the top of the scenario page
- Clicking 'Load' causes the MediaPlayerElement to begin loading/playing content
- A description text block explains the implicit AdaptiveMediaSource creation

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Media Playback / MediaPlayerElement with transport controls

**ID:** `media-player-element`  
**Weight:** 2  

Each scenario contains a MediaPlayerElement with transport controls enabled (play, pause, seek, volume, full screen).

**Expected behaviour:**
- A media player area is visible occupying the main content region
- Transport controls are visible at the bottom of the player (play/pause, timeline, volume, fullscreen)
- Transport controls respond to user interaction

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Content Selector / Load by content ID

**ID:** `content-selector-load-id`  
**Weight:** 1  

Scenarios 2-7 use a ContentSelector control with a ComboBox of known content IDs and a 'Load Id' button.

**Expected behaviour:**
- A ComboBox displays available content models from the Azure Media Services stub list
- A 'Load Id:' button is present next to the ComboBox
- Clicking 'Load Id:' loads the selected content into the media player

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Content Selector / Load by custom URI

**ID:** `content-selector-load-uri`  
**Weight:** 1  

The ContentSelector provides a TextBox for entering a custom manifest URI and a 'Load Uri:' button.

**Expected behaviour:**
- A TextBox with URL input scope is available for entering a custom URI
- A 'Load Uri:' button is present next to the TextBox
- Clicking 'Load Uri:' loads the entered manifest URL into the media player

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Content Selector / Set Source button and AutoPlay checkbox

**ID:** `content-selector-set-source`  
**Weight:** 1  

The ContentSelector has a 'Set Source' button (initially disabled) and an 'AutoPlay' checkbox.

**Expected behaviour:**
- A 'Set Source' button is present (disabled until content is loaded)
- An 'AutoPlay' checkbox is present, unchecked by default
- Checking AutoPlay causes loaded content to begin playing automatically

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 2 - Event Handlers / Download and playback bitrate indicators

**ID:** `scenario2-bitrate-indicators`  
**Weight:** 1  

Scenario 2 displays real-time download and playback bitrate with bar icons and numeric text.

**Expected behaviour:**
- A download icon (Download symbol) with a bar-level icon and bitrate text is shown
- A playback icon (Play symbol) with a bar-level icon and bitrate text is shown
- The bar icons update dynamically as the adaptive streaming engine changes bitrates

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 2 - Event Handlers / Event log view

**ID:** `scenario2-log-view`  
**Weight:** 1  

Scenario 2 includes a LogView control that displays streaming events (opened, closed, bitrate changes, download failures).

**Expected behaviour:**
- A log panel is visible at the bottom of the scenario page
- Streaming events are logged in real time as playback progresses
- Events include adaptive source opened, download state changes, and bitrate switches

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 3 - Request Modification / Authorization method radio buttons

**ID:** `scenario3-auth-method`  
**Weight:** 1  

Scenario 3 provides radio buttons to select the authentication mechanism for key delivery: None, Authorization Header, Url Query Parameter, Application Downloaded.

**Expected behaviour:**
- Four radio buttons are displayed: None, Authorization Header, Url Query Parameter, Application Downloaded
- Authorization Header is selected by default
- Selecting a different method changes how the key request is authenticated

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 3 - Request Modification / HDCP protection level controls

**ID:** `scenario3-hdcp-protection`  
**Weight:** 1  

Scenario 3 provides radio buttons to set HDCP minimum protection level and displays the effective protection and max bitrate.

**Expected behaviour:**
- Three radio buttons for HDCP: Off, On, On With Type Enforcement
- HDCP Off is selected by default
- Effective protection text and desired max bitrate text update when selection changes

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 4 - Tuning / Min/Initial/Max bitrate ComboBoxes

**ID:** `scenario4-bitrate-tuning`  
**Weight:** 1  

Scenario 4 provides ComboBoxes to set minimum, initial, and maximum bitrate constraints on the adaptive media source.

**Expected behaviour:**
- Three ComboBoxes labeled 'Min Bitrate', 'Initial Bitrate', and 'Max Bitrate' are displayed
- ComboBoxes are populated with available bitrate values from the content
- Changing a selection constrains the adaptive streaming engine to respect the new limit

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 4 - Tuning / Downgrade ratio and headroom ratio controls

**ID:** `scenario4-advanced-tuning`  
**Weight:** 1  

Scenario 4 provides TextBox+Set button pairs for BitrateDowngradeTriggerRatio and DesiredBitrateHeadroomRatio.

**Expected behaviour:**
- A TextBox and 'Set' button for 'Downgrade ratio' are displayed
- A TextBox and 'Set' button for 'Desired headroom ratio' are displayed
- Clicking 'Set' applies the entered numeric value to the adaptive media source

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 4 - Tuning / Inbound bits per second display

**ID:** `scenario4-inbound-bitrate`  
**Weight:** 1  

Scenario 4 shows the measured inbound bitrate alongside download/playback bitrate indicators.

**Expected behaviour:**
- An inbound bitrate icon and text display the measured network throughput
- The value updates dynamically during playback

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 5 - Metadata / Timed metadata display

**ID:** `scenario5-metadata`  
**Weight:** 1  

Scenario 5 plays content with timed metadata (HLS comments, ID3 tags, or DASH emsg boxes) and logs metadata events.

**Expected behaviour:**
- Content with timed metadata can be loaded via the ContentSelector
- Metadata events are logged in the LogView as they are encountered during playback
- The description explains HLS/DASH metadata sources

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 6 - Ad Insertion / Ad insertion with progress reporting

**ID:** `scenario6-ad-insertion`  
**Weight:** 1  

Scenario 6 demonstrates pre-roll, mid-roll, and post-roll ad insertion using MediaPlaybackList with progress events.

**Expected behaviour:**
- Loading content triggers a playlist with pre-roll ads, main content with mid-roll ads at 10%, and post-roll ads
- Playback progress events are logged in the LogView
- The MediaPlayerElement plays through the ad sequence and main content

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 7 - Live Seekable Range / Live seekable range controls

**ID:** `scenario7-seekable-window`  
**Weight:** 1  

Scenario 7 displays MaxSeekableWindowSize, DesiredSeekableWindowSize (with Set button), DesiredLiveOffset (with Set button), and MinLiveOffset for live DVR content.

**Expected behaviour:**
- MaxSeekableWindowSize and MinLiveOffset are displayed as read-only text
- DesiredSeekableWindowSize has a TextBox and Set button to adjust the DVR window
- DesiredLiveOffset has a TextBox and Set button to adjust how far behind live edge to play

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 7 - Live Seekable Range / Position slider and time display

**ID:** `scenario7-position-slider`  
**Weight:** 1  

Scenario 7 shows StartPosition, CurrentPosition, EndPosition text and a horizontal Slider for seeking within the live DVR window.

**Expected behaviour:**
- StartPosition, CurrentPosition, and EndPosition text labels display time values
- A horizontal slider allows seeking within the seekable range
- Position values update as playback progresses

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 7 - Live Seekable Range / Discrete seek and playback control buttons

**ID:** `scenario7-seek-buttons`  
**Weight:** 1  

Scenario 7 provides buttons for GoToStart, fixed seeks (<<15m, <<5m, <<30s, <<2s, 2s>>, 30s>>, 5m>>, 15m>>), Play, Pause, GoToLive, and Log Times.

**Expected behaviour:**
- Seek buttons for fixed amounts (2s, 30s, 5m, 15m forward and back) are displayed
- GoToStart and GoToLive buttons are displayed
- Play and Pause buttons with symbol icons are present
- A 'Log Times' button logs the current time correlation to the LogView

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_
