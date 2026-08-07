# Skill defects - Package

- **Data-bound NavigationView recipe was structurally wrong.** The generated shell
  nested an item container, selection highlighted, and `ItemInvoked` silently skipped
  navigation. Correct the XAML recipe and reject this form in the validator.
