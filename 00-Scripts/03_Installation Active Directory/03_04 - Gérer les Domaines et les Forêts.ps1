
Get-ADDomain


Get-ADDomain -Identity paris.lab.lan


(Get-ADDomain -Identity paris.lab.lan).ParentDomain


Get-ADDomain -Identity paris.lab.lan | Select-Object ParentDomain


Get-ADDomain -Identity paris.lab.lan | Select-Object DomainMode


Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator


Set-ADDomain -Identity lab.lan -AllowedDNSSuffixes  @{Add="testlab.fr"}
Get-ADDomain -Identity lab.lan 


Set-ADDomain -Identity lab.lan -AllowedDNSSuffixes  @{Remove="testlab.fr"}
Get-ADDomain -Identity lab.lan 


Set-ADDomain -Identity lab.lan -ManagedBy "Administrateur"
Get-ADDomain -Identity lab.lan 



Get-ADDomain | Select-Object DomainMode
Set-ADDomainMode -Identity lab.lan -DomainMode Windows2016Domain -Confirm:$false
Get-ADDomain | Select-Object DomainMode


Get-ADDomainController -Identity DC01
Get-ADDomainController -Identity DC03

Get-ADDomainController -Discover


Get-ADDomainController -AvoidSelf -Discover


Get-ADForest 


Get-ADForest | Select-Object -ExpandProperty Domains


Get-ADForest | Select-Object SchemaMaster,DomainNamingMaster


Set-ADForest -Identity lab.lan -UPNSuffixes @{add="test.lab"}


Get-ADForest


Set-ADForest -Identity lab.lan -UPNSuffixes @{Remove="test.lab"; Add="TestUPN.lab"}


Get-ADForest


Set-ADForest -Identity lab.lan -UPNSuffixes @{Remove="TestUPN.lab"}


Set-ADForestMode -Identity lab.lan -ForestMode Windows2016Forest -Confirm:$false


Get-ADForest
