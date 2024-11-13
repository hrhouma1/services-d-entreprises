
Search-ADAccount -AccountDisabled | Select-Object name, objectclass


Search-ADAccount -AccountDisabled -UsersOnly | Select-Object name


Search-ADAccount -AccountDisabled -ComputersOnly | Select-Object name


Search-ADAccount -AccountExpired | Select-Object name


Search-ADAccount -PasswordExpired  | Select-Object name


Search-ADAccount -LockedOut | Select-Object name