# Skill defects

1. **Linked project inputs were absent from bootstrap.** The script copied 7 physical files but ignored explicit csproj `Include` + `Link` items. Fix: materialize linked source at its target `Link` path and include it in all bootstrap outputs.
2. **Merged dictionary paths were not validated.** `/Styles/Styles.xaml` pointed to no target file and the app died with opaque `0xc000027b`, making all five features unavailable. Fix: resolve local dictionary URIs mechanically before launch.
3. **Launch layout discovery was wrong for `dotnet build`.** A successful `bin\Debug` build was reported unavailable because only `bin\x64\Debug` was searched. Fix: discover both layouts.
