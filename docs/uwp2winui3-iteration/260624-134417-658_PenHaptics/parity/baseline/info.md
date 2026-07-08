# PenHaptics C# Sample — behavioral baseline

Derived from UWP source by Extract-UwpFeatureChecklist.ps1. Each scenario below
is a feature point the migrated WinUI 3 app must preserve. Screenshots (when
captured) live in `screenshots/` named `NN_<slug>.png`.

## Scenario 1 - Ink Canvas Tactile Feedback

- **Screenshot:** `screenshots/01_Ink_Canvas_Tactile_Feedback.png`
- **Page class:** `Scenario1_InkCanvasTactileFeedback`
- **UI elements:**
  - InkCanvas, name=appInkCanvas
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario1_InkCanvasTactileFeedback.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 2 - Query Tactile Feedback Support

- **Screenshot:** `screenshots/02_Query_Tactile_Feedback_Support.png`
- **Page class:** `Scenario2_SupportedTactileFeedback`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario2_SupportedTactileFeedback.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 3 - Inking Feedback

- **Screenshot:** `screenshots/03_Inking_Feedback.png`
- **Page class:** `Scenario3_InkingFeedback`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario3_InkingFeedback.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

## Scenario 4 - Interaction Feedback

- **Screenshot:** `screenshots/04_Interaction_Feedback.png`
- **Page class:** `Scenario4_InteractionFeedback`
- **UI elements:**
  - Button, label="Send Interaction Feedback"
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario4_InteractionFeedback.xaml.cs`)_
- **Interactions to test (click/toggle, then check output):**
  - Send Interaction Feedback "Send Interaction Feedback" (Button)
- **Output elements:** StatusBorder, StatusBlock

## Scenario 5 - Inking and Interaction Feedback

- **Screenshot:** `screenshots/05_Inking_and_Interaction_Feedback.png`
- **Page class:** `Scenario5_InkingAndInteractionFeedback`
- **UI elements:**
  - _(no named/interactive controls detected — verify visually)_
- **Code behavior:** _(verify the page's handlers produce the analogous result; see source `Scenario5_InkingAndInteractionFeedback.xaml.cs`)_
- **Output elements:** StatusBorder, StatusBlock

