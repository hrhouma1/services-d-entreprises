Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

$NoCatalogueGlobal      = $false
$DelegationDNS          = $false
$Identifiant            = (Get-Credential lab.lan\Administrateur)
$CheminBDD              = "C:\Windows\NTDS"
$CheminLOG              = "C:\Windows\NTDS"
$NomDomaine             = "lab.lan"
$InstallationDNS        = $true
$NePasRebooter          = $false
$NomSite                = "Default-First-Site-Name"
$CheminSYSVOL           = "C:\Windows\SYSVOL"
$Replication            = $false
$MotDePasseRestauration = ConvertTo-SecureString -AsPlainText "P@$$word" -Force

Install-ADDSDomainController -NoGlobalCatalog:$NoCatalogueGlobal `
                             -CreateDnsDelegation:$DelegationDNS `
                             -Credential:$Identifiant `
                             -CriticalReplicationOnly:$Replication `
                             -DatabasePath $CheminBDD `
                             -DomainName $NomDomaine `
                             -InstallDns:$InstallationDNS `
                             -LogPath $CheminLOG  `
                             -NoRebootOnCompletion:$NePasRebooter `
                             -SiteName $NomSite `
                             -SysvolPath $CheminSYSVOL `
                             -SafeModeAdministratorPassword $MotDePasseRestauration   `
                             -Force:$true `
                             -Confirm:$false
