# Lessons — CustomHidDeviceAccess (UWP → WinUI 3)

## Outcome
- Score **0/4** features. App **builds** (0 errors) and **launches**, but renders a
  **completely blank white window** on every scenario. UIA tree is fully populated with
  correctly-positioned controls; nothing is painted. Only the OS caption buttons show.

## Root cause (the whole finding)
- The `dotnet new winui` scaffold seeds `MainWindow.xaml` with
  `<Window.SystemBackdrop><MicaBackdrop /></Window.SystemBackdrop>`.
- Mica/Acrylic need live **DWM composition / a real GPU**. The capture host (headless/VM/
  software-GPU) can't composite it, so the entire window paints blank instead of falling
  back to a solid brush. The app stays alive, so every process-alive gate passes; only a
  screenshot reveals it (12,562-byte uniform-white PNG vs 80,979-byte UWP golden).
- UWP has no backdrop, so the original renders fine in the **same** environment — the blank
  is introduced purely by the WinUI scaffold. This recurs for **every** scaffolded app.

## Dev-agent struggles
- Turns 63–70: `dotnet build` blew past the 300s command window several times; the agent
  stopped/cleaned/rebuilt and ran out of budget before any render check. Its own
  results.json reported builds:false/runs:false from that timeout even though the app builds.
  (Build slowness is environmental — out of skill scope.)

## Tooling gaps addressed
- `Test-AppLaunch` / Validator §7 only prove the process is alive — they can't see a
  whole-window blank. Added Validator **§9 WARN** for a surviving system backdrop, and a
  bootstrap **step 3c** that strips it up front.
