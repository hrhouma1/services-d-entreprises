Remove-ADUser -Identity jlebon -Confirm:$false


Remove-ADUser -Identity jlebon


$UtilisateursDesactives = Get-ADUser -Filter " Enabled -eq '$false' -and Name -ne 'krbtgt' -and Name -ne 'Invité'    "

$UtilisateursDesactives | ForEach-Object { Remove-ADUser $_.Name -WhatIf }