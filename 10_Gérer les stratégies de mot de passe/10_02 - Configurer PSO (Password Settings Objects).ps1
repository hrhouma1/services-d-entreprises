
Get-ADFineGrainedPasswordPolicy -Filter * 

Get-ADFineGrainedPasswordPolicy -Filter "  MaxPasswordAge -gt '10' "


Get-ADFineGrainedPasswordPolicySubject -Identity Test-PSO2


New-ADFineGrainedPasswordPolicyNew-ADFineGrainedPasswordPolicy -Name PSO-Test `
-ComplexityEnabled $true `
-LockoutDuration 00:30:00 `
-LockoutObservationWindow 00:30:00 `
-LockoutThreshold 0 `
-MaxPasswordAge 60.00:00:00 `
-MinPasswordAge 5.00:00:00 `
-MinPasswordLength 10 `
-Precedence 5 


Get-ADFineGrainedPasswordPolicy PSO-Test



Add-ADFineGrainedPasswordPolicySubject -Identity PSO-Test -Subjects GroupeTest3


Get-ADUser -Filter "title -like 'Ingé*' " | Add-ADFineGrainedPasswordPolicySubject -Identity PSO-Test



Set-ADFineGrainedPasswordPolicy -Identity PSO-Test -MaxPasswordAge 50.00:00:00


Get-ADFineGrainedPasswordPolicy PSO-Test


Get-ADUserResultantPasswordPolicy sleroy


Remove-ADFineGrainedPasswordPolicy -Identity Test-PSO2  -Confirm:$false
Set-ADFineGrainedPasswordPolicy -Identity Test-PSO1 -ProtectedFromAccidentalDeletion $false



Get-ADFineGrainedPasswordPolicy Test-PSO1


Remove-ADFineGrainedPasswordPolicySubject -Identity Test-PSO1 -Subjects sleroy -Confirm:$false

