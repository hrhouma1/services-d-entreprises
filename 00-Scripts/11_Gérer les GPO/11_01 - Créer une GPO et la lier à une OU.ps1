
New-GPO -Name TestGPO -Comment "Ceci est une GPO de test" 


Get-GPO -Name test


New-GPO -Name TestGPO1 -StarterGpoName "testGPOStarter"


New-GPLink -Name TestGPO -Target "OU=OUTest,DC=lab,DC=lan"


(Get-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" | Get-GPInheritance).GpoLinks


New-GPStarterGPO -Name "Test2GPOStarter" -Comment "Test GPOStarter"