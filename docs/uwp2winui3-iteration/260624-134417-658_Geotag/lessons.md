# Lessons — Geotag (UWP → WinUI 3), score 0/1

## Decisive finding
The migrated app **builds, runs, and passes the process-alive smoke gate**, yet the
parity capture is a **completely blank white window**. Content (nav pane, title,
description, "Choose file") is present in the UIA/visual tree and "Choose file" responds
(opens the file picker), so nothing threw and navigation succeeded — the whole window
simply fails to **paint**.

## Root cause
`MainWindow.xaml` (from the `dotnet new winui` scaffold) declares:

```xml
<Window.SystemBackdrop>
    <MicaBackdrop />
</Window.SystemBackdrop>
```

System backdrops (Mica/Acrylic) need DWM composition, which is often unavailable in the
**headless / VM / RDP capture environment** where parity screenshots are taken. There the
backdrop fails to present and the **entire window renders blank** — even though the page's
root Grid already sets an opaque `ApplicationPageBackgroundThemeBrush`. An opaque
background alone does **not** rescue it; the `<Window.SystemBackdrop>` itself must go.

## Why the skill/tooling missed it
- The skill's existing "blank page" guidance is entirely about content **missing** from
  the tree (navigation/init throws, deferred hero controls). This case is content
  **present**, whole window unpainted — a different mechanism, not covered.
- `Validate-UwpMigration.ps1` Section 7 only proves the **process stayed alive**; a blank
  window passes.
- The migration agent has **no screenshot capability**, so a blank render is invisible to
  it and it declares done on a green build.

## Fix (generalizable)
Remove the scaffold's `<Window.SystemBackdrop>` so the app renders reliably everywhere and
matches the opaque UWP original. Surface it statically via a validator WARN so the agent is
warned without needing to see pixels.
