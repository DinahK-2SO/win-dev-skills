# Migration Score: AdaptiveStreaming

| Metric | Value |
|--------|-------|
| Features evaluated | 18 |
| Pass | 0 |
| Partial | 1 |
| Fail | 17 |
| **Weighted score** | **5.0%** |

**Summary:** The app builds cleanly (warnings only) and launches without crashing. The main window renders with a title bar, header ("Windows SDK Sample" / "AdaptiveStreaming"), and a scenario list containing all 7 expected scenarios. However, **no scenario content pages load** — selecting a scenario does not populate the content area with any controls (buttons, media players, text boxes, etc.). The UIA tree confirms the content frame is empty. Screenshots appear blank due to WinUI 3 DirectComposition rendering not being capturable by Win32 screenshot methods, but UIA inspection provides definitive structural evidence.

---

## Navigation / Scenario list navigation

**Verdict:** ⚠️ Partial

The UIA tree confirms all 7 scenario titles are displayed in a ListBox control. The first item ("1) Simplest Adaptive Streaming") shows IsSelected: True. However, selecting a scenario does not cause any content page to load — the content frame area remains completely empty with no child controls.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed — app crashed at startup)* | ![winui3](screenshots/winui3-scenario-navigation.png) |

**Expected behaviour checklist:**
- [x] A list of 7 scenario titles is visible: Simplest Adaptive Streaming, Event Handlers, Network Request Modification, Adaptive Streaming Tuning, Metadata, Ad Insertion, Live Seekable Range
- [ ] Clicking a scenario title navigates to that scenario's page content
- [x] The currently selected scenario is visually highlighted

---

## Scenario 1 - Simplest Adaptive Streaming / Load button triggers playback

**Verdict:** ❌ Fail

No content page loads for Scenario 1. UIA tree search for any "Load" button or "Button" element returns 0 matches outside window chrome. The scenario content frame is empty.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] A 'Load' button is displayed at the top of the scenario page
- [ ] Clicking 'Load' causes the MediaPlayerElement to begin loading/playing content
- [ ] A description text block explains the implicit AdaptiveMediaSource creation

---

## Media Playback / MediaPlayerElement with transport controls

**Verdict:** ❌ Fail

No MediaPlayerElement is present anywhere in the UIA tree. The content area where it should appear is completely empty.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] A media player area is visible occupying the main content region
- [ ] Transport controls are visible at the bottom of the player (play/pause, timeline, volume, fullscreen)
- [ ] Transport controls respond to user interaction

---

## Content Selector / Load by content ID

**Verdict:** ❌ Fail

No ContentSelector controls (ComboBox, 'Load Id:' button) found in UIA tree. Scenario content pages do not load.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] A ComboBox displays available content models from the Azure Media Services stub list
- [ ] A 'Load Id:' button is present next to the ComboBox
- [ ] Clicking 'Load Id:' loads the selected content into the media player

---

## Content Selector / Load by custom URI

**Verdict:** ❌ Fail

No TextBox or 'Load Uri:' button found in UIA tree. Content pages do not render.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] A TextBox with URL input scope is available for entering a custom URI
- [ ] A 'Load Uri:' button is present next to the TextBox
- [ ] Clicking 'Load Uri:' loads the entered manifest URL into the media player

---

## Content Selector / Set Source button and AutoPlay checkbox

**Verdict:** ❌ Fail

No 'Set Source' button or 'AutoPlay' checkbox found in UIA tree. Content pages do not render.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] A 'Set Source' button is present (disabled until content is loaded)
- [ ] An 'AutoPlay' checkbox is present, unchecked by default
- [ ] Checking AutoPlay causes loaded content to begin playing automatically

---

## Scenario 2 - Event Handlers / Download and playback bitrate indicators

**Verdict:** ❌ Fail

Scenario 2 content page does not load. No bitrate indicators visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] A download icon (Download symbol) with a bar-level icon and bitrate text is shown
- [ ] A playback icon (Play symbol) with a bar-level icon and bitrate text is shown
- [ ] The bar icons update dynamically as the adaptive streaming engine changes bitrates

---

## Scenario 2 - Event Handlers / Event log view

**Verdict:** ❌ Fail

