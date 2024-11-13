
Get-ADUser -Identity nexistepas

try 
 {
    Get-ADUser -Identity nexistepas -ErrorAction Stop
 }
catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]
 {
    Write-Warning -Message "L'utilisateur n'existe pas."
 } 




$Utilisateurs = Get-Content 'C:\utilisateurs ad.txt'
 
foreach($Utilisateur in $Utilisateurs)
{

try 
 {
    $UtilisateurAD = Get-ADUser -Identity $Utilisateur -ErrorAction Stop
    Write-Host  "L'utilisateur $($UtilisateurAD.Name) existe." -ForegroundColor Green
 }
catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]
 {
    Write-Host "L'utilisateur $($utilisateur) n'existe pas." -ForegroundColor Red
 } 

}    

