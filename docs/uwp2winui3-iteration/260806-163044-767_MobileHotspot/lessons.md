# MobileHotspot migration lessons

- **Helpful:** bootstrap generated migration artifacts; `dotnet build` exposed actionable errors; the validator's serialized rebuild and smoke launch produced the reliable final PASS.
- **Tool defects:** `winapp build` does not exist; bootstrap ignored csproj-linked shared files; launch lookup missed default `bin\Debug` output.
- **Main build chain:** missing linked XAML caused `CS0246` and XAML compiler failures; manual reconstruction caused namespace/helper mismatches; the unautomated color mapping caused two further build retries.
- **Runtime/parity chain:** unavailable-device initialization needed a visible status, but collapsing the feature panel removed every scored control. Defensive UI must preserve named controls and disable only unavailable actions.
- **Agent slips:** dependent bootstrap commands and later build/launch/validation commands were run concurrently, causing false checks and transient generated-file failures.

