# Skill Defects — ApplicationData (WILL change skill)

## 1. CS0118 — project name shadows an identically-named `Windows.*` type
- **Evidence:** session-log.txt:2412 `error CS0118: 'ApplicationData' is a namespace but is used like a type`.
- **Skill state:** absent. "Common build errors after the namespace rewrite" covers CS0104/CS0227/CS0246 only.
- **Root cause:** UWP samples are named after the WinRT API they demo; the WinUI 3 scaffold's
  RootNamespace == project name shadows the like-named `Windows.*` type. `ApplicationData.Current`
  binds to the namespace.
- **Fix:** new CS0118 entry → fully-qualify the WinRT type (or set a distinct RootNamespace).
- **Generalizes:** every sample whose project name == a Windows type it uses (ApplicationData,
  DataTransfer, FileAccess, Appointments, Compositor, …).

## 2. C# compile error → spurious XAML WMC1509/WMC0909/WMC1111/WMC9999 cascade
- **Evidence:** session-log.txt:2413-2416; agent called it "Two issues"; XAML errors vanished after
  the C# fix + stale-obj clean (TURN 30 rebuild succeeded).
- **Skill state:** absent. x:Bind section only documents XLS0414/MC3074.
- **Root cause:** MarkupCompilePass2 with no LocalAssembly can't resolve x:Bind/x:DataType types when
  code-behind fails to compile; stale obj/x64 compounds it.
- **Fix:** note — fix the C# error + clean stale obj first; don't edit the XAML.
- **Generalizes:** any x:Bind project, any code-behind compile failure.
