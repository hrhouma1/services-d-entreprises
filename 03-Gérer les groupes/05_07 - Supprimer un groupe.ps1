get-adgroup -identity groupetest1
Remove-ADGroup -Identity groupetest1
get-adgroup -identity groupetest1



$Groupes = Get-ADGroup -Filter * -SearchBase "OU=OUTest,DC=lab,DC=lan"

foreach($Groupe in $Groupes)
{
   
   $NombreMembre = (Get-ADGroupMember -Identity $Groupe | Measure-Object).count

   Write-Host "Le groupe $($Groupe.Name) contient $($NombreMembre) membre"

   if($NombreMembre -eq 0)
   {

     Remove-ADGroup -Identity $Groupe.Name -Confirm:$false

   }


}


Remove-ADGroup -Identity GroupeLyon -Server paris.lab.lan -Confirm:$false