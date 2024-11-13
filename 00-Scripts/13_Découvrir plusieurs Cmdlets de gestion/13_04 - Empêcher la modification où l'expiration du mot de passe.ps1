
Set-ADAccountControl -Identity sleroy -CannotChangePassword $true


Set-ADAccountControl -Identity sleroy -PasswordNeverExpires $true


Set-ADAccountControl -Identity sleroy -DoesNotRequirePreAuth $true
