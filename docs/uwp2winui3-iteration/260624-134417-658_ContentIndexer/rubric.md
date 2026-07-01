# Parity Rubric — ContentIndexer (UWP → WinUI 3)

Feature: **Content indexer C# sample** — 7 scenarios. Grading:
`score = round(100 * (pass + 0.5*partial) / 7)`.

| # | Scenario | Expected controls | Expected behavior |
|---|----------|-------------------|-------------------|
| 1 | Add item to the index using the ContentIndexer | 6 input TextBoxes + AddToIndexButton | Add an item to the Windows Search Index and report status |
| 2 | Update and delete indexed items using the ContentIndexer | Add + ItemNameInput + Update/DeleteKeywords/DeleteSingle/DeleteMultiple/DeleteAll buttons | Update a property, delete a property, delete single/multiple/all items |
| 3 | Retrieve indexed items added using the ContentIndexer | Add + RetrieveAll + RetrieveMatching buttons | Query the index ("*" / "0") and list results (system-indexer gated) |
| 4 | Check the index revision number | CheckIndexRevisionButton | Compare tracked vs reported revision number |
| 5 | Add indexed items by using appcontent-ms files | AddToIndexButton | Copy appcontent-ms files into the Indexed folder |
| 6 | Delete indexed appcontent-ms files | Add + DeleteSingle + DeleteAll buttons | Add then delete appcontent-ms files from the Indexed folder |
| 7 | Retrieve indexed properties from appcontent-ms files | Add + RetrieveAll + RetrieveMatching buttons | Retrieve indexed properties (system-indexer gated) |

Note: the automated checklist extractor under-counted controls for scenarios 3–7 (recorded 0),
but the actual UWP source and the migrated WinUI app both contain the buttons listed above.
The rubric reflects the true source controls.
