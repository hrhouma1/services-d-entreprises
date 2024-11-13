
Get-ADOrganizationalUnit -Filter *
Get-ADOrganizationalUnit -Filter * | Select-Object Name


Get-ADOrganizationalUnit -Filter " Name -eq 'OUTest'  "  -Properties *


Get-ADOrganizationalUnit -Filter * -ResultSetSize 1


Get-ADOrganizationalUnit -Filter * -Properties ProtectedFromAccidentalDeletion | Where-Object {$_.ProtectedFromAccidentalDeletion -eq $true } | Select-Object Name,ProtectedFromAccidentalDeletion
