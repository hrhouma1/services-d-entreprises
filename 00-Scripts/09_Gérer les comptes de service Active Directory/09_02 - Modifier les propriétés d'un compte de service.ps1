
Get-ADServiceAccount -Identity svc-test -Properties PrincipalsAllowedToRetrieveManagedPassword


Set-ADServiceAccount -Identity svc-test -PrincipalsAllowedToRetrieveManagedPassword DC01$,DC03$
