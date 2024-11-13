$DelegationDNS   = $false
$CheminBDD       = "C:\Windows\NTDS"
$NiveauDomaine   = "Win2012"
$NomDeDomaine    = "lab.lan"
$NomNetBios      = "LAB"
$NiveauForet     = "Win2012"
$InstallationDNS = $true
$CheminLOG       = "C:\Windows\NTDS" 
$NePasRebooter   = $false
$CheminSYSVOL    = "C:\Windows\SYSVOL"
$MotDePasseRestauration = ConvertTo-SecureString -AsPlainText "P@$$word" -Force 


Install-ADDSForest -CreateDnsDelegation:$DelegationDNS `
                   -DatabasePath $CheminBDD `
                   -DomainMode $NiveauDomaine `
                   -DomainName $NomDeDomaine `
                   -DomainNetbiosName $NomNetBios `
                   -ForestMode $NiveauForet `
                   -InstallDns:$InstallationDNS `
                   -LogPath $CheminLOG `
                   -NoRebootOnCompletion:$NePasRebooter `
                   -SysvolPath $CheminSYSVOL `
                   -SafeModeAdministratorPassword $MotDePasseRestauration `
                   -Force:$true `
                   -Confirm:$false




