Get-ADUser 


Get-ADUser -Filter *


Get-ADUser -Filter "Name -eq 'Administrateur' "


Get-ADUser -Filter "Name -eq 'Administrateur' " -Properties *


Get-ADUser -Filter "Enabled -eq '$true' " | Select-Object Name


Get-ADUser -Filter "Enabled -eq '$true' " -SearchBase "CN=Users,DC=lab,DC=lan" | Select-Object Name


(Get-ADGroup -Filter *).count