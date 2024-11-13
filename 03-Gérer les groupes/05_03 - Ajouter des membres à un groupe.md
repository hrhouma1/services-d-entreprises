
Add-ADGroupMember -Identity "GroupeTest3" -Members mleroy,jlecomte


Get-ADGroupMember -Identity "GroupeTest3"


Get-ADUser -Filter " title -like 'Ingé*'   " | ForEach-Object { Add-ADGroupMember -Identity "GroupeTest3" -Members $_.Name }


Get-ADGroupMember -Identity "GroupeTest3"



Add-ADPrincipalGroupMembership -Identity jdubois -MemberOf "Admins du domaine","Administrateurs clés"


Get-ADUser -Filter "title -like 'Ingé*'" | ForEach-Object { Add-ADPrincipalGroupMembership -Identity $_.Name -MemberOf "Admins du domaine","Administrateurs clés" }


Get-ADGroupMember -Identity "Admins du domaine"
Get-ADGroupMember -Identity "Administrateurs clés"

