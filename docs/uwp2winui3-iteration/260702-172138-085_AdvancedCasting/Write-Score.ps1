$ErrorActionPreference='Stop'
$notes='C:\ado\win-dev-skills-benchmark\agent-benchmark\results\run6\001_score-AdvancedCasting\notes'
$cl=Get-Content "$notes\parity\baseline\checklist.json" -Raw|ConvertFrom-Json

$buildErr='Migrated WinUI 3 app FAILS to build (dotnet build/run). Errors: CS5001 "Program does not contain a static Main method suitable for an entry point"; WMC9999 XAML Internal Error "Object reference not set to an instance of an object" (Microsoft.UI.Xaml.Markup.Compiler pass 2, WMC1509 No LocalAssembly). Non-functional migration -> cannot launch or capture; every feature FAIL.'

# ---- rubric.json ----
$rubric=[ordered]@{
  scenario='AdvancedCasting'
  featureName=$cl.featureName
  source=$cl.source
  generated=(Get-Date).ToString('o')
  uwp_ground_truth='Original UWP app launched (Release/.NET Native, PID 12752, window "ScreenCasting C# Sample"); 6 scenarios confirmed live.'
  scenarios=@($cl.scenarios|ForEach-Object{[ordered]@{
    number=$_.number; title=$_.title; class=$_.class
    controls=@($_.controls|ForEach-Object{ "$($_.type)$(if($_.name){' name='+$_.name})$(if($_.label){' label="'+$_.label+'"'})" })
    expected_behavior='Selecting the scenario in the left nav loads its page; media/cast/DIAL controls operate as in UWP source (see .xaml.cs handlers).'
    pass_criteria='WinUI 3 page reachable by same nav title, renders non-blank, exposes the equivalent controls, and controls behave as the UWP handlers do.'
  }})
}
$rubric|ConvertTo-Json -Depth 8|Set-Content "$notes\rubric.json" -Encoding UTF8

# ---- rubric.md ----
$rm=New-Object System.Collections.Generic.List[string]
[void]$rm.Add('# AdvancedCasting (ScreenCasting) — UWP parity rubric')
[void]$rm.Add('')
[void]$rm.Add('Ground truth: original UWP app launched (Release/.NET Native), window "ScreenCasting C# Sample", 6 scenarios confirmed live.')
[void]$rm.Add('')
foreach($s in $cl.scenarios){
  [void]$rm.Add(('## Scenario {0} - {1}' -f $s.number,$s.title))
  [void]$rm.Add('- **Controls:** '+ (@($s.controls|ForEach-Object{"$($_.type)$(if($_.name){' '+$_.name})$(if($_.label){' "'+$_.label+'"'})"}) -join '; '))
  [void]$rm.Add('- **Pass:** reachable by same nav title, non-blank render, equivalent controls present and behaviorally live.')
  [void]$rm.Add('')
}
Set-Content "$notes\rubric.md" -Value $rm -Encoding UTF8

# ---- features + discrepancies ----
$features=@(); $disc=@()
foreach($s in $cl.scenarios){
  $shot=('parity/baseline/screenshots/{0:00}_{1}.png' -f $s.number,$s.slug)
  $features+=[ordered]@{
    name=$s.title; verdict='fail'; uwp_responded=$true; winui_responded=$false
    uwp_screenshot=$shot; winui_screenshot=$null
    note='Migrated WinUI 3 app does not build (CS5001 missing Main entry point + WMC9999 XAML compiler internal error); scenario cannot render or be actuated.'
  }
  $disc+=[ordered]@{
    scenario=$s.title; type='scenario-missing'
    detail='WinUI 3 build failure prevents this scenario from existing at runtime. Controls expected: '+ (@($s.controls|ForEach-Object{$_.type+($(if($_.name){' '+$_.name}))}) -join ', ')+'. None present in a running app because the app cannot launch.'
    severity='critical'
  }
}

# ---- discrepancies.json / .md ----
[ordered]@{
  scenario='AdvancedCasting'; summary=$buildErr
  behavioral_regressions=6; discrepancies=@($disc)
}|ConvertTo-Json -Depth 8|Set-Content "$notes\discrepancies.json" -Encoding UTF8

$dm=New-Object System.Collections.Generic.List[string]
[void]$dm.Add('# AdvancedCasting — parity discrepancies')
[void]$dm.Add('')
[void]$dm.Add('**Overall:** '+$buildErr)
[void]$dm.Add('')
[void]$dm.Add('| Scenario | Type | Severity | Detail |')
[void]$dm.Add('|---|---|---|---|')
foreach($d in $disc){ [void]$dm.Add('| '+$d.scenario+' | '+$d.type+' | '+$d.severity+' | '+($d.detail -replace '\|','/')+' |') }
Set-Content "$notes\discrepancies.md" -Value $dm -Encoding UTF8

# ---- migration-score.json (authoritative) ----
$total=$cl.scenarios.Count; $pass=0; $partial=0; $fail=$total
$score=[math]::Round(100.0*($pass+0.5*$partial)/$total)
[ordered]@{
  scenario='AdvancedCasting'
  uwp_launchable=$true
  score=$score
  features_total=$total
  features_pass=$pass
  features_partial=$partial
  features_fail=$fail
  uwp_capture_status='ok (with caveat): original UWP app built Release/.NET Native and launched (PID 12752, window "ScreenCasting C# Sample"); default view captured live (uwp_launch.png, scenario 1 playing "Big Buck Bunny"). The uwp-app-runner initially reported ok:false at build (mispackaged standalone sample: shared\ XAML folder missing -> restored) and then a false-negative launch verify, but the process was confirmed alive with a visible window and a real screenshot. Per-scenario navigation of the golden could NOT be automated: this .NET Native UWP CoreWindow exposes no inner UIA tree to winapp (invoke/search return 0 elements) and interactive foreground/mouse input is unavailable in this automation session (GetForegroundWindow=0; clicks intercepted by desktop/other windows), so the 6 per-scenario baseline frames are the initial view, not distinct navigations.'
  winui_capture_status='none: migrated WinUI 3 app fails to build (dotnet build & dotnet run), so it could not be launched or captured.'
  build_error=$buildErr
  parity_result=$null
  behavioral_regressions=6
  features=@($features)
}|ConvertTo-Json -Depth 8|Set-Content "$notes\migration-score.json" -Encoding UTF8

Write-Host "Wrote rubric.json/.md, discrepancies.json/.md, migration-score.json"
Write-Host "score=$score total=$total pass=$pass partial=$partial fail=$fail"