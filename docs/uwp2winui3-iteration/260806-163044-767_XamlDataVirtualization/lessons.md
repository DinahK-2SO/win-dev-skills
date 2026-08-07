# Lessons: XamlDataVirtualization

- **Bootstrap worked:** it copied and classified all 14 source files and injected targeted TODOs.
- **Native build exposed real integration errors:** copied pages retained their source namespace while scaffold types used the new project namespace; explicit boundary imports fixed the build.
- **The documented build command was wrong:** `winapp build` is unsupported. A host-architecture `dotnet build` must complete before launch.
- **Startup diagnostics lost the decisive signal:** event 1026 contained managed HRESULT `0x8001010E`, but the helper selected its hint from native wrapper code `0xe0434352`.
- **Generated `Program.Main` was misdiagnosed as authored code:** adding an equivalent custom entry point could not fix a failure inside `Application.Start` before its callback.
- **Manifest guidance was already adequate:** stale UWP image names caused `0x80073CF6`; the validator and existing manifest section identified the issue.
- **Outcome:** both scored features were unavailable because the candidate never launched; no evidence showed a data-virtualization API incompatibility.

## Dev-agent struggles

- Turns 16-21: one invalid build command and one launch without the required x64 layout.
- Turns 26-43: repeated launch diagnosis and a speculative custom entry point failed to resolve the pre-callback apartment crash.

## Errors encountered

- `CS0246` / `CS0103`: scaffold/source namespace boundary; fixed with explicit imports.
- `0x80073CF6`: missing manifest assets; fixed by reconciling image references and rebuilding.
- `0x8001010E`: unresolved pre-callback `Application.Start` apartment failure.
- `CS0029`: underscore callback parameter shadowed a discard; fixed with `new App();`.
- Incomplete launch layout: build and launch were issued concurrently.
