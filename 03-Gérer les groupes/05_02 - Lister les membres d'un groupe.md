
Get-ADGroupMember -Identity "Administrateurs" 


(Get-ADGroupMember -Identity "Administrateurs" ).Count


$RecupGroupes = Get-ADGroupMember -Identity groupetest1 | Select-Object -ExpandProperty Name
$RecupGroupes -contains 'DC01'



Get-ADGroupMember -Identity "Administrateurs" -Server paris.lab.lan
