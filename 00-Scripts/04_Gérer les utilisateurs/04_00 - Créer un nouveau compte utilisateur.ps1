$MDP = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
New-ADUser -GivenName "Jean" -Surname "DUBOIS" -Name "jdubois" -DisplayName "Jean DUBOIS"  -UserPrincipalName "jdubois@lab.lan" -AccountPassword $MDP -Enabled $true


$MDP = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
New-ADUser -GivenName "Marc" -Surname "LEROY" -Name "mleroy" -DisplayName "Marc LEROY" -UserPrincipalName "mleroy@lab.lan" -AccountPassword $MDP -ChangePasswordAtLogon $true -Enabled $true


$MDP = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
New-ADUser -GivenName "Damien" -Surname "ROCHE" -Name "droche" -DisplayName "Damien ROCHE" -UserPrincipalName "droche@lab.lan" -AccountPassword $MDP -CannotChangePassword $true -Enabled $true

#Avec date d'expiration
$MDP = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
New-ADUser -GivenName "Jean" -Surname "LEBON" -Name "jlebon" -DisplayName "Jean LEBON" -UserPrincipalName "jlebon@lab.lan" -AccountPassword $MDP -AccountExpirationDate "30/12/2023"  -Enabled $true


$MDP = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
New-ADUser -GivenName "Jean" -Surname "LEBON" -Name "jlebon" -DisplayName "Jean LEBON" -UserPrincipalName "jlebon@lab.lan" -AccountPassword $MDP -AccountExpirationDate "30/12/2023" -Server paris.lab.lan  -Enabled $true


$MDP = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
New-ADUser -GivenName "Jérôme" -Surname "DUROC" -Name "jduroc" -DisplayName "Jérôme DUROC" -UserPrincipalName "jduroc@lab.lan" -AccountPassword $MDP -Enabled $true -Path "OU=OUTest,DC=lab,DC=lan"


New-ADUser -Name "user1" -OtherAttributes @{info="test info"}
