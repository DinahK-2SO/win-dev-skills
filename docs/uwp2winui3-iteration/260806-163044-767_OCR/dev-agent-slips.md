# Dev-agent slips

- Retained `CaptureElement` and guessed the wrong anchor despite the injected `#capture` TODO.
- Omitted the documented `Microsoft.UI` namespace for `Win32Interop`.
- Introduced a `DispatcherQueuePriority` ambiguity with a broad `Windows.System` import.
- Reworked one compiled binding during a noisy multi-error build without evidence of a general skill gap.
- Left `Launcher` unqualified after removing its namespace import.
