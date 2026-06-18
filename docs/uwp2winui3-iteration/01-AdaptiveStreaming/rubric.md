# AdaptiveStreaming — UWP Feature Rubric

> **UWP capture status:** failed — UWP app crashed at startup in Windows.UI.Xaml.dll
> (0xc000027b), a legacy XAML stowed exception on newer OS build. All feature
> descriptions are derived from source code analysis.

---

## Navigation / Scenario list navigation

**ID:** `scenario-navigation`
**Weight:** 1

The app displays a left-side scenario list with 7 scenarios. Clicking a scenario navigates to the corresponding page in the right content area.

**Expected behaviour:**
- A ListBox/ListView on the left shows all 7 scenario titles
- Clicking a scenario title loads the corresponding scenario page in the content frame
- The selected scenario is visually highlighted in the list

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 1 — Simplest Adaptive Streaming / Load button triggers media playback

**ID:** `s1-load-button`
**Weight:** 2

Scenario 1 has a single 'Load' button that creates a MediaSource from a hardcoded HLS manifest URI and sets it on the MediaPlayerElement.

**Expected behaviour:**
- A 'Load' button is visible below the scenario description
- Clicking 'Load' begins loading the adaptive streaming content into the MediaPlayerElement
- The MediaPlayerElement displays video content after loading completes

_UWP screenshot not captured (app crashed at startup)_

---

## Shared / MediaPlayerElement with transport controls

**ID:** `media-player-transport-controls`
**Weight:** 2

All scenarios (1–6) display a MediaPlayerElement with built-in transport controls (play/pause, seek bar, volume, full screen).

**Expected behaviour:**
- A MediaPlayerElement is visible in the main content area of each scenario
- Transport controls (play, pause, seek slider, volume, full-screen) are enabled and functional
- AreTransportControlsEnabled is true for scenarios 1–6

_UWP screenshot not captured (app crashed at startup)_

---

## Content Selector / Load content by ID from ComboBox

**ID:** `content-selector-load-id`
**Weight:** 2

Scenarios 2–7 include a ContentSelector user control with a ComboBox of predefined content items and a 'Load Id' button.

**Expected behaviour:**
- A ComboBox lists available adaptive content models (HLS, DASH, Live, PlayReady, etc.)
- Clicking 'Load Id' loads the selected content model's manifest URI
- The 'Set Source' button becomes enabled after content is successfully loaded

_UWP screenshot not captured (app crashed at startup)_

---

## Content Selector / Load content by custom URI

**ID:** `content-selector-load-uri`
**Weight:** 1

The ContentSelector includes a 'Load Uri' button and a TextBox where users can type a custom manifest URI.

**Expected behaviour:**
- A TextBox is visible for entering a custom URI
- Clicking 'Load Uri' attempts to create an AdaptiveMediaSource from the entered URI
- Invalid URIs produce a log message indicating the error

_UWP screenshot not captured (app crashed at startup)_

---

## Content Selector / Set Source and AutoPlay checkbox

**ID:** `content-selector-set-source`
**Weight:** 1

After loading content, the 'Set Source' button assigns the MediaPlaybackItem to the MediaPlayer. An AutoPlay checkbox controls auto-play behaviour.

**Expected behaviour:**
- 'Set Source' button is disabled until content is loaded, then becomes enabled
- Clicking 'Set Source' assigns the loaded content to the MediaPlayer and begins playback resolution
- The 'AutoPlay' checkbox toggles auto-play on the MediaPlayer

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 2 — Event Handlers / Download and playback bitrate indicators

**ID:** `s2-bitrate-indicators`
**Weight:** 1

Scenario 2 displays real-time download and playback bitrate values with bar-chart SymbolIcons that update as the adaptive stream changes bitrate.

**Expected behaviour:**
- Download bitrate is shown with a Download icon, a bar-level SymbolIcon, and a numeric value
- Playback bitrate is shown with a Play icon, a bar-level SymbolIcon, and a numeric value
- Icons update dynamically when DownloadBitrateChanged or PlaybackBitrateChanged events fire

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 2 — Event Handlers / Event logging view

**ID:** `s2-event-log`
**Weight:** 1

Scenarios 2–7 include a LogView control at the bottom that displays runtime events (MediaPlayer, MediaSource, AdaptiveMediaSource events) as scrollable text.

**Expected behaviour:**
- A log panel is visible at the bottom of the page
- Events such as MediaOpened, DownloadBitrateChanged, PlaybackBitrateChanged are logged with timestamps
- The log scrolls to show the most recent entries

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 3 — Request Modification / Authorization method radio buttons

**ID:** `s3-auth-radio-buttons`
**Weight:** 1

Scenario 3 provides four radio buttons to select AES key authorization method: None, Authorization Header, URL Query Parameter, or Application Downloaded.

**Expected behaviour:**
- Four radio buttons are visible: None, Authorization Header, Url Query Parameter, Application Downloaded
- 'Authorization Header' is checked by default
- Selecting a different radio button changes how key requests are authenticated

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 3 — Request Modification / HDCP protection level controls

**ID:** `s3-hdcp-protection`
**Weight:** 1

