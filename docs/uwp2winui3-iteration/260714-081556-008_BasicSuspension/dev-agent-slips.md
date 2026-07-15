# BasicSuspension — dev-agent-slips (will NOT change skill)

## 1. Filtered `dotnet build` appeared to hang
- Agent piped the build through `Select-String`; output buffered and looked stuck for
  3x120s before it stopped the shell and re-ran unfiltered (Turns 16-20, build then
  succeeded). Command-shaping choice, not missing skill content.

## 2. Self-inflicted duplicated code block in App.xaml.cs
- The first edit left a duplicated trailing block; the agent cleaned it up in Turn 15.
  General editing hygiene, unrelated to migration knowledge.
