# AdaptiveStreaming – UWP Feature Rubric

> **Note:** The UWP app could not be launched on this OS (crash at startup: `0xc000027b` in
> `Windows.UI.Xaml.dll` — legacy XAML projection incompatibility). This rubric is derived
> entirely from source code analysis. No live UWP screenshots are available.

---

## Navigation / Scenario list navigation

**ID:** `scenario-navigation`  
**Weight:** 2  

The main page uses a SplitView with a ListBox of 7 scenarios in the left pane. Selecting a scenario navigates the right-side Frame to the corresponding page.

**Expected behaviour:**
- A left pane lists all 7 scenarios: Simplest Adaptive Streaming, Event Handlers, Network Request Modification, Adaptive Streaming Tuning, Metadata, Ad Insertion, Live Seekable Range
- Clicking a scenario name loads its page in the content frame on the right
- The hamburger toggle button shows/hides the scenario list pane
- A status bar at the bottom displays status messages

**UWP reference screenshot:**  
![scenario-navigation](screenshots/uwp-scenario-navigation.png)

---

## Scenario 1 – Simplest Adaptive Streaming / Load and play media

**ID:** `s1-load-button`  
**Weight:** 2  

Scenario 1 has a description text block and a single Load button. Clicking Load creates a MediaSource from a hardcoded HLS manifest URI and assigns it to a MediaPlayerElement with transport controls.

**Expected behaviour:**
- A description text block explains implicit AdaptiveMediaSource creation
- A 'Load' button is visible
- Clicking 'Load' begins media playback in the MediaPlayerElement
- Transport controls (play/pause, seek bar, volume) are visible on the MediaPlayerElement

**UWP reference screenshot:**  
![s1-load-button](screenshots/uwp-s1-load-button.png)

---

## Scenario 2 – Event Handlers / Content selector control

**ID:** `s2-content-selector`  
**Weight:** 2  

Scenarios 2–7 use a shared ContentSelector user control with a ComboBox of content items, Load Id button, Load Uri text box and button, Set Source button, and AutoPlay checkbox.

**Expected behaviour:**
- A ComboBox lists available content items (Azure Media Services streams)
- A 'Load Id' button loads the selected content item from the ComboBox
- A 'Load Uri' button and text box allow entering a custom manifest URI
- A 'Set Source' button (initially disabled) becomes enabled after loading and sets the source on the MediaPlayer
- An 'AutoPlay' checkbox toggles auto-play behaviour

**UWP reference screenshot:**  
![s2-content-selector](screenshots/uwp-s2-content-selector.png)

---

## Scenario 2 – Event Handlers / Download and playback bitrate indicators

**ID:** `s2-bitrate-indicators`  
**Weight:** 1  

Scenario 2 displays download and playback bitrate with SymbolIcon bar indicators (ZeroBars to FourBars) and numeric text, updating in real time as the AdaptiveMediaSource changes bitrates.

**Expected behaviour:**
- A download bitrate icon and numeric value are displayed
- A playback bitrate icon and numeric value are displayed
- Icons change from ZeroBars through FourBars based on relative bitrate quartile
- Values update dynamically when bitrate changes occur during playback

**UWP reference screenshot:**  
![s2-bitrate-indicators](screenshots/uwp-s2-bitrate-indicators.png)

---

## Scenario 2 – Event Handlers / Event log view

**ID:** `s2-log-view`  
**Weight:** 1  

Scenarios 2–7 include a LogView control at the bottom of the page that displays timestamped log entries for media events (MediaPlayer, MediaSource, MediaPlaybackItem, AdaptiveMediaSource events).

**Expected behaviour:**
- A log panel is visible at the bottom of the scenario page
- Log entries appear as media events fire (e.g., MediaOpened, DownloadBitrateChanged)
- Log entries are timestamped and scrollable

**UWP reference screenshot:**  
![s2-log-view](screenshots/uwp-s2-log-view.png)

---

## Scenario 3 – Request Modification / Authorization method selection

**ID:** `s3-auth-radio-buttons`  
**Weight:** 1  

Scenario 3 provides radio buttons to select an Azure authorization method for AES-encrypted content: None, Authorization Header (default), Url Query Parameter, or Application Downloaded.

**Expected behaviour:**
- Four radio buttons are displayed for authorization method: None, Authorization Header, Url Query Parameter, Application Downloaded
- 'Authorization Header' is checked by default
- Selecting a method changes how the app presents the Bearer token to the key service
- Content loads or fails based on the selected authorization method

**UWP reference screenshot:**  
![s3-auth-radio-buttons](screenshots/uwp-s3-auth-radio-buttons.png)

---

## Scenario 3 – Request Modification / HDCP protection level selection

**ID:** `s3-hdcp-protection`  
**Weight:** 1  

Scenario 3 provides radio buttons for desired HDCP minimum protection level: Off (default), On, On With Type Enforcement. It also displays the effective protection and the resulting desired max bitrate.

**Expected behaviour:**
- Three radio buttons are displayed for HDCP protection: HDCP Off, HDCP On, HDCP On With Type Enforcement
- 'HDCP Off' is checked by default
- A text line shows the effective HDCP protection level and the desired max bitrate
- Changing the HDCP setting updates the effective protection text and imposes bandwidth restrictions

**UWP reference screenshot:**  
![s3-hdcp-protection](screenshots/uwp-s3-hdcp-protection.png)

---

## Scenario 4 – Tuning / Min/Initial/Max bitrate selection

