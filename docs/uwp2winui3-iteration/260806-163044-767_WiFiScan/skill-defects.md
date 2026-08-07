# Skill defects

- **Linked project items absent:** bootstrap ignored external `Include` + `Link` items,
  causing lost theme/layout fidelity and a missing dictionary crash. General fix:
  materialize the UWP project item graph before inventory.
- **Launch layout discovery wrong:** `-Target` assumed `bin\x64\Debug`; search complete
  layouts recursively under `bin`.
- **Nullable migration pattern absent:** add focused `CS86xx` lifecycle guidance without
  disabling nullable analysis.
- **`0xc000027b` guidance wrong:** check deployed XAML dictionaries/resources before
  suggesting unsupported API deferral.
