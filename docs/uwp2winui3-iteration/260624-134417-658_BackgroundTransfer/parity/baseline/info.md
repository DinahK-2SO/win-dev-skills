# BackgroundTransfer — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - File Download

- **Screenshot:** `screenshots/01_File_Download.png`
- **Page class:** `Scenario1_Download`
- **UI elements:**
  - TextBox, name=serverAddressField, label="http://localhost/BackgroundTransferSample/download.aspx"
  - TextBox, name=fileNameField, label="DownloadedFile.txt"
  - Button, name=StartDownloadButton, label="Start Download"
  - Button, name=StartHighPriorityDownloadButton, label="Start High Priority Download"
  - Button, name=PauseAllButton, label="Pause All"
  - Button, name=ResumeAllButton, label="Resume All"
  - Button, name=CancelAllButton, label="Cancel All"
  - TextBox, name=outputField
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_Download.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start Download "Start Download" (Button)
  - Start High Priority Download "Start High Priority Download" (Button)
  - Pause All "Pause All" (Button)
  - Resume All "Resume All" (Button)
  - Cancel All "Cancel All" (Button)
- **Output elements:** InputTextBlock1, serverAddressField, fileNameField, outputField, StatusBorder, StatusBlock

## Scenario 2 - File Upload

- **Screenshot:** `screenshots/02_File_Upload.png`
- **Page class:** `Scenario2_Upload`
- **UI elements:**
  - TextBox, name=serverAddressField, label="http://localhost/BackgroundTransferSample/Upload.aspx"
  - Button, name=StartUploadButton, label="Start Upload"
  - Button, name=StartMultipartUploadButton, label="Start Multipart Upload"
  - Button, name=CancelAllButton, label="Cancel All"
  - TextBox, name=outputField
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_Upload.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start Upload "Start Upload" (Button)
  - Start Multipart Upload "Start Multipart Upload" (Button)
  - Cancel All "Cancel All" (Button)
- **Output elements:** InputTextBlock1, serverAddressField, outputField, StatusBorder, StatusBlock

## Scenario 3 - Completion Notifications

- **Screenshot:** `screenshots/03_Completion_Notifications.png`
- **Page class:** `Scenario3_Notifications`
- **UI elements:**
  - TextBox, name=serverAddressField, label="http://localhost/BackgroundTransferSample/notifications.aspx"
  - Button, name=ToastNotificationButton, label="Start three downloads and show toast on completion"
  - Button, name=TileNotificationButton, label="Start three downloads and update tile on completion"
  - TextBox, name=outputField
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_Notifications.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start three downloads and show toast on completion "Start three downloads and show toast on completion" (Button)
  - Start three downloads and update tile on completion "Start three downloads and update tile on completion" (Button)
- **Output elements:** InputTextBlock1, serverAddressField, outputField, StatusBorder, StatusBlock

## Scenario 4 - Completion Groups

- **Screenshot:** `screenshots/04_Completion_Groups.png`
- **Page class:** `Scenario4_CompletionGroups`
- **UI elements:**
  - TextBox, name=serverAddressField, label="http://localhost/BackgroundTransferSample/bitmap.aspx"
  - Button, name=StartDownloadsButton, label="Start ten downloads in a completion group"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_CompletionGroups.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start ten downloads in a completion group "Start ten downloads in a completion group" (Button)
- **Output elements:** InputTextBlock1, serverAddressField, SubstatusBlock, StatusBorder, StatusBlock

## Scenario 5 - Random Access Downloads

- **Screenshot:** `screenshots/05_Random_Access_Downloads.png`
- **Page class:** `Scenario5_RandomAccess`
- **UI elements:**
  - TextBox, name=serverAddressField, label="http://localhost/BackgroundTransferSample/randomAccess.aspx"
  - TextBox, name=fileNameField, label="RandomAccessFile.txt"
  - Button, name=startDownloadButton, label="Start"
  - Button, name=pauseDownloadButton, label="Pause"
  - Button, name=resumeDownloadButton, label="Resume"
  - Slider, name=seekSlider, label="Seek to position (MB)"
  - Button, name=seekDownloadButton, label="Seek"
  - Slider, name=currentPositionSlider, label="Current read position (MB)"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario5_RandomAccess.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start "Start" (Button)
  - Pause "Pause" (Button)
  - Resume "Resume" (Button)
  - Seek "Seek" (Button)
- **Output elements:** inputTextBlock1, serverAddressField, fileNameField, DownloadedInfoText, DownloadedStatusText, DownloadedRangesText, PreviousReadText, CurrentReadText, StatusBorder, StatusBlock

## Scenario 6 - Recoverable Errors

- **Screenshot:** `screenshots/06_Recoverable_Errors.png`
- **Page class:** `Scenario6_RecoverableErrors`
- **UI elements:**
  - TextBox, name=serverAddressField, label="http://localhost/BackgroundTransferSample/recoverableErrors.aspx?shouldExpire=yes"
  - TextBox, name=fileNameField, label="RecoverableErrorsFile.txt"
  - CheckBox, name=configureRecoverableErrorsCheckBox, label="Recover from expired URL"
  - Button, name=startDownloadButton, label="Start"
  - TextBox, label="1234"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario6_RecoverableErrors.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start "Start" (Button)
- **Output elements:** serverAddressField, fileNameField, DownloadedInfoText, DownloadedStatusText, StatusBorder, StatusBlock

## Scenario 7 - Download Reordering

- **Screenshot:** `screenshots/07_Download_Reordering.png`
- **Page class:** `Scenario7_DownloadReordering`
- **UI elements:**
  - TextBox, name=remoteAddressField, label="http://localhost/BackgroundTransferSample/download.aspx"
  - TextBox, name=fileNameField, label="DownloadReordering.txt"
  - Button, name=startDownloadButton, label="Start Download"
  - Button, label="Make Current"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario7_DownloadReordering.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start Download "Start Download" (Button)
  - Make Current "Make Current" (Button)
- **Output elements:** InputTextBlock1, remoteAddressField, fileNameField, StatusBorder, StatusBlock