**ID:** `s4-bitrate-tuning`  
**Weight:** 1  

Scenario 4 provides three ComboBoxes for setting DesiredMinBitrate, InitialBitrate, and DesiredMaxBitrate. The constraint DesiredMinBitrate ≤ InitialBitrate ≤ DesiredMaxBitrate is enforced; invalid selections are reverted.

**Expected behaviour:**
- Three ComboBoxes display available bitrates for Min, Initial, and Max bitrate
- ComboBoxes are populated with available bitrates from the loaded adaptive source
- Min and Max bitrate lists include a 'Not set' option
- Invalid combinations that violate the ordering constraint are rejected and reverted

**UWP reference screenshot:**  
![s4-bitrate-tuning](screenshots/uwp-s4-bitrate-tuning.png)

---

## Scenario 4 – Tuning / Downgrade ratio and headroom ratio

**ID:** `s4-advanced-tuning`  
**Weight:** 1  

Scenario 4 provides text boxes and Set buttons for BitrateDowngradeTriggerRatio and DesiredBitrateHeadroomRatio, plus an inbound bits-per-second indicator that polls and refreshes every 2 seconds.

**Expected behaviour:**
- A text box and Set button for 'Downgrade ratio' are visible
- A text box and Set button for 'Desired headroom ratio' are visible
- An inbound bits-per-second value is displayed and updates every ~2 seconds during playback
- Clicking Set applies the entered numeric value to the AdaptiveMediaSource advanced settings

**UWP reference screenshot:**  
![s4-advanced-tuning](screenshots/uwp-s4-advanced-tuning.png)

---

## Scenario 5 – Metadata / Timed metadata display

**ID:** `s5-metadata`  
**Weight:** 1  

Scenario 5 demonstrates consuming timed metadata from HLS (m3u8 comments, ID3 tags) or DASH (emsg boxes). The ContentSelector accepts custom URIs, and metadata events appear in the log view.

**Expected behaviour:**
- The description explains timed metadata consumption for HLS and DASH
- A ContentSelector allows loading content with timed metadata
- A MediaPlayerElement plays the content with transport controls
- Metadata events are logged in the LogView as they are encountered during playback

**UWP reference screenshot:**  
![s5-metadata](screenshots/uwp-s5-metadata.png)

---

## Scenario 6 – Ad Insertion / Ad insertion with progress reporting

**ID:** `s6-ad-insertion`  
**Weight:** 1  

Scenario 6 demonstrates ad insertion using MediaBreaks: two pre-roll ads, two mid-roll ads at 10%, and a post-roll ad. Playback progress for each ad and main content is reported via custom TimedMetadataTracks.

**Expected behaviour:**
- The description explains the ad insertion scheme (pre-roll, mid-roll at 10%, post-roll)
- A ContentSelector allows loading the main content
- Ads play at the specified insertion points during media playback
- Playback progress events for ads and main content are logged in the LogView

**UWP reference screenshot:**  
![s6-ad-insertion](screenshots/uwp-s6-ad-insertion.png)

---

## Scenario 7 – Live Seekable Range / Seekable window size and live offset controls

**ID:** `s7-seekable-window-controls`  
**Weight:** 1  

Scenario 7 displays MaxSeekableWindowSize and MinLiveOffset as read-only values, and provides editable text boxes with Set buttons for DesiredSeekableWindowSize and DesiredLiveOffset.

**Expected behaviour:**
- MaxSeekableWindowSize is displayed as a read-only value
- MinLiveOffset is displayed as a read-only value
- DesiredSeekableWindowSize has an editable text box and a Set button
- DesiredLiveOffset has an editable text box and a Set button
- Clicking Set applies the entered value to the live stream's AdaptiveMediaSource

**UWP reference screenshot:**  
![s7-seekable-window-controls](screenshots/uwp-s7-seekable-window-controls.png)

---

## Scenario 7 – Live Seekable Range / Position display and discrete seek controls

**ID:** `s7-position-and-seek`  
**Weight:** 1  

Scenario 7 shows StartPosition, CurrentPosition, and EndPosition text, a position Slider, and discrete seek buttons (<<15m, <<5m, <<30s, <<2s, Play, Pause, 2s>>, 30s>>, 5m>>, 15m>>), plus GoToStart and GoToLive buttons.

**Expected behaviour:**
- StartPosition, CurrentPosition, and EndPosition are displayed and update during live playback
- A position Slider reflects the current position within the seekable range
- Discrete seek buttons (<<15m, <<5m, <<30s, <<2s, 2s>>, 30s>>, 5m>>, 15m>>) seek by fixed amounts
- GoToStart seeks to the beginning of the seekable range
- GoToLive seeks to the live edge
- Play and Pause buttons control playback
- A 'Log Times' button logs the current time correlation to the LogView

**UWP reference screenshot:**  
![s7-position-and-seek](screenshots/uwp-s7-position-and-seek.png)

---

## Common / MediaPlayerElement with transport controls

**ID:** `media-player-element`  
**Weight:** 2  

Every scenario includes a MediaPlayerElement with AreTransportControlsEnabled=True, providing standard media transport controls for play, pause, seek, volume, and fullscreen.

**Expected behaviour:**
- A MediaPlayerElement is visible in each scenario page
- Transport controls include play/pause, a seek bar, volume control, and fullscreen toggle
- The media player stretches horizontally and vertically within its grid row

**UWP reference screenshot:**  
![media-player-element](screenshots/uwp-media-player-element.png)
