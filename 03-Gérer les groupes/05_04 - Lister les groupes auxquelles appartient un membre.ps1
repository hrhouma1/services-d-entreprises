
Get-ADPrincipalGroupMembership -Identity jdubois | Select-Object Name



$Utilisateurs = Get-ADUser -Filter " title -like 'Ingé*'   " 

foreach($Utilisateur in $Utilisateurs)
{
   
  $GroupeAppartenance =  Get-ADPrincipalGroupMembership -Identity $Utilisateur 

  $Appartenance = [PSCustomObject]@{

                                     Utilisateurs = $Utilisateur.Name
                                     Groupes      = $GroupeAppartenance.Name

                                    }

  $Appartenance
}

