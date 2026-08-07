# Dev-agent slips

1. **Deferred scenario cleanup was incomplete.** The skill prominently requires deferred files to be excluded from build and navigation, but type references and manually added XAML remained temporarily.
2. **Manual reconstruction introduced ordinary compiler errors.** These were direct, local mistakes resolved from compiler diagnostics; the general fix is the linked-file bootstrap defect, not more prose for each error.
