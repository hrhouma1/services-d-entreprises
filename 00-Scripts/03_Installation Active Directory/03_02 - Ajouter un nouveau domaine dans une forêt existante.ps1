Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

$NoCatalogueGlobal      = $false
$DelegationDNS          = $true
$Identifiant            = (Get-Credential lab.lan\Administrateur)
$CheminBDD              = "C:\Windows\NTDS"
$NiveauDomaine          = "Win2012"
$TypeDomaine            =  "ChildDomain"
$InstallationDNS        = $true
$CheminLOG              = "C:\Windows\NTDS"
$NomDomaine             = "Paris"
$NomNetBIOS             = "PARIS"
$DomaineParent          = "lab.lan"
$NePasRebooter          = $false
$NomSite                = "Default-First-Site-Name"
$CheminSYSVOL           = "C:\Windows\SYSVOL"
$MotDePasseRestauration = ConvertTo-SecureString -AsPlainText "P@$$word" -Force

Install-ADDSDomain -NoGlobalCatalog:$NoCatalogueGlobal  `
                   -CreateDnsDelegation:$DelegationDNS `
                   -Credential:$Identifiant `
                   -DatabasePath $CheminBDD `
                   -DomainMode $NiveauDomaine `
                   -DomainType $TypeDomaine `
                   -InstallDns:$InstallationDNS `
                   -LogPath $CheminLOG  `
                   -NewDomainName $NomDomaine `
                   -NewDomainNetbiosName $NomNetBIOS `
                   -ParentDomainName $DomaineParent `
                   -NoRebootOnCompletion:$NePasRebooter `
                   -SiteName $NomSite `
                   -SysvolPath $CheminSYSVOL `
                   -SafeModeAdministratorPassword $MotDePasseRestauration `
                   -Force:$true `
                   -Confirm:$false

