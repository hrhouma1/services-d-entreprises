
Set-ADObject -Identity "CN=TestObjet1,DC=lab,DC=lan" -Description "Test description "


Set-ADObject -Identity "CN=testobjet10,DC=lab,DC=lan" -Description "Test description "


Set-ADObject -Identity "CN=TestObjet1,DC=lab,DC=lan" -Description "Modification description"


Set-ADObject -Identity "CN=TestObjet1,DC=lab,DC=lan" -Add @{l="test modification"}


Set-ADObject -Identity "CN=TestObjet1,DC=lab,DC=lan" -Replace @{l="modifié "}


Set-ADObject -Identity "CN=TestObjet1,DC=lab,DC=lan" -Clear l


Set-ADObject -Identity "CN=TestObjet10,DC=lab,DC=lan" -Add @{l="test modification"}


Get-ADObject -Filter "ObjectClass -eq 'computer' -and OperatingSystem -eq 'Windows 11 Enterprise' " | Set-ADObject -Description "Poste de travail"