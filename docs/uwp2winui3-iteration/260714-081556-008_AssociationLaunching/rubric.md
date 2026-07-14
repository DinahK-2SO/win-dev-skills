# Rubric — AssociationLaunching (Association Launching C# Sample)

Ground truth derived from the UWP source and the live UWP golden capture. Each
feature is graded on structural coverage, behavioral liveness, and visual fidelity.

## Scenario 1 — Launching a file
Controls: Launch default handler, Launch Open With, Pick and launch, Launch with
warning, view-size preference ComboBox (Default), Launch with view preference.
Expected: launch a .png with the default handler; Open With; pick & launch a file;
warn before launching; launch with a view-size preference.

## Scenario 2 — Launching a URI
Controls: URI TextBox (default `http://www.bing.com`), Launch default handler,
Launch Open With, Launch with warning, view-size preference ComboBox, Launch with
view preference. Expected: launch the entered URI via those paths.

## Scenario 3 — Receiving a file
Controls: Create test file, Create test file with no file extension, Remove test
files. Expected: create/remove `.alsdkcs` test files in the Pictures library.

## Scenario 4 — Receiving a URI
No interactive controls — informational page about custom URI-scheme / AppUriHandler
activation.

## Scoring
`score = round(100 * (pass + 0.5*partial) / features_total)`; 0 if the app cannot run.
