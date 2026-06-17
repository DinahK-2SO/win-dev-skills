# AdaptiveStreaming — UWP Feature Rubric

This rubric documents all user-visible features of the UWP AdaptiveStreaming sample app.
It serves as the authoritative reference for scoring migrated WinUI 3 parity.

---

## Shell / SplitView scenario navigation

**ID:** `navigation-splitview`  
**Weight:** 2  

The app uses a SplitView with a left pane listing all 7 scenarios as a ListBox. Selecting a scenario navigates the right content frame to that scenario page.

**Expected behaviour:**
- Left pane displays a ListBox with 7 numbered scenario items
- Selecting a scenario item navigates the content frame to the corresponding scenario page
- The selected item is visually highlighted with a blue background
- A hamburger toggle button in the header can collapse/expand the left pane

**UWP reference screenshot:**  
![navigation-splitview](screenshots/uwp-scenario1-simplest-streaming.png)

---

## Shell / App header with title and branding

**ID:** `header-bar`  
**Weight:** 1  

A header bar at the top displays the Windows SDK logo, the text 'Windows App SDK Sample', and the app title 'AdaptiveStreaming' in the left pane.

**Expected behaviour:**
- Header shows Windows SDK logo image on the left
- Header displays 'Windows App SDK Sample' or 'Universal Windows Platform sample' text
- The left pane shows 'AdaptiveStreaming' as the sample title
- Footer area shows Microsoft copyright, Trademarks and Privacy links

**UWP reference screenshot:**  
![header-bar](screenshots/uwp-scenario1-simplest-streaming.png)

---

## Scenario 1 - Simplest Adaptive Streaming / Load button triggers media playback

**ID:** `scenario1-load-button`  
**Weight:** 2  

Scenario 1 has a simple 'Load' button that loads an HLS adaptive streaming URI into a MediaPlayerElement. No additional controls are shown.

**Expected behaviour:**
- A 'Load' button is displayed below the description text
- Clicking 'Load' sets the MediaPlayerElement source to an adaptive streaming URI
- The MediaPlayerElement shows transport controls (play/pause, seek bar, volume, fullscreen)

**UWP reference screenshot:**  
![scenario1-load-button](screenshots/uwp-scenario1-simplest-streaming.png)

---

## Scenario 1 - Simplest Adaptive Streaming / Scenario description text

**ID:** `scenario1-description`  
**Weight:** 1  

Each scenario displays a 'Description:' header followed by explanatory text about what the scenario demonstrates.

**Expected behaviour:**
- Text 'Description:' appears as a header at the top of the content area
- Descriptive paragraph text wraps and explains the scenario functionality

**UWP reference screenshot:**  
![scenario1-description](screenshots/uwp-scenario1-simplest-streaming.png)

---

## Content Selector Control / Load by content ID with ComboBox

**ID:** `content-selector-load-id`  
**Weight:** 2  

Scenarios 2-7 use a ContentSelector user control with a 'Load Id:' button and a ComboBox listing available content models (various streaming URIs).

**Expected behaviour:**
- A 'Load Id:' button is displayed
- A ComboBox next to it shows the currently selected content model with its ID and display name
- Clicking 'Load Id:' loads the selected content model's manifest URI
- The ComboBox dropdown lists all available Azure Media Services content items

**UWP reference screenshot:**  
![content-selector-load-id](screenshots/uwp-scenario2-event-handlers.png)

---

## Content Selector Control / Load by custom URI

**ID:** `content-selector-load-uri`  
**Weight:** 1  

The ContentSelector provides a 'Load Uri:' button with a TextBox for entering a custom manifest URI.

**Expected behaviour:**
- A 'Load Uri:' button is displayed below the Load Id row
- A TextBox input field next to it allows entering a custom URI
- Clicking 'Load Uri:' loads the URI from the TextBox as the media source

**UWP reference screenshot:**  
![content-selector-load-uri](screenshots/uwp-scenario2-event-handlers.png)

