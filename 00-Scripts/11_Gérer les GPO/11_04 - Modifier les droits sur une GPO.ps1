
Set-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group -PermissionLevel GpoRead
Set-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group -PermissionLevel GpoEdit


Set-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group -PermissionLevel none


Get-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group 


Get-ADUser -Filter " title -like 'Ingé*'" |  ForEach-Object {

    Set-GPPermission -Name test -TargetName $_.Name -TargetType User -PermissionLevel GpoEdit
   
   }
   
   
   