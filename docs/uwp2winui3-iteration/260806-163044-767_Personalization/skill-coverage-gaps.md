# Skill coverage gaps

- **Serial command execution was under-emphasized:** The numbered bootstrap and build/launch loop implied order but did not explicitly prohibit batching. The agent raced scaffold/bootstrap/self-check and later overlapped run/build/validation, causing restore and XAML intermediate-file contention. The workflow should require awaiting each dependent command.
