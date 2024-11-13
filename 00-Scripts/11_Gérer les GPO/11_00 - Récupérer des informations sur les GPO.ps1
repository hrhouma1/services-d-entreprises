Get-GPO -All


Get-GPO -Name "Default Domain Policy" 


Get-GPO -Guid "31B2F340-016D-11D2-945F-00C04FB984F9"


Get-GPOReport -Name "Default Domain Policy" -ReportType HTML -Path "c:\rapportGPO.html"


Get-GPOReport -All -ReportType HTML -Path "c:\rapportGPO.html"


Get-GPOReport -Name "Default Domain Policy" -ReportType Xml -Path "c:\rapportGPO.xml"


Get-GPStarterGPO -All


Get-GPStarterGPO -Name "testGPOStarter"


Get-GPPermission -Name "Default Domain Policy" -TargetName "Admins du domaine" -TargetType Group 


Get-GPPermission -Name "Default Domain Policy" -TargetName "Utilisateurs authentifiés" -TargetType user 


Get-GPInheritance -Target "OU=OUTest,DC=lab,DC=lan" 


[xml]$RapportGPO = Get-Content -Path C:\rapportGPO.xml


$RapportGPO.gpo.SecurityDescriptor.Owner.name


$RapportGPO.gpo.LinksTo


$RapportGPO.gpo.SecurityDescriptor.Permissions.TrusteePermissions.trustee.name

