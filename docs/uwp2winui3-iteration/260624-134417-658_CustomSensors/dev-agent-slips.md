# Dev-agent slips — CustomSensors (NO skill change)

## 1. `winapp build` (non-existent subcommand)
- T44 `'build' was not matched`; T45 self-corrected to the dotnet build the validator
  already ran. Skill correctly prescribes native `dotnet build`; agent invented the
  subcommand. One-off; re-run would avoid it.

## 2. Malformed constructor edit (T29–T32)
- Agent broke and then restored a constructor while editing. Pure edit mechanics, no
  migration-knowledge topic; not preventable by skill content.
