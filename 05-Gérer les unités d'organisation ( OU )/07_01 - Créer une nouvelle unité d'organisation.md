
New-ADOrganizationalUnit -Name OUTest1 


New-ADOrganizationalUnit -Name OUTest3 -Path "OU=OUTest,DC=lab,DC=lan"


New-ADOrganizationalUnit -Name OUTest5 -ProtectedFromAccidentalDeletion $true


$ListeOU = "TestOU1","TestOU2","TestOU3","TestOU4"


foreach($OU in $ListeOU)
{
  New-ADOrganizationalUnit -Name $OU -Description "Test création OU" -ProtectedFromAccidentalDeletion $false

}


Get-ADOrganizationalUnit -Filter * | Select-Object Name
