Set-ADUser -Identity jlebon -Description "Ceci est un compte de test"


Set-ADUser -Identity jlebon -Add @{division="Division test"}


Set-ADUser -Identity jlebon -Replace @{division="Division "}


Set-ADUser -Identity jlebon -Clear division


Get-ADUser -Filter "  title -like 'Ingé*' " -Properties title, division | Set-ADUser -Title "Ingénieur(e) Système" -Add @{division="Infrastructure"}


Get-ADUser -Filter "title -like 'Ingé*' " -Properties manager | Where-Object {$_.manager -eq $null} | Set-ADUser -Manager jlebon


Get-ADUser -Filter * -Properties manager | Where-Object {$_.manager -eq $null} | Set-ADUser -Manager sleroy