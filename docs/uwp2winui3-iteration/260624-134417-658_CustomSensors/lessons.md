# Lessons — CustomSensors (score 100, builds+runs, 2/2 pass)

The migration ultimately succeeded cleanly; all findings are **build-time friction** in
the dev log, not scored feature failures.

## Errors encountered
- **CS0176 (hard build error)** — `{x:Bind FEATURE_NAME}` against a `const`/`static`
  member. x:Bind emits an instance-qualified path, illegal for static/const → CS0176.
  Fix: bind an instance wrapper (`public string FeatureName => FEATURE_NAME;`) or
  type-qualify (`{x:Bind local:MainPage.FEATURE_NAME}`).
- **16× CS8618/CS8625 (warnings)** — the WinUI 3 scaffold enables
  `<Nullable>enable</Nullable>`; ported UWP code (`private CustomSensor customSensor;`,
  `= null`) trips the nullable analyzer. Fix: nullable fields for deferred init, annotate
  null call sites.

## Dev-agent struggles
- x:Bind const CS0176 — 1 build cycle lost; no skill note on static/const x:Bind.
- Nullable warning wave — 2 edit passes; skill mentions `<Nullable>enable</Nullable>`
  only once, for a single App field, no general treatment.
- Malformed constructor edit (T29–T32) — ordinary edit slip.
- `winapp build` doesn't exist (T44–T45) — agent guessed a subcommand; self-corrected to
  dotnet build.

## Special APIs
- `CustomSensor` ported unchanged; hardware-gated → "No custom sensor found" is correct
  parity behavior with no CO2 sensor present.

## Env
- WinUI 3 screenshots blank (DirectComposition/PrintWindow capture limit) — eval
  artifact, not a defect.
