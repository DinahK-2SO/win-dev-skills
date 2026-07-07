# MobileBroadband — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Mobile Broadband Device

- **Screenshot:** `screenshots/01_Mobile_Broadband_Device.png`
- **Page class:** `BroadbandDevice`
- **UI elements:**
  - Button, name=UpdateData, label="Get Next Device Information", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `BroadbandDevice.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Next Device Information "Get Next Device Information" (Button)
- **Output elements:** InputTextBlock1, NumDevices, ProviderName, ProviderGuid, NetworkAccountId, NetRegister, NetRegError, PacketAttachError, ActivateError, AccessPointName, RegisteredProviderName, RegisteredProviderId, RegisteredDataClass, NetworkAdapterId, NetworkType, DeviceManufacturer, DeviceModel, Firmware, CellularClasses, DataClasses, MobileNumber, SimId, DeviceType, DeviceId, NetworkDeviceStatus, MobEquipIdLabel, MobEquipIdValue, SubIdLabel, SubIdValue, StatusBorder, StatusBlock

## Scenario 2 - Network Account Watcher

- **Screenshot:** `screenshots/02_Network_Account_Watcher.png`
- **Page class:** `AccountWatcher`
- **UI elements:**
  - Button, name=StartMonitoring, label="Start", events=Click
  - Button, name=StopMonitoring, label="Stop", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `AccountWatcher.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Start "Start" (Button)
  - Stop "Stop" (Button)
- **Output elements:** InputTextBlock1, WatcherOutput, StatusBorder, StatusBlock

## Scenario 3 - Connection UI

- **Screenshot:** `screenshots/03_Connection_UI.png`
- **Page class:** `ShowConnection`
- **UI elements:**
  - Button, name=ShowConnectionUI, label="Get Next Device Information", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `ShowConnection.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Next Device Information "Get Next Device Information" (Button)
- **Output elements:** InputTextBlock1, StatusBorder, StatusBlock

## Scenario 4 - Get Connection Profiles

- **Screenshot:** `screenshots/04_Get_Connection_Profiles.png`
- **Page class:** `GetConnectionProfiles`
- **UI elements:**
  - Button, name=GetConnectionProfilesButton, label="Get Connection Profiles", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `GetConnectionProfiles.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Connection Profiles "Get Connection Profiles" (Button)
- **Output elements:** InputTextBlock1, StatusBorder, StatusBlock

## Scenario 5 - Modem information (New)

- **Screenshot:** `screenshots/05_Modem_information_New.png`
- **Page class:** `ModemInformation`
- **UI elements:**
  - Button, label="Refresh Modem Information", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `ModemInformation.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Refresh Modem Information "Refresh Modem Information" (Button)
- **Output elements:** InputTextBlock1, StatusBorder, StatusBlock

## Scenario 6 - Device Services (New)

- **Screenshot:** `screenshots/06_Device_Services_New.png`
- **Page class:** `ModemDeviceServices`
- **UI elements:**
  - Button, label="Get DeviceService", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `ModemDeviceServices.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get DeviceService "Get DeviceService" (Button)
- **Output elements:** InputTextBlock1, StatusBorder, StatusBlock

## Scenario 7 - SIM Card (New)

- **Screenshot:** `screenshots/07_SIM_Card_New.png`
- **Page class:** `SimCard`
- **UI elements:**
  - Button, label="Get SIM Card Information", events=Click
  - ListBox, name=listUiccApps, events=SelectionChanged
  - Button, label="Get Iccid Record Information", events=Click
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `SimCard.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get SIM Card Information "Get SIM Card Information" (Button)
  - Get Iccid Record Information "Get Iccid Record Information" (Button)
- **Output elements:** InputTextBlock1, StatusBorder, StatusBlock

