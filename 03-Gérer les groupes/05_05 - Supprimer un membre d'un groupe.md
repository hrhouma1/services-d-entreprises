## 📚 Cours détaillé : Supprimer un membre d'un groupe Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser PowerShell pour supprimer des utilisateurs de groupes Active Directory (AD) avec les commandes `Remove-ADGroupMember` et `Remove-ADPrincipalGroupMembership`. Ces commandes sont utiles pour gérer les adhésions aux groupes en retirant des utilisateurs spécifiques ou en fonction de critères définis.

---

# ✨ Résumé des commandes

```powershell
# 👥 Lister les groupes auxquels appartient l'utilisateur "jdubois"
Get-ADPrincipalGroupMembership -Identity jdubois | Select-Object Name

# 👥 Lister les groupes auxquels appartient l'utilisateur "ldupres"
Get-ADPrincipalGroupMembership -Identity ldupres | Select-Object Name

# 🗑️ Supprimer "jdubois" et "ldupres" du groupe "GroupeTest3" sans confirmation
Remove-ADGroupMember -Identity GroupeTest3 -Members jdubois,ldupres -Confirm:$false

# 👥 Vérifier à nouveau les groupes de "jdubois" et "ldupres" après suppression
Get-ADPrincipalGroupMembership -Identity jdubois | Select-Object Name
Get-ADPrincipalGroupMembership -Identity ldupres | Select-Object Name

# 🔄 Supprimer tous les utilisateurs ayant le titre "Technicien" du groupe "GroupeTest3" sans confirmation
Get-ADUser -Filter "title -eq 'Technicien'" | ForEach-Object { Remove-ADGroupMember -Identity GroupeTest3 -Members $_.Name -Confirm:$false }

# 👥 Lister les groupes auxquels appartient "jlecomte"
Get-ADPrincipalGroupMembership -Identity jlecomte | Select-Object Name

# 🗑️ Supprimer "jlecomte" des groupes "GroupeTest2" et "GroupeTest3" sans confirmation
Remove-ADPrincipalGroupMembership -Identity jlecomte -MemberOf GroupeTest2,GroupeTest3 -Confirm:$false

# 👥 Vérifier à nouveau les groupes de "jlecomte" après suppression
Get-ADPrincipalGroupMembership -Identity jlecomte | Select-Object Name
```

---

# 👥 Commande 1 : Lister les groupes d'un utilisateur

```powershell
Get-ADPrincipalGroupMembership -Identity jdubois | Select-Object Name
```

**Détails :**
- **Get-ADPrincipalGroupMembership** : Liste tous les groupes auxquels appartient un utilisateur.
- **`-Identity jdubois`** : Spécifie l'utilisateur, ici "jdubois".
- **`| Select-Object Name`** : Filtre pour afficher seulement le nom des groupes.

---

# 🗑️ Commande 2 : Supprimer plusieurs membres d'un groupe sans confirmation

```powershell
Remove-ADGroupMember -Identity GroupeTest3 -Members jdubois,ldupres -Confirm:$false
```

**Détails :**
- **Remove-ADGroupMember** : Retire un ou plusieurs utilisateurs d'un groupe AD.
- **`-Identity GroupeTest3`** : Spécifie le groupe cible, ici "GroupeTest3".
- **`-Members jdubois,ldupres`** : Liste les membres à supprimer du groupe.
- **`-Confirm:$false`** : Supprime sans demander de confirmation.

---

# 👥 Commande 3 : Vérifier la suppression en listant les groupes d'un utilisateur

```powershell
Get-ADPrincipalGroupMembership -Identity jdubois | Select-Object Name
```

**Détails :**
- Cette commande permet de vérifier que les utilisateurs ont bien été retirés du groupe en listant leurs groupes d’appartenance actuels.

---

# 🔄 Commande 4 : Supprimer des utilisateurs d'un groupe en fonction de leur titre

```powershell
Get-ADUser -Filter "title -eq 'Technicien'" | ForEach-Object { Remove-ADGroupMember -Identity GroupeTest3 -Members $_.Name -Confirm:$false }
```

**Détails :**
- **Get-ADUser -Filter "title -eq 'Technicien'"** : Filtre pour sélectionner tous les utilisateurs avec le titre "Technicien".
- **ForEach-Object** : Exécute une action pour chaque utilisateur récupéré.
- **Remove-ADGroupMember -Identity GroupeTest3 -Members $_.Name -Confirm:$false** : Retire chaque utilisateur du groupe "GroupeTest3" sans confirmation.

---

# 🗑️ Commande 5 : Supprimer un utilisateur de plusieurs groupes

```powershell
Remove-ADPrincipalGroupMembership -Identity jlecomte -MemberOf GroupeTest2,GroupeTest3 -Confirm:$false
```

**Détails :**
- **Remove-ADPrincipalGroupMembership** : Retire un utilisateur de plusieurs groupes simultanément.
- **`-Identity jlecomte`** : Spécifie l'utilisateur, ici "jlecomte".
- **`-MemberOf GroupeTest2,GroupeTest3`** : Liste les groupes desquels retirer l'utilisateur.
- **`-Confirm:$false`** : Supprime sans confirmation.

---

# 👥 Commande 6 : Vérifier la suppression pour un utilisateur spécifique

```powershell
Get-ADPrincipalGroupMembership -Identity jlecomte | Select-Object Name
```

**Détails :**
- Cette commande permet de vérifier que l’utilisateur "jlecomte" a bien été retiré des groupes "GroupeTest2" et "GroupeTest3".

---

### 📝 Résumé

Ces commandes PowerShell permettent de supprimer des utilisateurs de groupes Active Directory, que ce soit pour un utilisateur spécifique, en masse selon des critères comme le titre, ou en supprimant plusieurs utilisateurs en une seule commande. Ces options facilitent la gestion des adhésions aux groupes dans un environnement AD.
