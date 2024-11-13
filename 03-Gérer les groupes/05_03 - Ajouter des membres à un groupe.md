## 📚 Cours détaillé : Ajouter des membres à un groupe Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser PowerShell pour ajouter des utilisateurs à des groupes Active Directory (AD). Ces commandes permettent de gérer facilement les membres des groupes AD, en les ajoutant manuellement ou de manière automatisée selon des critères spécifiques.

---

# ✨ Résumé des commandes

```powershell
# ➕ Ajoute les utilisateurs "mleroy" et "jlecomte" au groupe "GroupeTest3"
Add-ADGroupMember -Identity "GroupeTest3" -Members mleroy,jlecomte

# 👥 Liste tous les membres actuels du groupe "GroupeTest3"
Get-ADGroupMember -Identity "GroupeTest3"

# 🔄 Ajoute tous les utilisateurs avec un titre commençant par "Ingé" au groupe "GroupeTest3"
Get-ADUser -Filter "title -like 'Ingé*'" | ForEach-Object { Add-ADGroupMember -Identity "GroupeTest3" -Members $_.Name }

# ➕ Ajoute l'utilisateur "jdubois" aux groupes "Admins du domaine" et "Administrateurs clés"
Add-ADPrincipalGroupMembership -Identity jdubois -MemberOf "Admins du domaine","Administrateurs clés"

# 🔄 Ajoute tous les utilisateurs avec un titre commençant par "Ingé" aux groupes "Admins du domaine" et "Administrateurs clés"
Get-ADUser -Filter "title -like 'Ingé*'" | ForEach-Object { Add-ADPrincipalGroupMembership -Identity $_.Name -MemberOf "Admins du domaine","Administrateurs clés" }

# 👥 Liste tous les membres du groupe "Admins du domaine"
Get-ADGroupMember -Identity "Admins du domaine"

# 👥 Liste tous les membres du groupe "Administrateurs clés"
Get-ADGroupMember -Identity "Administrateurs clés"
```

---

# ➕ Commande 1 : Ajouter des utilisateurs spécifiques à un groupe

```powershell
Add-ADGroupMember -Identity "GroupeTest3" -Members mleroy,jlecomte
```

**Détails :**
- **Add-ADGroupMember** : Commande pour ajouter des utilisateurs à un groupe AD.
- **`-Identity "GroupeTest3"`** : Spécifie le groupe cible, ici "GroupeTest3".
- **`-Members mleroy,jlecomte`** : Liste les utilisateurs à ajouter, ici "mleroy" et "jlecomte".

Cette commande ajoute manuellement des utilisateurs spécifiques au groupe.

---

# 👥 Commande 2 : Vérifier les membres actuels d'un groupe

```powershell
Get-ADGroupMember -Identity "GroupeTest3"
```

**Détails :**
- **Get-ADGroupMember** : Affiche tous les membres du groupe "GroupeTest3".

Cela permet de vérifier que les utilisateurs ont bien été ajoutés au groupe.

---

# 🔄 Commande 3 : Ajouter des utilisateurs filtrés selon un critère au groupe

```powershell
Get-ADUser -Filter "title -like 'Ingé*'" | ForEach-Object { Add-ADGroupMember -Identity "GroupeTest3" -Members $_.Name }
```

**Détails :**
- **Get-ADUser -Filter "title -like 'Ingé*'"** : Filtre tous les utilisateurs dont le titre commence par "Ingé".
- **ForEach-Object { Add-ADGroupMember -Identity "GroupeTest3" -Members $_.Name }** : Pour chaque utilisateur filtré, il est ajouté au groupe "GroupeTest3".

Cette commande permet d’ajouter des utilisateurs automatiquement selon des critères, comme ici un titre.

---

# ➕ Commande 4 : Ajouter un utilisateur à plusieurs groupes

```powershell
Add-ADPrincipalGroupMembership -Identity jdubois -MemberOf "Admins du domaine","Administrateurs clés"
```

**Détails :**
- **Add-ADPrincipalGroupMembership** : Ajoute un utilisateur à plusieurs groupes à la fois.
- **`-Identity jdubois`** : Spécifie l’utilisateur à ajouter, ici "jdubois".
- **`-MemberOf "Admins du domaine","Administrateurs clés"`** : Liste les groupes cibles.

Cette commande ajoute un utilisateur unique à plusieurs groupes en une seule commande.

---

# 🔄 Commande 5 : Ajouter des utilisateurs filtrés à plusieurs groupes

```powershell
Get-ADUser -Filter "title -like 'Ingé*'" | ForEach-Object { Add-ADPrincipalGroupMembership -Identity $_.Name -MemberOf "Admins du domaine","Administrateurs clés" }
```

**Détails :**
- **ForEach-Object { Add-ADPrincipalGroupMembership -Identity $_.Name -MemberOf ... }** : Pour chaque utilisateur filtré, ajoute cet utilisateur aux groupes spécifiés.

Cette commande permet de gérer en bloc des utilisateurs selon des critères (comme ici leur titre) et de les ajouter à plusieurs groupes.

---

# 👥 Commande 6 : Vérifier les membres d'un groupe spécifique

```powershell
Get-ADGroupMember -Identity "Admins du domaine"
```

**Détails :**
- Affiche tous les membres du groupe "Admins du domaine".

---

# 👥 Commande 7 : Vérifier les membres d'un autre groupe spécifique

```powershell
Get-ADGroupMember -Identity "Administrateurs clés"
```

**Détails :**
- Affiche tous les membres du groupe "Administrateurs clés".

---

### 📝 Résumé

Ces commandes permettent d'ajouter facilement des utilisateurs à des groupes Active Directory, soit individuellement, soit en masse selon des critères précis, tout en vérifiant les membres actuels de chaque groupe pour s’assurer de la configuration correcte.
