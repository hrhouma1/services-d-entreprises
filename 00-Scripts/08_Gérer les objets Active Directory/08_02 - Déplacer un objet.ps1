Move-ADObject -Identity "CN=PCTest1,CN=Computers,DC=lab,DC=lan" -TargetPath "OU=OUTest,DC=lab,DC=lan"

Get-ADObject -Filter " OperatingSystem -like '*Server*' -and Name -notlike 'DC*' " | Move-ADObject -TargetPath "OU=Serveurs,DC=lab,DC=lan"