Scenario 2 content page does not load. No LogView panel visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] A log panel is visible at the bottom of the scenario page
- [ ] Streaming events are logged in real time as playback progresses
- [ ] Events include adaptive source opened, download state changes, and bitrate switches

---

## Scenario 3 - Request Modification / Authorization method radio buttons

**Verdict:** ❌ Fail

Scenario 3 content page does not load. No radio buttons visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] Four radio buttons are displayed: None, Authorization Header, Url Query Parameter, Application Downloaded
- [ ] Authorization Header is selected by default
- [ ] Selecting a different method changes how the key request is authenticated

---

## Scenario 3 - Request Modification / HDCP protection level controls

**Verdict:** ❌ Fail

Scenario 3 content page does not load. No HDCP radio buttons visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] Three radio buttons for HDCP: Off, On, On With Type Enforcement
- [ ] HDCP Off is selected by default
- [ ] Effective protection text and desired max bitrate text update when selection changes

---

## Scenario 4 - Tuning / Min/Initial/Max bitrate ComboBoxes

**Verdict:** ❌ Fail

Scenario 4 content page does not load. No ComboBoxes visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] Three ComboBoxes labeled 'Min Bitrate', 'Initial Bitrate', and 'Max Bitrate' are displayed
- [ ] ComboBoxes are populated with available bitrate values from the content
- [ ] Changing a selection constrains the adaptive streaming engine to respect the new limit

---

## Scenario 4 - Tuning / Downgrade ratio and headroom ratio controls

**Verdict:** ❌ Fail

Scenario 4 content page does not load. No TextBox/Set button pairs visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] A TextBox and 'Set' button for 'Downgrade ratio' are displayed
- [ ] A TextBox and 'Set' button for 'Desired headroom ratio' are displayed
- [ ] Clicking 'Set' applies the entered numeric value to the adaptive media source

---

## Scenario 4 - Tuning / Inbound bits per second display

**Verdict:** ❌ Fail

Scenario 4 content page does not load. No inbound bitrate display visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] An inbound bitrate icon and text display the measured network throughput
- [ ] The value updates dynamically during playback

---

## Scenario 5 - Metadata / Timed metadata display

**Verdict:** ❌ Fail

Scenario 5 content page does not load. No metadata controls or log view visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] Content with timed metadata can be loaded via the ContentSelector
- [ ] Metadata events are logged in the LogView as they are encountered during playback
- [ ] The description explains HLS/DASH metadata sources

---

## Scenario 6 - Ad Insertion / Ad insertion with progress reporting

**Verdict:** ❌ Fail

Scenario 6 content page does not load. No ad insertion controls visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] Loading content triggers a playlist with pre-roll ads, main content with mid-roll ads at 10%, and post-roll ads
- [ ] Playback progress events are logged in the LogView
- [ ] The MediaPlayerElement plays through the ad sequence and main content

---

## Scenario 7 - Live Seekable Range / Live seekable range controls

**Verdict:** ❌ Fail

Scenario 7 content page does not load. No seekable window controls visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] MaxSeekableWindowSize and MinLiveOffset are displayed as read-only text
- [ ] DesiredSeekableWindowSize has a TextBox and Set button to adjust the DVR window
- [ ] DesiredLiveOffset has a TextBox and Set button to adjust how far behind live edge to play

---

## Scenario 7 - Live Seekable Range / Position slider and time display

**Verdict:** ❌ Fail

Scenario 7 content page does not load. No position slider or time labels visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] StartPosition, CurrentPosition, and EndPosition text labels display time values
- [ ] A horizontal slider allows seeking within the seekable range
- [ ] Position values update as playback progresses

---

## Scenario 7 - Live Seekable Range / Discrete seek and playback control buttons

**Verdict:** ❌ Fail

Scenario 7 content page does not load. No seek buttons visible in UIA tree.

| UWP reference | WinUI 3 result |
|---------------|----------------|
| *(UWP capture failed)* | *(No content rendered — blank frame)* |

**Expected behaviour checklist:**
- [ ] Seek buttons for fixed amounts (2s, 30s, 5m, 15m forward and back) are displayed
- [ ] GoToStart and GoToLive buttons are displayed
- [ ] Play and Pause buttons with symbol icons are present
- [ ] A 'Log Times' button logs the current time correlation to the LogView
