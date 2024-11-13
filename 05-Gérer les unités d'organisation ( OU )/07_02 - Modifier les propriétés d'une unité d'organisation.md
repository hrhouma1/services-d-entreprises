## 📚 Cours détaillé : Modifier les propriétés d'une unité d'organisation dans Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser PowerShell pour modifier les propriétés d'une unité d'organisation (OU) dans Active Directory (AD) avec la commande `Set-ADOrganizationalUnit`. Cette commande permet d'ajouter ou de mettre à jour des descriptions, des attributs personnalisés, et des paramètres de sécurité des OUs.

---

# ✨ Résumé des commandes

```powershell
# 📋 Lister les noms et chemins des unités d'organisation dans Active Directory
Get-ADOrganizationalUnit -Filter * | Select-Object name, distinguishedname

# ✏️ Modifier la description de l'unité d'organisation "OUTest"
Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Description "Test description"

# ➕ Ajouter un nouvel attribut "l" avec la valeur "test" à l'OU "OUTest"
Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Add @{l="test"}

# 🔄 Remplacer la valeur de l'attribut "l" par "modifiée" dans l'OU "OUTest"
Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Replace @{l="modifiée"}

# 🧹 Supprimer l'attribut "l" de l'OU "OUTest"
Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Clear l

# 🔒 Protéger l'OU "OUTest" contre la suppression accidentelle
Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -ProtectedFromAccidentalDeletion $true

# 🌍 Modifier le pays de toutes les unités d'organisation en "FR"
Get-ADOrganizationalUnit -Filter * | Set-ADOrganizationalUnit -Country FR
```

---

# 📋 Commande 1 : Lister les noms et chemins des unités d'organisation

```powershell
Get-ADOrganizationalUnit -Filter * | Select-Object name, distinguishedname
```

**Détails :**
- **Get-ADOrganizationalUnit -Filter * | Select-Object name, distinguishedname** : Liste toutes les unités d'organisation avec leur nom et leur chemin complet (DN - Distinguished Name).

Cette commande permet d'obtenir une vue d'ensemble des OUs dans le domaine AD.

---

# ✏️ Commande 2 : Modifier la description d'une OU

```powershell
Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Description "Test description"
```

**Détails :**
- **Set-ADOrganizationalUnit** : Utilisé pour modifier les propriétés d'une unité d'organisation.
- **`-Description "Test description"`** : Met à jour la description de l'OU avec la valeur "Test description".

Cette commande permet d’ajouter des informations descriptives à une OU.

---

# ➕ Commande 3 : Ajouter un nouvel attribut personnalisé à une OU

```powershell
Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Add @{l="test"}
```

**Détails :**
- **`-Add @{l="test"}`** : Ajoute un nouvel attribut "l" avec la valeur "test".

Cette commande est utile pour ajouter des informations supplémentaires sous forme d'attributs personnalisés.

---

# 🔄 Commande 4 : Remplacer la valeur d'un attribut

```powershell
Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Replace @{l="modifiée"}
```

**Détails :**
- **`-Replace @{l="modifiée"}`** : Remplace la valeur de l'attribut "l" par "modifiée".

Cette commande permet de mettre à jour des informations sans ajouter de nouveaux attributs.

---

# 🧹 Commande 5 : Supprimer un attribut d'une OU

```powershell
Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Clear l
```

**Détails :**
- **`-Clear l`** : Supprime l'attribut "l" de l'OU spécifiée.

Cette commande est utilisée pour supprimer des informations devenues obsolètes ou inutiles.

---

# 🔒 Commande 6 : Protéger une OU contre la suppression accidentelle

```powershell
Set-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -ProtectedFromAccidentalDeletion $true
```

**Détails :**
- **`-ProtectedFromAccidentalDeletion $true`** : Active la protection contre la suppression accidentelle pour cette OU.

Cela empêche la suppression accidentelle des OUs importantes, ajoutant une couche de sécurité supplémentaire.

---

# 🌍 Commande 7 : Modifier le pays pour toutes les OUs

```powershell
Get-ADOrganizationalUnit -Filter * | Set-ADOrganizationalUnit -Country FR
```

**Détails :**
- **Get-ADOrganizationalUnit -Filter * | Set-ADOrganizationalUnit -Country FR** : Récupère toutes les OUs et définit leur pays sur "FR" (France).

Cette commande permet d’appliquer une mise à jour commune à toutes les unités d'organisation.

---

### 📝 Résumé

Ces commandes PowerShell permettent de modifier les propriétés des unités d'organisation dans Active Directory de manière flexible et sécurisée. Que ce soit pour mettre à jour des descriptions, ajouter ou remplacer des attributs, protéger une OU contre la suppression accidentelle ou appliquer des changements à plusieurs OUs, ces commandes simplifient la gestion des OUs dans un environnement AD.
