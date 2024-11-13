
Set-GPLink -Name test -Target "OU=OUTest,DC=lab,DC=lan" -Enforced Yes


Set-GPLink -Name test -Target "OU=OUTest,DC=lab,DC=lan" -LinkEnabled No


Remove-GPLink -Name test -Target "OU=OUTest,DC=lab,DC=lan"