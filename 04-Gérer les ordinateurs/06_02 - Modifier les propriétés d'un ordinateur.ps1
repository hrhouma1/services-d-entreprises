
Set-ADComputer -Identity PCtest3 -Description "Modification description"


Set-ADComputer -Identity PCtest3 -Add @{comment="test comment"}


Set-ADComputer -Identity PCtest3 -Replace @{comment="comment modifié "}


Set-ADComputer -Identity PCtest3 -Clear comment


Get-ADComputer -Filter "  OperatingSystem -like '*Server*' " -Properties Description  | Set-ADComputer -Description "Windows Serveur"