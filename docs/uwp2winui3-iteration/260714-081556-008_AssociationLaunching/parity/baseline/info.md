# Association Launching C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Launching a file

- **Screenshot:** `screenshots/01_Launching_a_file.png`
- **Page class:** `Scenario1_LaunchFile`
- **UI elements:**
  - Button, label="Launch default handler"
  - Button, label="Launch Open With"
  - Button, label="Pick and launch"
  - Button, label="Launch with warning"
  - ComboBox, name=ViewPreference
  - Button, label="Launch with view preference"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_LaunchFile.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Launch default handler "Launch default handler" (Button)
  - Launch Open With "Launch Open With" (Button)
  - Pick and launch "Pick and launch" (Button)
  - Launch with warning "Launch with warning" (Button)
  - Launch with view preference "Launch with view preference" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Launching a URI

- **Screenshot:** `screenshots/02_Launching_a_URI.png`
- **Page class:** `Scenario2_LaunchUri`
- **UI elements:**
  - TextBox, name=UriToLaunch, label="http://www.bing.com"
  - Button, label="Launch default handler"
  - Button, label="Launch Open With"
  - Button, label="Launch with warning"
  - ComboBox, name=ViewPreference
  - Button, label="Launch with view preference"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_LaunchUri.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Launch default handler "Launch default handler" (Button)
  - Launch Open With "Launch Open With" (Button)
  - Launch with warning "Launch with warning" (Button)
  - Launch with view preference "Launch with view preference" (Button)
- **Output elements:** UriToLaunch, StatusBorder, StatusBlock

## Scenario 3 - Receiving a file

- **Screenshot:** `screenshots/03_Receiving_a_file.png`
- **Page class:** `Scenario3_ReceiveFile`
- **UI elements:**
  - Button, label="Create test file"
  - Button, label="Create test file with no file extension"
  - Button, label="Remove test files"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_ReceiveFile.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Create test file "Create test file" (Button)
  - Create test file with no file extension "Create test file with no file extension" (Button)
  - Remove test files "Remove test files" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 4 - Receiving a URI

- **Screenshot:** `screenshots/04_Receiving_a_URI.png`
- **Page class:** `Scenario4_ReceiveUri`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_ReceiveUri.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