---

## Content Selector Control / Set Source button and AutoPlay checkbox

**ID:** `content-selector-set-source`  
**Weight:** 1  

After loading content, a 'Set Source' button becomes enabled to apply the media source to the player. An 'AutoPlay' checkbox controls whether playback starts automatically.

**Expected behaviour:**
- A 'Set Source' button is shown, initially disabled (grayed out)
- After successfully loading a URI, 'Set Source' becomes enabled
- An 'AutoPlay' checkbox is displayed next to Set Source
- Checking AutoPlay causes media to play immediately when source is set

**UWP reference screenshot:**  
![content-selector-set-source](screenshots/uwp-scenario2-event-handlers.png)

---

## Scenario 2 - Event Handlers / Download and playback bitrate indicators

**ID:** `scenario2-bitrate-indicators`  
**Weight:** 1  

Scenario 2 shows download bitrate and playback bitrate with signal-strength style icons and numeric text values.

**Expected behaviour:**
- A download icon with a signal bars indicator is displayed
- A play icon with a signal bars indicator is displayed
- Numeric bitrate values appear next to each indicator
- Signal bar icons update to reflect current bitrate quartile (1-4 bars)

**UWP reference screenshot:**  
![scenario2-bitrate-indicators](screenshots/uwp-scenario2-event-handlers.png)

---

## Scenario 3 - Request Modification / Authorization method radio buttons

**ID:** `scenario3-auth-radio-buttons`  
**Weight:** 1  

Scenario 3 displays radio buttons for selecting an Azure authentication method: None, Authorization Header, Url Query Parameter, Application Downloaded.

**Expected behaviour:**
- Four radio buttons are displayed in a vertical stack for Azure authorization method
- 'Authorization Header' is selected by default
- Radio buttons are mutually exclusive (selecting one deselects others)
- Options are: None, Authorization Header, Url Query Parameter, Application Downloaded

**UWP reference screenshot:**  
![scenario3-auth-radio-buttons](screenshots/uwp-scenario3-request-modification.png)

---

## Scenario 3 - Request Modification / HDCP protection level radio buttons

**ID:** `scenario3-hdcp-protection`  
**Weight:** 1  

Scenario 3 shows HDCP minimum protection radio buttons (Off, On, On With Type Enforcement) and displays the effective protection level with max bitrate.

**Expected behaviour:**
- A 'Desired HDCP minimum protection' label is shown
- Three radio buttons: HDCP Off (default selected), HDCP On, HDCP On With Type Enforcement
- An 'Effective protection:' text displays the current effective protection level
- Selecting HDCP options updates the effective protection display

**UWP reference screenshot:**  
![scenario3-hdcp-protection](screenshots/uwp-scenario3-request-modification.png)

---

## Scenario 4 - Adaptive Streaming Tuning / Min/Initial/Max bitrate ComboBoxes

**ID:** `scenario4-bitrate-comboboxes`  
**Weight:** 1  

Scenario 4 provides three ComboBoxes to set Min Bitrate, Initial Bitrate, and Max Bitrate for tuning the adaptive media source.

**Expected behaviour:**
- A 'Min Bitrate ≤' label with a ComboBox is displayed
- An 'Initial Bitrate ≤' label with a ComboBox is displayed
- A 'Max Bitrate' label with a ComboBox is displayed
- ComboBox items are populated with available bitrate values after content loads

**UWP reference screenshot:**  
![scenario4-bitrate-comboboxes](screenshots/uwp-scenario4-tuning.png)

---

## Scenario 4 - Adaptive Streaming Tuning / Downgrade ratio and headroom ratio settings

**ID:** `scenario4-ratio-settings`  
**Weight:** 1  

Scenario 4 provides TextBox inputs with 'Set' buttons for BitrateDowngradeTriggerRatio and DesiredBitrateHeadroomRatio.

