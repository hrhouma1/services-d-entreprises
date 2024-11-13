
Get-ADDefaultDomainPasswordPolicy


Get-ADDefaultDomainPasswordPolicy -Server paris.lab.lan



$MDPComplexe       = $true
$DureeVerrouillage = "00:30:00"

$StrategieMDP = Get-ADDefaultDomainPasswordPolicy -Identity lab.lan

if($StrategieMDP.ComplexityEnabled -eq $MDPComplexe)
{

   Write-Host "La stratégie de mot de passe répond aux exigences de complexité" -ForegroundColor Green

}

if($StrategieMDP.LockoutDuration -ne $DureeVerrouillage)
{

   Write-Host "La durée de verrouillage ne répond pas aux exigences" -ForegroundColor Red

}