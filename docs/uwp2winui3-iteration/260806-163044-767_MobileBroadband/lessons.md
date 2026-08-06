# MobileBroadband lessons

- **Bootstrap worked for local files and API TODOs**, but its filesystem-only copy missed every linked shared shell/resource/asset item declared by the UWP project.
- **Linked project items are source.** Omitting them forced roughly 15 turns of manual App/MainPage/Styles reconstruction and asset copying.
- **The threading anchor was accurate:** the watcher callback migrated from the legacy dispatcher to `DispatcherQueue.TryEnqueue`.
- **The validator was effective:** it caught 16 unfinished ledger rows and later proved clean residue, TODO, build, analyzer, and launch gates.
- **Two agent slips needed no new guidance:** launching with bare `dotnet run` and leaving mapping rows at `copied` were already clearly prohibited.
- **Script contract bug:** the bootstrap's `(none)` deferred row did not match the validator's `No items deferred.` sentinel.
- **Hardware absence is normal for device samples:** retain visible unavailable/error states instead of deleting or silently disabling the feature.
