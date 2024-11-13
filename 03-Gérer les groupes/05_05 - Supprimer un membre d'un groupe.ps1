
Get-ADPrincipalGroupMembership -Identity jdubois | Select-Object Name
Get-ADPrincipalGroupMembership -Identity ldupres | Select-Object Name


Remove-ADGroupMember -Identity GroupeTest3 -Members jdubois,ldupres -Confirm:$false


Get-ADPrincipalGroupMembership -Identity jdubois | Select-Object Name
Get-ADPrincipalGroupMembership -Identity ldupres | Select-Object Name


Get-ADUser -Filter "title -eq 'Technicien' " | ForEach-Object {  Remove-ADGroupMember -Identity GroupeTest3 -Members $_.Name -Confirm:$false }

Get-ADPrincipalGroupMembership -Identity jlecomte | Select-Object Name

Remove-ADPrincipalGroupMembership -Identity jlecomte -MemberOf GroupeTest2,GroupeTest3 -Confirm:$false


Get-ADPrincipalGroupMembership -Identity jlecomte | Select-Object Name

