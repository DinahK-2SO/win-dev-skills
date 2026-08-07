# Skill coverage gaps

- **Generated entry-point provenance was ambiguous:** a crash stack ending at `Program.Main` can name SDK-generated code. When `Application.Start` fails before its callback, compare a pristine same-version scaffold before changing app code or disabling generated `Main`.
