# script PowerShell 

![image](https://github.com/user-attachments/assets/68b33865-69fb-45bd-a680-893726dd1c69)


```powershell
# Import the Active Directory module
Import-Module ActiveDirectory

# Define the root domain
$domain = "DC=test,DC=local"

# Create top-level OUs for Quebec and Ontario
New-ADOrganizationalUnit -Name "Quebec" -Path $domain
New-ADOrganizationalUnit -Name "Ontario" -Path $domain

# Create sub-OUs for departments under Quebec
New-ADOrganizationalUnit -Name "RH" -Path "OU=Quebec,$domain"
New-ADOrganizationalUnit -Name "Informatique" -Path "OU=Quebec,$domain"
New-ADOrganizationalUnit -Name "Marketing" -Path "OU=Informatique,OU=Quebec,$domain"

# Create sub-OUs for departments under Ontario
New-ADOrganizationalUnit -Name "Informatique" -Path "OU=Ontario,$domain"
New-ADOrganizationalUnit -Name "Marketing" -Path "OU=Ontario,$domain"

# Create groups for each department in Quebec and Ontario
New-ADGroup -Name "RH-QC" -GroupScope Global -GroupCategory Security -Path "OU=RH,OU=Quebec,$domain"
New-ADGroup -Name "Info-QC" -GroupScope Global -GroupCategory Security -Path "OU=Informatique,OU=Quebec,$domain"
New-ADGroup -Name "Marketing-QC" -GroupScope Global -GroupCategory Security -Path "OU=Marketing,OU=Informatique,OU=Quebec,$domain"

New-ADGroup -Name "Info-ON" -GroupScope Global -GroupCategory Security -Path "OU=Informatique,OU=Ontario,$domain"
New-ADGroup -Name "Marketing-ON" -GroupScope Global -GroupCategory Security -Path "OU=Marketing,OU=Ontario,$domain"

# Create users in RH-QC OU
New-ADUser -Name "Marc RH" -SamAccountName MarcRHQC -UserPrincipalName MarcRHQC@test.local -Path "OU=RH,OU=Quebec,$domain" -AccountPassword (ConvertTo-SecureString 'P@ssw0rd' -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Alice RH" -SamAccountName AliceRHQC -UserPrincipalName AliceRHQC@test.local -Path "OU=RH,OU=Quebec,$domain" -AccountPassword (ConvertTo-SecureString 'P@ssw0rd' -AsPlainText -Force) -Enabled $true

# Create users in Info-QC OU
New-ADUser -Name "Yuri Info" -SamAccountName YuriInfoQC -UserPrincipalName YuriInfoQC@test.local -Path "OU=Informatique,OU=Quebec,$domain" -AccountPassword (ConvertTo-SecureString 'P@ssw0rd' -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Marine Info" -SamAccountName MarineInfoQC -UserPrincipalName MarineInfoQC@test.local -Path "OU=Informatique,OU=Quebec,$domain" -AccountPassword (ConvertTo-SecureString 'P@ssw0rd' -AsPlainText -Force) -Enabled $true

# Create users in Marketing-ON OU
New-ADUser -Name "John Mrkt" -SamAccountName JohnMrktON -UserPrincipalName JohnMrktON@test.local -Path "OU=Marketing,OU=Ontario,$domain" -AccountPassword (ConvertTo-SecureString 'P@ssw0rd' -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Lucy Mrkt" -SamAccountName LucyMrktON -UserPrincipalName LucyMrktON@test.local -Path "OU=Marketing,OU=Ontario,$domain" -AccountPassword (ConvertTo-SecureString 'P@ssw0rd' -AsPlainText -Force) -Enabled $true

# Create users in Info-ON OU
New-ADUser -Name "Anis Info" -SamAccountName AnisInfoON -UserPrincipalName AnisInfoON@test.local -Path "OU=Informatique,OU=Ontario,$domain" -AccountPassword (ConvertTo-SecureString 'P@ssw0rd' -AsPlainText -Force) -Enabled $true
```
