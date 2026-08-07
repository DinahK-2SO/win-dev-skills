# Skill defects

1. **External linked inputs absent from bootstrap.** The UWP project linked 15 shared files outside `Source`, but the mapping contained only four files. Fix: import `<Link>` items into bootstrap mapping and triage.
2. **Invalid build command.** `SKILL.md` required `winapp build`, which this CLI does not implement. Fix: use `dotnet build`.
3. **Wrong startup diagnosis.** The helper hid managed HRESULT `0x8001010E`, while prose dismissed an entry-point-only stack. Fix: prefer the managed HRESULT and compare an untouched scaffold when no migrated frame appears.
