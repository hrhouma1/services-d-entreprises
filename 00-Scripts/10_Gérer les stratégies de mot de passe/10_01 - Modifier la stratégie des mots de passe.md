
Get-ADDefaultDomainPasswordPolicy


Set-ADDefaultDomainPasswordPolicy -Identity lab.lan -ComplexityEnabled $false -LockoutDuration 00:45:00 -MaxPasswordAge 30.00:00:00


Get-ADDefaultDomainPasswordPolicy


$MDPComplexe       = $true

$StrategieMDP = Get-ADDefaultDomainPasswordPolicy -Identity lab.lan

if($StrategieMDP.ComplexityEnabled -eq $MDPComplexe)
{

   Write-Host "La stratégie de mot de passe répond aux exigences de complexité" -ForegroundColor Green

}
else
{

   Write-Host "La stratégie de mot de passe ne répond pas aux exigences de complexité." -ForegroundColor Red
   Write-Host "Souhaitez-vous mettre en conformité l'exigence de complexité (O/N) ? " -ForegroundColor Green -NoNewline
   $Reponse = Read-Host

   if($Reponse -eq "O")
    {

      Set-ADDefaultDomainPasswordPolicy -Identity lab.lan -ComplexityEnabled $true
      Write-Host "La stratégie de mot de passe a été mise en conformité."

    }
    elseif($Reponse -eq "N")
    {
     
     Write-Host "La stratégie de mot de passe n'a pas été modifiée."


    }


}
