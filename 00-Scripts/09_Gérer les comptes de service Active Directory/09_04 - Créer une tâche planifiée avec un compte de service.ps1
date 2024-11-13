
$Action = New-ScheduledTaskAction "powershell.exe" -Argument "-f powershell.exe"
$Declencheur = New-ScheduledTaskTrigger -At 23:00 -Daily
$CompteMSA = New-ScheduledTaskPrincipal -UserID lab.lan\svc-test$ -LogonType Password -RunLevel Highest

Register-ScheduledTask test-msa –Action $Action –Trigger $Declencheur –Principal $CompteMSA


