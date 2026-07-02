# Lessons — DatagramSocket (UWP → WinUI 3)

Score: **100/100**, builds ✔, runs ✔, 5/5 features pass. The migration was clean;
the single substantive struggle was a build-time namespace/type collision.

## Errors encountered
- **CS0118: 'DatagramSocket' is a namespace but is used like a type** (4 sites across
  Scenario1/2/5 `.xaml.cs`). Root cause: the project `RootNamespace` is `DatagramSocket`
  (session-log.txt:1944 — the scaffold names the project after the UWP sample), which
  shadows the same-named WinRT type `Windows.Networking.Sockets.DatagramSocket`. A bare
  `DatagramSocket` identifier binds to the namespace, not the type. Fix: alias
  (`using WinDatagramSocket = Windows.Networking.Sockets.DatagramSocket;`) or fully-qualify.
- **WMC0909 / WMC1509 / WMC1111 XAML errors** (MainPage.xaml). These were a **cascade**
  from the CS0118 C# failure — once the collision was fixed the build had 0 errors.

## Dev-agent struggle
- Took 2 build cycles: the first fix used a greedy PowerShell `-replace` that corrupted
  its own alias line (`...Sockets.DatagramSocket;` → `...Sockets.WinDatagramSocket;`),
  needing a cleanup pass (session-log.txt:4466-4562). Preventable by a documented pattern
  giving the exact alias fix instead of ad-hoc regex.

## Tool notes
- Native `dotnet build` surfaced the errors and confirmed the clean rebuild — worked well.
- Bulk regex over source files was the unreliable step (self-inflicted, one-off).
