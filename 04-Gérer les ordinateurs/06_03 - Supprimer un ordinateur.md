
Remove-ADComputer -Identity PCtest3 -confirm:$false



$OrdinateursDesactives = Get-ADComputer -Filter " Enabled -eq '$false'   " -SearchBase "CN=Computers,DC=lab,DC=lan"

$OrdinateursDesactives | ForEach-Object { Remove-ADComputer -Identity $_.Name -WhatIf }
