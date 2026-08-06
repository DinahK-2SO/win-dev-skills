# Lessons: LinguisticServices

- **Bootstrap worked mechanically but modeled the directory, not the project.** It mapped six local files while omitting linked SharedContent and a native runtime component.
- **The scaffold manifest must remain authoritative.** Copying the UWP manifest caused missing assets, missing desktop capabilities, and a literal UWP entry point.
- **Build with `dotnet build <csproj>`.** The installed standalone `winapp` has no `build` command; build and launch must also be serialized.
- **Startup diagnostics need the managed frame.** The helper captured a wrong-thread COMException but discarded its stack and emitted a generic package-reference hint.
- **Do not invent platform APIs to replace an omitted dependency.** Detect and surface mixed-language project references before migration starts.

## Agent struggles

1. About 12 turns reconstructing linked shared files from source and generated output.
2. About 20 turns recovering from invalid build invocation, concurrent compilation, and speculative API substitutions.
3. Four packaging/startup cycles that never fixed the active UWP entry point.

## Error chain

`winapp build` unsupported -> wrong-directory/concurrent `dotnet` builds -> missing linked types/XAML -> missing manifest assets/capabilities -> clean build -> `Arg_COMException` startup failure.
