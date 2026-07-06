# Dev-agent slips — LampDevice (no skill change)

## 1. DataTemplate x:Bind / x:DataType errors (WMC0909 / WMC1111)
- **Self-inflicted:** the original UWP MainPage used plain `{Binding Title}`; the migrated
  file used `{x:Bind Title}` + `x:DataType="local:Scenario"`, which failed to resolve.
- **Evidence:** session-log.txt:2816-2818 (errors); original `{Binding Title}` at
  obj/x64/Release/MainPage.xaml:35-38; agent reverted at :2841.
- **Why no skill change:** faithful reproduction of the original markup avoids it entirely;
  a capable re-run gets it right without any skill edit.
