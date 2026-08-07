# Skill defects

- **External linked files absent:** bootstrap ignored csproj-linked shared shell/resources, causing the manual namespace and XAML error cascade.
- **Wrong build/tool assumptions:** `winapp build` was unavailable and launch discovery excluded `bin\Debug`.
- **Suspension lifecycle absent:** no inventory rule or pattern explained that WinUI 3 desktop has no UWP suspension event.
