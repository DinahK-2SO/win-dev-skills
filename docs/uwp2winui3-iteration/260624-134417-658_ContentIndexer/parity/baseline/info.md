# Content indexer C# sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Add item to the index using the ContentIndexer

- **Screenshot:** `screenshots/01_Add_item_to_the_index_using_the_ContentIndexer.png`
- **Page class:** `S1_AddWithAPI`
- **UI elements:**
  - TextBox, name=ItemKeyInput, label="TestKey"
  - TextBox, name=NameInput, label="Test Name"
  - TextBox, name=KeywordsInput, label="keyword1; keyword2; keyword3"
  - TextBox, name=CommentInput, label="This is a test comment"
  - TextBox, name=ContentInput, label="This is test content."
  - TextBox, name=LanguageInput, label="en-US"
  - Button, name=AddToIndexButton
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `S1_AddWithAPI.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - AddToIndexButton (Button)
- **Output elements:** ItemKeyInput, NameInput, KeywordsInput, CommentInput, ContentInput, LanguageInput, StatusBorder, StatusBlock

## Scenario 2 - Update and delete indexed items using the ContentIndexer

- **Screenshot:** `screenshots/02_Update_and_delete_indexed_items_using_the_ContentIndexer.png`
- **Page class:** `S2_UpdateAndDeleteWithAPI`
- **UI elements:**
  - TextBox, name=ItemNameInput, label="Test Name"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `S2_UpdateAndDeleteWithAPI.xaml.cs`)_
- **Output elements:** ItemNameInput, StatusBorder, StatusBlock

## Scenario 3 - Retrieve indexed items added using the ContentIndexer

- **Screenshot:** `screenshots/03_Retrieve_indexed_items_added_using_the_ContentIndexer.png`
- **Page class:** `S3_RetrieveWithAPI`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `S3_RetrieveWithAPI.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 4 - Check the index revision number

- **Screenshot:** `screenshots/04_Check_the_index_revision_number.png`
- **Page class:** `S4_CheckIndexRevision`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `S4_CheckIndexRevision.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 5 - Add indexed items by using appcontent-ms files

- **Screenshot:** `screenshots/05_Add_indexed_items_by_using_appcontent_ms_files.png`
- **Page class:** `S5_AddWithAppContent`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `S5_AddWithAppContent.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 6 - Delete indexed appcontent-ms files

- **Screenshot:** `screenshots/06_Delete_indexed_appcontent_ms_files.png`
- **Page class:** `S6_DeleteWithAppContent`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `S6_DeleteWithAppContent.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 7 - Retrieve indexed properties from appcontent-ms files

- **Screenshot:** `screenshots/07_Retrieve_indexed_properties_from_appcontent_ms_files.png`
- **Page class:** `S7_RetrieveWithAppContent`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `S7_RetrieveWithAppContent.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

