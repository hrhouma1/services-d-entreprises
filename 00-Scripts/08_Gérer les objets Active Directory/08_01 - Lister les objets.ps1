
Get-ADObject -Filter *
Get-ADObject -Filter * | Select-Object Name


Get-ADObject -Filter "ObjectClass -eq 'group'"


Get-ADGroup groupetest1


Get-ADObject -Filter "ObjectClass -eq 'computer'"


Get-ADObject -Filter * -SearchBase "CN=Users,DC=lab,DC=lan"


Get-ADObject -Filter * -SearchBase "CN=Users,DC=lab,DC=lan" -ResultSetSize 1


(Get-ADObject -Filter *).count