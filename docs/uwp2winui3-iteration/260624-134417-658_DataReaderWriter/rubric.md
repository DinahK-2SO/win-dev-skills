# UWP Parity Rubric — DataReader/Writer Sample

Scenario name: **DataReaderWriter**
Original UWP source: `uwp-samples-standalone/Samples/DataReaderWriter/cs` (+ shared XAML)

The migrated WinUI 3 app must faithfully replicate both scenarios below. Controls
live in the sibling `shared\*.xaml` files (the auto-extractor only scans `cs\`, so it
reported 0 controls; the real controls were recovered by reading the shared XAML).

## Scenario 1 — Read and write simple structured data.
- **Control:** `SendButton` — Button "Copy Strings" (Click → `TransferData`)
- **Static input:** `ElementsToWrite` → `Hello;World;1 2 3 4 5;Très bien!;Goodbye`
- **Output:** `ElementsRead` (TextBlock)
- **Expected behavior:** Clicking *Copy Strings* writes the strings to a memory-backed
  stream via `DataWriter`, then reads them back with `DataReader`, displaying each
  string on its own line.

## Scenario 2 — Dump file contents using ReadBytes().
- **Control:** `HexDumpButton` — Button "Hex Dump" (Click → `HexDump`)
- **Output:** `ReadBytesOutput` (monospaced TextBlock)
- **Expected behavior:** Clicking *Hex Dump* opens a sequential-access stream over the
  bundled PNG image, calls `ReadBytes()`, and renders an offset+hex column dump.

## Pass criteria
Each scenario passes only if its control is present **and** actuating it produces the
correct output (behavioral parity), matching the UWP layout.