**Expected behaviour:**
- A 'Downgrade ratio:' label with a TextBox and 'Set' button is displayed
- A 'Desired headroom ratio:' label with a TextBox and 'Set' button is displayed
- Clicking 'Set' applies the entered numeric value to the adaptive media source

**UWP reference screenshot:**  
![scenario4-ratio-settings](screenshots/uwp-scenario4-tuning.png)

---

## Scenario 7 - Live Seekable Range / Seekable window size controls

**ID:** `scenario7-seekable-window`  
**Weight:** 1  

Scenario 7 displays MaxSeekableWindowSize, DesiredSeekableWindowSize (with Set button), DesiredLiveOffset (with Set button), and MinLiveOffset values.

**Expected behaviour:**
- MaxSeekableWindowSize label and value text are displayed
- DesiredSeekableWindowSize has a TextBox and 'Set' button
- DesiredLiveOffset has a TextBox and 'Set' button
- MinLiveOffset label and value text are displayed

**UWP reference screenshot:**  
![scenario7-seekable-window](screenshots/uwp-scenario7-live-seekable-range.png)

---

## Scenario 7 - Live Seekable Range / Position slider with start/current/end labels

**ID:** `scenario7-position-slider`  
**Weight:** 1  

Scenario 7 shows a horizontal slider for seeking within the live DVR window, with StartPosition, CurrentPosition, and EndPosition labels above it.

**Expected behaviour:**
- StartPosition, CurrentPosition, and EndPosition labels are shown
- A horizontal Slider control spans the width below the labels
- Position values update during live playback

**UWP reference screenshot:**  
![scenario7-position-slider](screenshots/uwp-scenario7-live-seekable-range.png)

---

## Scenario 7 - Live Seekable Range / Discrete seek and transport control buttons

**ID:** `scenario7-seek-buttons`  
**Weight:** 2  

Scenario 7 provides buttons for Log Times, GoToStart, seek backward/forward by fixed amounts (15m, 5m, 30s, 2s), Play, Pause, and GoToLive.

**Expected behaviour:**
- A 'Log Times' button is displayed
- A 'GoToStart' button is displayed
- Seek backward buttons: <<15m, <<5m, <<30s, <<2s are displayed
- Play and Pause icon buttons are displayed (initially disabled until media loads)
- Seek forward buttons: 2s>>, 30s>>, 5m>>, 15m>> are displayed
- A 'GoToLive' button is displayed

**UWP reference screenshot:**  
![scenario7-seek-buttons](screenshots/uwp-scenario7-live-seekable-range.png)

---

## Logging / Log view with Copy/Clear and logging level

**ID:** `log-view-control`  
**Weight:** 1  

Scenarios 2-7 include a LogView control at the bottom with 'Copy log', 'Clear log' buttons, and a 'Logging level:' ComboBox (defaulting to Warning).

**Expected behaviour:**
- A 'Copy log' button is displayed
- A 'Clear log' button is displayed
- A 'Logging level:' label with a ComboBox is shown, defaulting to 'Warning'
- Log messages appear in the log area with timestamps
- The log area displays colored text for different severity levels

**UWP reference screenshot:**  
![log-view-control](screenshots/uwp-scenario3-request-modification.png)

---

## Media Playback / MediaPlayerElement with transport controls

**ID:** `media-player-transport-controls`  
**Weight:** 2  

All scenarios include a MediaPlayerElement with transport controls enabled, showing a seek slider, time display, play/pause, volume, and fullscreen buttons.

**Expected behaviour:**
- A MediaPlayerElement occupies the main content area below controls
- Transport controls bar appears at the bottom of the media player
- Transport controls include: seek slider, elapsed time, volume button, play/pause, aspect ratio, and cast/fullscreen buttons
- The player area is empty/black before media is loaded

**UWP reference screenshot:**  
![media-player-transport-controls](screenshots/uwp-scenario1-simplest-streaming.png)
