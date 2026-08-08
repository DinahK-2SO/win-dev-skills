# XamlDeferLoadStrategy discrepancies

The migrated packaged app failed during `dotnet run`: activation reported PID 89824, then the command exited with `-1073741189` (`0xC000027B`). No WinUI 3 feature frame or behavioral result was available.

## Basic Deferral — FAIL

The deferred grid, Realize Elements control, and click behavior could not be captured or compared because the candidate did not remain running.

## Adaptive Deferral — FAIL

The account, mail, and reading panes and Send action could not be captured or compared because the candidate did not remain running.

## Control Template Deferral — FAIL

The conditional header template part and two images could not be captured or compared because the candidate did not remain running.
