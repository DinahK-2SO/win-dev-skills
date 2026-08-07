# TextSegmentation migration lessons

- **Helpful:** the bootstrap produced structured migration artifacts after rerun; the validator precisely found manifest, build, and startup failures; `dotnet build` was reliable; event 1026 exposed the real startup HRESULT and stack.
- **Tool defects:** the bootstrap omitted 15 external linked inputs, `winapp build` did not exist, and the launch helper hid managed HRESULT `0x8001010E` behind outer code `0xe0434352`.
- **Main struggle:** omission of linked shared content forced manual shell reconstruction and caused namespace/XAML build errors.
- **Runtime blocker:** the final app built cleanly but every launch failed in generated `Program.Main -> Application.Start`; no migrated frame or proven fix existed.
- **Reusable rule:** when startup failure never enters migrated code, compare an untouched scaffold with identical TFM/package versions before modifying pages or startup behavior.

See `lessons.json` for the complete error-to-root-cause-to-fix inventory.
