
New-ADComputer -Name PCTest1


New-ADComputer -Name PCTest2 -Path "CN=Builtin,DC=lab,DC=lan"


New-ADComputer -Name PCtest3 -TrustedForDelegation $true


New-ADComputer -Name PCtest3 -OperatingSystem "Windows Server 2016"

