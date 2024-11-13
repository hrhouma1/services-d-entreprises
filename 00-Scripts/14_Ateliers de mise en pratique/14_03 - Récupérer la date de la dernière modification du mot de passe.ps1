Get-ADuser -Filter * -Properties  passwordlastset | Select-Object name, passwordlastset


$TousLesUtilisateurs = Get-ADuser -Filter * -Properties  passwordlastset | Where-Object {$_.passwordlastset -ne $null}

foreach($Utilisateur in $TousLesUtilisateurs)
{

   $DateDuJour   =  (Get-Date).ToShortDateString()
   $DateModifMDP =  ($Utilisateur.passwordlastset).ToShortDateString()
 
   $Difference      =  New-TimeSpan -Start $DateModifMDP -End $DateDuJour 

   if($Difference.Days -gt 10)
   {
      
    Write-Host "$($Utilisateur.name)"

   }
  
}
