
Get-ADUser -Identity sleroy

Disable-ADAccount -Identity sleroy -Confirm:$false

Get-ADUser -Identity sleroy


Enable-ADAccount -Identity sleroy -Confirm:$false
Get-ADUser -Identity sleroy


Get-ADComputer -Identity DC03

Disable-ADAccount -Identity "CN=DC03,OU=Domain Controllers,DC=lab,DC=lan" -Confirm:$false

Get-ADComputer -Identity DC03

Enable-ADAccount -Identity "CN=DC03,OU=Domain Controllers,DC=lab,DC=lan" -Confirm:$false


Get-ADComputer -Filter "  OperatingSystem -eq 'Windows Server 2003' " -Properties OperatingSystem | Select-Object Name, OperatingSystem, Enabled


$Serveurs2003 = Get-ADComputer -Filter " OperatingSystem -eq 'Windows Server 2003' "

foreach($Serveur in $Serveurs2003)
{
  
  Disable-ADAccount -Identity $Serveur.DistinguishedName
  Write-Host "Le serveur $($Serveur.Name) a été désactivé"

}