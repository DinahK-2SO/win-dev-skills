# Rubric — AppServices (App service client sample)

Ground truth derived from the original UWP source (`AppServicesClient` + shared scenario XAML)
and the live UWP app (launched via uwp-app-runner, PID 2956, window "App Service Client C# sample").

## Scenario 1 — Open/Close Connection
- **Controls:** Minimum Value (TextBox, "0"), Maximum Value (TextBox, "10"), Result (TextBlock).
- **Action:** Generate Random Number (Button) → opens a connection, requests a random number in
  [min,max], displays it in Result, then closes the connection.

## Scenario 2 — Keep Connection Open
- **Controls:** Minimum Value (TextBox, "0"), Maximum Value (TextBox, "10"), Result (TextBlock).
- **Actions:** Open Connection (Button), Close Connection (Button), Generate Random Number (Button).
  Generate requires an open connection; otherwise it must report that a connection is needed first.

## Scoring
`score = round(100 * (pass + 0.5*partial) / features_total)`; a control that is present but dead
(responded in UWP, not in WinUI) is at best `partial`.
