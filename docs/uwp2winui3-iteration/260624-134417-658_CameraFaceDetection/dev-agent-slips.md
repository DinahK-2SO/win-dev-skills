# Dev-agent slips — CameraFaceDetection (index 0)  → NO skill change

None. The single defect (white-on-white invisible fallback + buttons) traces to genuine skill gaps: the
defensive-fallback rule doesn't require contrast-visibility, and no pattern covers hardcoded literal
white colours vs. WinUI 3's Light default theme. The agent followed the guidance it had; the structural
migration (controls, AutomationIds, disabled states, deferred CaptureElement) was faithful.
