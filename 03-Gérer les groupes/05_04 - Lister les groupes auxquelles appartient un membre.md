## 📚 Cours détaillé : Lister les groupes auxquels appartient un membre Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser la commande `Get-ADPrincipalGroupMembership` pour identifier les groupes auxquels un utilisateur ou membre d'Active Directory appartient. Cette commande est utile pour vérifier les permissions et les accès associés aux utilisateurs.

---

# ✨ Résumé des commandes

```powershell
# 👥 Lister tous les groupes auxquels appartient l'utilisateur "jdubois"
Get-ADPrincipalGroupMembership -Identity jdubois | Select-Object Name

# 🔄 Récupérer les groupes pour chaque utilisateur dont le titre commence par "Ingé"
$Utilisateurs = Get-ADUser -Filter "title -like 'Ingé*'"

foreach($Utilisateur in $Utilisateurs)
{
  # 📋 Lister les groupes de l'utilisateur courant
  $GroupeAppartenance = Get-ADPrincipalGroupMembership -Identity $Utilisateur
  
  # 📝 Créer un objet avec le nom de l'utilisateur et ses groupes
  $Appartenance = [PSCustomObject]@{
                                     Utilisateurs = $Utilisateur.Name
                                     Groupes      = $GroupeAppartenance.Name
                                    }
  
  # Affiche l'appartenance de chaque utilisateur
  $Appartenance
}
```

---

# 👥 Commande 1 : Lister les groupes auxquels appartient un utilisateur spécifique

```powershell
Get-ADPrincipalGroupMembership -Identity jdubois | Select-Object Name
```

**Détails :**
- **Get-ADPrincipalGroupMembership** : Cette commande liste tous les groupes auxquels appartient un utilisateur ou un autre objet AD.
- **`-Identity jdubois`** : Spécifie l’utilisateur, ici "jdubois".
- **`| Select-Object Name`** : Filtre les résultats pour n’afficher que le nom des groupes.

Cette commande permet de voir rapidement tous les groupes d'un utilisateur donné.

---

# 🔄 Commande 2 : Lister les groupes de plusieurs utilisateurs en fonction d'un critère

```powershell
$Utilisateurs = Get-ADUser -Filter "title -like 'Ingé*'"
```

**Détails :**
- **Get-ADUser -Filter "title -like 'Ingé*'"** : Filtre et récupère tous les utilisateurs dont le titre commence par "Ingé".
- Cette ligne stocke tous les utilisateurs filtrés dans la variable `$Utilisateurs` pour traitement en boucle.

---

# 📋 Commande 3 : Boucle pour afficher les groupes de chaque utilisateur

```powershell
foreach($Utilisateur in $Utilisateurs)
{
  # Liste les groupes de chaque utilisateur
  $GroupeAppartenance = Get-ADPrincipalGroupMembership -Identity $Utilisateur
```

**Détails :**
- **foreach($Utilisateur in $Utilisateurs)** : Cette boucle parcourt chaque utilisateur récupéré précédemment.
- **Get-ADPrincipalGroupMembership -Identity $Utilisateur** : Pour chaque utilisateur, cette commande liste tous les groupes auxquels l'utilisateur appartient.

---

# 📝 Commande 4 : Créer un objet pour afficher les noms des utilisateurs et leurs groupes

```powershell
$Appartenance = [PSCustomObject]@{
                                     Utilisateurs = $Utilisateur.Name
                                     Groupes      = $GroupeAppartenance.Name
                                    }
```

**Détails :**
- **[PSCustomObject]@{ ... }** : Crée un objet personnalisé pour organiser les informations.
- **Utilisateurs = $Utilisateur.Name** : Stocke le nom de l'utilisateur.
- **Groupes = $GroupeAppartenance.Name** : Stocke le nom des groupes de l'utilisateur.

Cette structure permet de présenter les informations sous forme d'objets lisibles, affichant pour chaque utilisateur ses groupes d'appartenance.

---

### 📝 Résumé

Ces commandes permettent de lister les groupes auxquels appartient un utilisateur, individuellement ou pour plusieurs utilisateurs à la fois, en fonction de critères spécifiques. Cela simplifie la gestion des permissions dans Active Directory et permet de vérifier les accès des utilisateurs.
