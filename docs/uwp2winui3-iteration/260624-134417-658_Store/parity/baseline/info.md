# Store C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Trial-mode

- **Screenshot:** `screenshots/01_Trial_mode.png`
- **Page class:** `Scenario1_TrialMode`
- **UI elements:**
  - Button, label="Show trial period information"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_TrialMode.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Show trial period information "Show trial period information" (Button)
- **Output elements:** LicenseMode, PurchasePrice, StatusBorder, StatusBlock

## Scenario 2 - In-app purchase

- **Screenshot:** `screenshots/02_In_app_purchase.png`
- **Page class:** `Scenario2_InAppPurchase`
- **UI elements:**
  - Button, name=GetAssociatedProductsButton, label="Get Associated Add-Ons"
  - Button, name=PurchaseAddOnButton, label="Purchase Selected Add-On"
  - ListView, name=ProductsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_InAppPurchase.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Associated Add-Ons "Get Associated Add-Ons" (Button)
  - Purchase Selected Add-On "Purchase Selected Add-On" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 3 - Unmanaged consumable product

- **Screenshot:** `screenshots/03_Unmanaged_consumable_product.png`
- **Page class:** `Scenario3_UnmanagedConsumable`
- **UI elements:**
  - Button, name=GetUnManagedConsumablesButton, label="Get Associated Add-Ons"
  - Button, name=PurchaseAddOnButton, label="Purchase Selected Consumable"
  - Button, name=GetConsumableBalanceButton, label="Get Consumable Balance"
  - Button, name=FulfillConsumableButton, label="Fulfill Consumable"
  - ListView, name=ProductsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_UnmanagedConsumable.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Associated Add-Ons "Get Associated Add-Ons" (Button)
  - Purchase Selected Consumable "Purchase Selected Consumable" (Button)
  - Get Consumable Balance "Get Consumable Balance" (Button)
  - Fulfill Consumable "Fulfill Consumable" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 4 - Managed consumable product

- **Screenshot:** `screenshots/04_Managed_consumable_product.png`
- **Page class:** `Scenario4_ConsumableProduct`
- **UI elements:**
  - Button, name=GetManagedConsumablesButton, label="Get Associated Add-Ons"
  - Button, name=PurchaseAddOnButton, label="Purchase Selected Consumable"
  - Button, name=GetConsumableBalanceButton, label="Get Consumable Balance"
  - Button, name=FulfillConsumableButton, label="Fulfill Consumable"
  - ComboBox, name=QuantityComboBox
  - ListView, name=ProductsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_ConsumableProduct.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Associated Add-Ons "Get Associated Add-Ons" (Button)
  - Purchase Selected Consumable "Purchase Selected Consumable" (Button)
  - Get Consumable Balance "Get Consumable Balance" (Button)
  - Fulfill Consumable "Fulfill Consumable" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 5 - User collection

- **Screenshot:** `screenshots/05_User_collection.png`
- **Page class:** `Scenario5_UserCollection`
- **UI elements:**
  - Button, name=GetUserCollectionButton, label="Get User Collection"
  - ListView, name=ProductsListView
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario5_UserCollection.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get User Collection "Get User Collection" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 6 - App listing URI

- **Screenshot:** `screenshots/06_App_listing_URI.png`
- **Page class:** `Scenario6_AppListingURI`
- **UI elements:**
  - Button, label="Rate this app"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario6_AppListingURI.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Rate this app "Rate this app" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 7 - Business to Business

- **Screenshot:** `screenshots/07_Business_to_Business.png`
- **Page class:** `Scenario7_B2B`
- **UI elements:**
  - Button, label="Get Customer Collections Id"
  - Button, label="Get Customer Purchase Id"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario7_B2B.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Get Customer Collections Id "Get Customer Collections Id" (Button)
  - Get Customer Purchase Id "Get Customer Purchase Id" (Button)
- **Output elements:** Output, StatusBorder, StatusBlock

