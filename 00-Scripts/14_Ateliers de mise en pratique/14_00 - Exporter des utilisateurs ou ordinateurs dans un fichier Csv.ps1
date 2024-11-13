
Get-ADUser -Filter *  | Select-Object GivenName, SurName,UserPrincipalName


Get-ADUser -Filter * -Properties title  | Select-Object GivenName, SurName,UserPrincipalName, title | Export-Csv -Path utilisateurs.csv -Delimiter ";" -Append -Encoding UTF8 -NoTypeInformation


Get-ADComputer -Filter * -Properties OperatingSystem| Select-Object Name, OperatingSystem | Export-Csv -Path ordinateurs.csv -Delimiter ";" -Append -Encoding UTF8 -NoTypeInformation


