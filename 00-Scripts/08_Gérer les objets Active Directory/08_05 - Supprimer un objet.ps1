
Remove-ADObject -Identity "CN=TestObjet10,DC=lab,DC=lan"


Get-ADObject -Filter "Description -eq 'Poste de travail'" | Remove-ADObject -Confirm:$false