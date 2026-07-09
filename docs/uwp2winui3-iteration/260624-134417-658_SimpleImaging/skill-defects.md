# Skill defects — SimpleImaging (WILL change skill)

1. **Empty-string `<Image Source="" />` is load-fatal in WinUI 3 (undocumented).**
   Verbatim SDK-sample placeholder on the first-navigated page → XAML-load fail-fast before render. UWP tolerated it. *Absent* from the skill.
   → Add XAML pitfall (`#xaml`) + validator WARN. **Generalizes:** empty-string typed placeholders (Source/Uri) recur across UWP image/media samples.

2. **`0xc0000409` (native fail-fast, no event 1026) has no crash guidance.**
   The startup-crashes table and `Get-CrashSignature` switch cover only managed-ish codes; the default hint "read event 1026" is a dead end for a native fail-fast. *Absent*.
   → Add a `0xc0000409` case/row: native fail-fast, usually no 1026, usually a startup XAML-load failure → bisect the startup XAML. **Generalizes:** generic Windows fail-fast + XAML-load failures are a recurring WinUI-3 startup mode.

3. **`Get-CrashSignature` misreports the unpackaged `REGDB_E_CLASSNOTREG`/AutoInitialize artifact as the managed cause.**
   It picks any 1026 by exe-name within 3 min with no stack filter, so a stale event from running the bare `.exe` without identity is presented as the crash — which sent the agent into an SDK-downgrade/AutoInitializer rabbit hole for ~40 turns. *Wrong*.
   → Filter that frame out; discount it in the `0xc0000409` hint. **Generalizes:** any run of the bare exe poisons the WER window; the shared diagnostic should be robust for every scenario.
