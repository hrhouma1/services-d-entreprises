$Utilisateurs = Import-Csv -Path 'C:\utilisateurs en masse.csv' -Delimiter ";" -Encoding UTF8


foreach($Utilisateur in $Utilisateurs)
{

$MDP = ConvertTo-SecureString -AsPlainText $Utilisateur.MDP -Force

New-ADUser  -GivenName $Utilisateur.Prenom `
            -Surname $Utilisateur.Nom `
            -Name $Utilisateur.NomLogin `
            -DisplayName $Utilisateur.NomAffichage `
            -Title $Utilisateur.Fonction`
            -UserPrincipalName $Utilisateur.UPN`
            -AccountPassword $MDP `
            -Enabled $true
}