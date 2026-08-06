# Skill defects

1. **Linked project items were absent from bootstrap source closure.** The project linked its shared App/MainPage/Styles/assets, but the script copied only the physical source subtree. Fix the bootstrap so linked items enter every downstream migration stage.
2. **Desktop shell identity and initial geometry were unspecified.** Require the source display name as the window title and preserve an explicit or minimum non-clipping client viewport.
3. **Empty deferred-list sentinels conflicted.** The bootstrap wrote `(none)` while the validator expected `No items deferred.`; use one canonical value.
