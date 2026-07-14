# Parity Rubric - AdaptiveStreaming

## Scenario 1 - Simplest Adaptive Streaming
- Controls: Load, mediaPlayerElement
- Actions: Load
- Outputs: , StatusBorder, StatusBlock

## Scenario 2 - Event Handlers
- Controls: mediaPlayerElement
- Actions: 
- Outputs: , StatusBorder, StatusBlock

## Scenario 3 - Network Request Modification
- Controls: RadioButtonNone, RadioButtonAuthorizationHeader, RadioButtonUrlQueryParameter, RadioButtonApplicationDownloaded, HcdpOff, HcdpOn, HdcpOnWithTypeEnforcement, mediaPlayerElement
- Actions: RadioButtonNone, RadioButtonAuthorizationHeader, RadioButtonUrlQueryParameter, RadioButtonApplicationDownloaded, HcdpOff, HcdpOn, HdcpOnWithTypeEnforcement
- Outputs: EffectiveHdcpProtectionText, DesiredMaxBitrateText, StatusBorder, StatusBlock

## Scenario 4 - Adaptive Streaming Tuning
- Controls: DesiredMinBitrateList, InitialBitrateList, DesiredMaxBitrateList, BitrateDowngradeTriggerRatioText, , BitrateHeadroomTriggerRatioText, , mediaPlayerElement
- Actions: , 
- Outputs: BitrateDowngradeTriggerRatioText, BitrateHeadroomTriggerRatioText, StatusBorder, StatusBlock

## Scenario 5 - Metadata
- Controls: mediaPlayerElement
- Actions: 
- Outputs: , StatusBorder, StatusBlock

## Scenario 6 - Ad Insertion
- Controls: mediaPlayerElement
- Actions: 
- Outputs: , StatusBorder, StatusBlock

## Scenario 7 - Live Seekable Range
- Controls: mediaPlayerElement, DesiredSeekableWindowSize, DesiredSeekableWindowSizeButton, DesiredLiveOffset, DesiredLiveOffsetButton, PositionSlider, LogCurrentTimeCorrelation, GoToStart, , , , , PlayButton, PauseButton, , , , , GoToLive
- Actions: DesiredSeekableWindowSizeButton, DesiredLiveOffsetButton, LogCurrentTimeCorrelation, GoToStart, , , , , PlayButton, PauseButton, , , , , GoToLive
- Outputs: MaxSeekableWindowSize, DesiredSeekableWindowSize, DesiredLiveOffset, MinLiveOffset, StartPosition, CurrentPosition, EndPosition, StatusBorder, StatusBlock