Scenario 3 includes radio buttons for desired HDCP minimum protection (Off, On, On With Type Enforcement) and displays the effective protection level with a max bitrate.

**Expected behaviour:**
- Three HDCP radio buttons are visible: HDCP Off (default), HDCP On, HDCP On With Type Enforcement
- An 'Effective protection' text displays the current HDCP status and associated max bitrate
- Changing HDCP selection updates the effective protection text and may restrict available bitrates

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 4 — Adaptive Streaming Tuning / Min/Initial/Max bitrate ComboBoxes

**ID:** `s4-bitrate-tuning`
**Weight:** 2

Scenario 4 provides three ComboBoxes to set the DesiredMinBitrate, InitialBitrate, and DesiredMaxBitrate on the AdaptiveMediaSource.

**Expected behaviour:**
- Three ComboBoxes labeled 'Min Bitrate', 'Initial Bitrate', and 'Max Bitrate' are populated with available bitrate values
- Changing a ComboBox selection updates the corresponding property on the AdaptiveMediaSource
- Invalid combinations (min > initial or initial > max) are rejected and the selection reverts

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 4 — Adaptive Streaming Tuning / Downgrade ratio and headroom ratio settings

**ID:** `s4-advanced-tuning`
**Weight:** 1

Scenario 4 includes TextBoxes and Set buttons for BitrateDowngradeTriggerRatio and DesiredBitrateHeadroomRatio advanced settings.

**Expected behaviour:**
- A 'Downgrade ratio' TextBox and 'Set' button are visible
- A 'Desired headroom ratio' TextBox and 'Set' button are visible
- Clicking 'Set' applies the entered numeric value to the AdaptiveMediaSource.AdvancedSettings

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 4 — Adaptive Streaming Tuning / Inbound bits per second display

**ID:** `s4-inbound-bitrate`
**Weight:** 1

Scenario 4 displays the current InboundBitsPerSecond value, polled every 2 seconds, alongside the download and playback bitrate indicators.

**Expected behaviour:**
- An inbound bitrate value is displayed with a network icon
- The value updates periodically (every ~2 seconds) while content is playing
- The display uses a SymbolIcon and a TextBlock showing the numeric value

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 5 — Metadata / Timed metadata display

**ID:** `s5-metadata-display`
**Weight:** 1

Scenario 5 demonstrates consuming timed metadata (HLS m3u8 comments, ID3 tags, DASH emsg boxes). Metadata events are logged in the LogView.

**Expected behaviour:**
- The scenario description mentions HLS and DASH timed metadata support
- A ContentSelector and MediaPlayerElement are present for loading metadata-bearing streams
- Metadata events (TimedMetadataTracksChanged, CueEntered) are logged in the log panel

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 6 — Ad Insertion / Pre-roll, mid-roll, and post-roll ads

**ID:** `s6-ad-insertion`
**Weight:** 2

Scenario 6 demonstrates MediaBreak-based ad insertion with two pre-roll ads, two mid-roll ads at 10% of content duration, and a post-roll ad.

**Expected behaviour:**
- Pre-roll ads play before the main content starts (Red Sky and Flowers videos)
- Mid-roll ads play at approximately 10% into the main content
- A post-roll ad plays after the main content ends
- Ad playback progress events are logged in the log panel

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 7 — Live Seekable Range / Seekable window configuration

**ID:** `s7-seekable-window-controls`
**Weight:** 1

Scenario 7 shows MaxSeekableWindowSize (read-only), DesiredSeekableWindowSize (editable), DesiredLiveOffset (editable), and MinLiveOffset (read-only) for live DVR content.

**Expected behaviour:**
- MaxSeekableWindowSize and MinLiveOffset are displayed as read-only text
- DesiredSeekableWindowSize has a TextBox and 'Set' button to configure the DVR window size
- DesiredLiveOffset has a TextBox and 'Set' button to configure the live offset
- Values update after clicking 'Set' to reflect the applied configuration

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 7 — Live Seekable Range / Position slider and time display

**ID:** `s7-position-slider`
**Weight:** 1

Scenario 7 includes a custom position slider with StartPosition, CurrentPosition, and EndPosition labels that track the live seekable range.

**Expected behaviour:**
- A horizontal Slider control spans the width of the content area
- StartPosition, CurrentPosition, and EndPosition labels display time values
- The slider position updates in real-time as the media plays
- Seekable ranges update when SeekableRangesChanged event fires

_UWP screenshot not captured (app crashed at startup)_

---

## Scenario 7 — Live Seekable Range / Seek and playback control buttons

**ID:** `s7-discrete-controls`
**Weight:** 1

Scenario 7 provides discrete seek buttons (<<15m, <<5m, <<30s, <<2s, 2s>>, 30s>>, 5m>>, 15m>>), Play/Pause, GoToStart, GoToLive, and Log Times buttons for live content navigation.

**Expected behaviour:**
- Seek buttons (<<15m through 15m>>) seek forward/backward by the indicated time amount
- GoToStart seeks to the beginning of the seekable range
- GoToLive seeks to the end of the seekable range (live edge)
- Play and Pause buttons toggle playback state and enable/disable based on current state
- Log Times button logs the current time correlation data

_UWP screenshot not captured (app crashed at startup)_
