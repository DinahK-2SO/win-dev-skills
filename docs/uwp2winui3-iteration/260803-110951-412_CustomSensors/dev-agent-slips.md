# Dev-agent slips — will NOT change the skill

## 1. WMC9997 multiple root elements (Scenario1_DataEvents.xaml)
- Self-inflicted: an edit left trailing content → two XAML roots. The agent noted it
  ("The edit left trailing content") and rewrote the file next turn. Not a migration
  pattern; no skill text prevents an editing accident. slip_type: one-off-mistake.

## 2. Test-AppLaunch.ps1 'No build output under bin\x64\Debug'
- Caused by bare `dotnet build` (output under bin\Debug\<tfm>\win-x64). SKILL.md Step 3
  prominently prescribes `winapp build` for compilation; the validator's own smoke launch
  (same script) passed, proving the tool works when guidance is followed. Recoverable and
  recovered via dotnet run. slip_type: read-but-ignored.
