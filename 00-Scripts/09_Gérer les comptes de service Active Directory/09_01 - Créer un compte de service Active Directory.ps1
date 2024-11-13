
Get-KdsRootKey


Add-KdsRootKey -EffectiveTime ((get-date).addhours(-10))


Get-KdsRootKey


Get-KdsRootKey


New-ADServiceAccount -Name svc-test -PrincipalsAllowedToRetrieveManagedPassword DC03$ -DNSHostName svc-test.lab.lan -Enabled $true


Get-ADServiceAccount -Filter *


Get-ADServiceAccount -Identity svc-test


Get-ADServiceAccount -Identity svc-test -Properties *