# ScreenCasting — behavioral baseline (corrected: 6 scenarios)

Original UWP app confirmed live (6 scenarios). NOTE: Extract-UwpFeatureChecklist.ps1 statically matched only the typeof() fallback branch (1 scenario); the running app uses the DevicePicker-present branch with 6 scenarios, reconstructed here to match ground truth.

## Scenario 1 - 1 - Media Element Casting 101
- **Screenshot:** `screenshots/01_1_Media_Element_Casting_101.png`
- **Page class:** `Scenario01`
- **UI elements:**
  - MediaElement, name=player

## Scenario 2 - 2 - Casting APIs and a Custom Cast Button
- **Screenshot:** `screenshots/02_2_Casting_APIs_and_a_Custom_Cast_Button.png`
- **Page class:** `Scenario02`
- **UI elements:**
  - MediaElement, name=player

## Scenario 3 - 3 - DIAL Sender Universal Windows app
- **Screenshot:** `screenshots/03_3_DIAL_Sender_Universal_Windows_app.png`
- **Page class:** `Scenario03`
- **UI elements:**
  - MediaElement, name=player
  - TextBox, label="DIAL Application Name:"
  - TextBox, label="DIAL Launch Arguments:"

## Scenario 4 - 4 - DIAL Receiver Windows Universal app
- **Screenshot:** `screenshots/04_4_DIAL_Receiver_Windows_Universal_app.png`
- **Page class:** `Scenario04`
- **UI elements:**
  - MediaElement, name=player

## Scenario 5 - 5 - Multi-View Media Application
- **Screenshot:** `screenshots/05_5_Multi_View_Media_Application.png`
- **Page class:** `Scenario05`
- **UI elements:**
  - MediaElement, name=player

## Scenario 6 - 6 - Combine Casting Methods
- **Screenshot:** `screenshots/06_6_Combine_Casting_Methods.png`
- **Page class:** `Scenario06`
- **UI elements:**
  - MediaElement, name=player
  - TextBox, label="DIAL Application Name:"
  - TextBox, label="DIAL Launch Arguments:"

