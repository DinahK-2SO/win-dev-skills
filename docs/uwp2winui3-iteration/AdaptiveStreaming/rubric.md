# Feature Rubric: AdaptiveStreaming

**Scenario:** AdaptiveStreaming  
**UWP capture status:** failed — UWP app crashed at startup in Windows.UI.Xaml.dll (0xc000027b), legacy XAML stowed exception on newer OS build

---

## Navigation / Scenario list with SplitView navigation

**ID:** `app-shell-navigation`  
**Weight:** 2  

The app displays a SplitView pane on the left with a ListBox listing all 7 scenarios. Clicking a scenario navigates the right-side Frame to the corresponding page. A hamburger toggle button opens/closes the pane.

**Expected behaviour:**
- A left sidebar pane lists all 7 scenarios by title
- Clicking a scenario navigates the content frame to that scenario's page
- A hamburger button toggles the sidebar pane open/closed
- The header shows 'Universal Windows Platform sample' branding

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Navigation / Status bar at bottom of content area

**ID:** `status-bar`  
**Weight:** 1  

A status bar at the bottom of the content area shows status messages from scenarios.

**Expected behaviour:**
- A 'Status:' label is visible at the bottom of the content area
- Status messages from scenario operations appear in the status block
- The status block is scrollable when content overflows

**UWP reference screenshot:**  
_UWP screenshot not captured_

---

## Scenarios / Scenario 1: Simplest Adaptive Streaming

**ID:** `scenario1-simplest-streaming`  
**Weight:** 2  

A simple page with a description, a 'Load' button, and a MediaPlayerElement.

**Expected behaviour:**
- Description text explains implicit AdaptiveMediaSource creation
- A 'Load' button is present and clickable
- A MediaPlayerElement with transport controls is visible
- Clicking Load sets the media source

**UWP reference screenshot:**  
_UWP screenshot not captured_

---

## Scenarios / Scenario 2: Event Handlers

**ID:** `scenario2-event-handlers`  
**Weight:** 1  

Shows explicit AdaptiveMediaSource usage with event reporting, bitrate indicators, ContentSelector, and LogView.

**Expected behaviour:**
- ContentSelector control allows choosing streaming content
- Download and playback bitrate indicators are visible
- MediaPlayerElement with transport controls is present
- LogView control shows streaming event log entries

**UWP reference screenshot:**  
_UWP screenshot not captured_

---

## Scenarios / Scenario 3: Network Request Modification

**ID:** `scenario3-request-modification`  
**Weight:** 1  

Authentication method selection and HDCP protection controls.

**Expected behaviour:**
- Four authentication method radio buttons are present and selectable
- Three HDCP protection level radio buttons are present
- Effective protection text updates based on selection
- ContentSelector, MediaPlayerElement, and LogView are present

**UWP reference screenshot:**  
_UWP screenshot not captured_

---

## Scenarios / Scenario 4: Adaptive Streaming Tuning

**ID:** `scenario4-tuning`  
**Weight:** 1  

Tuning controls: bitrate ComboBoxes, downgrade/headroom ratio controls.

**Expected behaviour:**
- Three ComboBoxes for min, initial, and max bitrate are present
- Downgrade ratio TextBox with Set button is present
- Headroom ratio TextBox with Set button is present
- Bitrate icons and inbound bitrate display are visible
- ContentSelector, MediaPlayerElement, and LogView are present

**UWP reference screenshot:**  
_UWP screenshot not captured_

---

## Scenarios / Scenario 5: Metadata

**ID:** `scenario5-metadata`  
**Weight:** 1  

Shows timed metadata consumption from HLS/DASH streams.

**Expected behaviour:**
- Description explains timed metadata from HLS/DASH
- ContentSelector, MediaPlayerElement, and LogView are present
- Metadata events appear in the log when streaming content is loaded

**UWP reference screenshot:**  
_UWP screenshot not captured_

---

## Scenarios / Scenario 6: Ad Insertion

**ID:** `scenario6-ad-insertion`  
**Weight:** 1  

Demonstrates ad insertion with pre/mid/post-roll ads.

**Expected behaviour:**
- Description explains ad insertion with pre-roll, mid-roll, and post-roll
- ContentSelector, MediaPlayerElement, and LogView are present
- Ad insertion and progress events appear in the log

**UWP reference screenshot:**  
_UWP screenshot not captured_

---

## Scenarios / Scenario 7: Live Seekable Range

**ID:** `scenario7-live-seekable-range`  
**Weight:** 1  

Seekable range controls for live DVR content.

**Expected behaviour:**
- Seekable window controls grid shows Max/Desired/LiveOffset/Min fields
- Position tracking shows Start/Current/End positions with a Slider
- Discrete seek buttons are present
- GoToStart and GoToLive buttons are present
- ContentSelector, MediaPlayerElement, and LogView are present

**UWP reference screenshot:**  
_UWP screenshot not captured_

---

## Controls / ContentSelector user control

**ID:** `content-selector-control`  
**Weight:** 2  

Reusable UserControl for picking streaming URIs. Appears in scenarios 2-7.

**Expected behaviour:**
- A dropdown or selection mechanism for predefined streaming content is visible
- Users can enter a custom URI
- The control triggers content loading in the parent scenario

**UWP reference screenshot:**  
_UWP screenshot not captured_

---

## Controls / LogView control for event logging

**ID:** `log-view-control`  
**Weight:** 1  

Reusable logging control for streaming events. Appears in scenarios 2-7.

**Expected behaviour:**
- Log entries appear as streaming events occur
- Log is scrollable when entries overflow
- Log entries contain relevant event information

**UWP reference screenshot:**  
_UWP screenshot not captured_

---

## Media / MediaPlayerElement with transport controls

**ID:** `media-player-transport`  
**Weight:** 2  

Every scenario includes a MediaPlayerElement with transport controls.

**Expected behaviour:**
- MediaPlayerElement renders in each scenario page
- Transport controls (play/pause, seek, volume) are visible when media is loaded
- The player fills available space

**UWP reference screenshot:**  
_UWP screenshot not captured_
