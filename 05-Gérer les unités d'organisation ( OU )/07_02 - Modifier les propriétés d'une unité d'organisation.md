

Get-ADOrganizationalUnit -Filter * | Select-Object name, distinguishedname
Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Description "Test description"


Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Add @{l=" test"}


Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Replace @{l=" modifiée "}


Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Clear l


Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -ProtectedFromAccidentalDeletion $true


Get-ADOrganizationalUnit -Filter * | Set-ADOrganizationalUnit -Country FR
