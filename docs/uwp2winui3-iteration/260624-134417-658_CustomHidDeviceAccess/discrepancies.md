# Discrepancies — CustomHidDeviceAccess

**Score 0/4. Builds: yes. Runs (alive): yes. Renders: no.**

All four scenarios FAIL for one root cause — a **whole-window blank render**:

- UWP golden: full rich UI (nav list, description, Connect/Disconnect buttons, device
  ListView, green status bar). ~80,979-byte screenshot.
- WinUI candidate: byte-uniform blank white window, only OS caption buttons visible.
  ~12,562-byte screenshot, identical across all 4 scenarios.
- UIA tree is fully populated with valid geometry (e.g. 'Connect to device' Button at
  x=745,y=667) — layout ran, compositing did not.

Suspected skill gap: the scaffold's `<Window.SystemBackdrop><MicaBackdrop/>` needs DWM
composition that the headless capture host lacks; the skill previously covered only
*per-page* blanks (nav/init failures), not this *whole-window* backdrop blank.
