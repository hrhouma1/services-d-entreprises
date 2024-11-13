
Remove-ADOrganizationalUnit -Identity "OU=OUTest5,DC=lab,DC=lan" -Confirm:$false



try
{

$OU =  "OU=OUTest1,DC=lab,DC=lan"

Remove-ADOrganizationalUnit -Identity $OU -Confirm:$false -ErrorAction Stop

}
catch [System.UnauthorizedAccessException]
{

  Write-Host "La suppression n'est pas possible. Souhaitez-vous désactiver la protection contre la suppression et supprimer l'OU ? (O/N) : " -ForegroundColor Red -NoNewline
  $Reponse = Read-Host

  if($Reponse -eq "O")
  {
     
     Set-ADOrganizationalUnit -Identity $OU -ProtectedFromAccidentalDeletion $false
     Remove-ADOrganizationalUnit -Identity $OU -Confirm:$false

  }
  elseif ($Reponse -eq "N")
  {
   
   Write-Host "Suppression annulée."

  }


}
