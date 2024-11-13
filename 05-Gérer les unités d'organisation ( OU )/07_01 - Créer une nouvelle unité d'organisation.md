## 📚 Cours détaillé : Créer une nouvelle unité d'organisation dans Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser la commande `New-ADOrganizationalUnit` de PowerShell pour créer des unités d'organisation (OU) dans Active Directory (AD). Cette commande permet de structurer et d’organiser les objets AD dans des OUs pour faciliter la gestion des utilisateurs, des ordinateurs et des groupes.

---

# ✨ Résumé des commandes

```powershell
# 🆕 Crée une unité d'organisation nommée "OUTest1"
New-ADOrganizationalUnit -Name OUTest1

# 📂 Crée une unité d'organisation nommée "OUTest3" dans une OU spécifique
New-ADOrganizationalUnit -Name OUTest3 -Path "OU=OUTest,DC=lab,DC=lan"

# 🔒 Crée une unité d'organisation nommée "OUTest5" protégée contre la suppression accidentelle
New-ADOrganizationalUnit -Name OUTest5 -ProtectedFromAccidentalDeletion $true

# 🔄 Crée plusieurs OUs avec une boucle et une description commune
$ListeOU = "TestOU1","TestOU2","TestOU3","TestOU4"
foreach($OU in $ListeOU) {
  New-ADOrganizationalUnit -Name $OU -Description "Test création OU" -ProtectedFromAccidentalDeletion $false
}

# 📋 Liste toutes les unités d'organisation et affiche uniquement leurs noms
Get-ADOrganizationalUnit -Filter * | Select-Object Name
```

---

# 🆕 Commande 1 : Créer une unité d'organisation simple

```powershell
New-ADOrganizationalUnit -Name OUTest1
```

**Détails :**
- **New-ADOrganizationalUnit** : Commande pour créer une nouvelle OU dans AD.
- **`-Name OUTest1`** : Spécifie le nom de la nouvelle OU, ici "OUTest1".

Cette commande crée une unité d'organisation de base dans AD avec le nom spécifié.

---

# 📂 Commande 2 : Créer une OU dans un chemin spécifique

```powershell
New-ADOrganizationalUnit -Name OUTest3 -Path "OU=OUTest,DC=lab,DC=lan"
```

**Détails :**
- **`-Path`** : Spécifie l’emplacement de la nouvelle OU dans une autre OU ou un domaine spécifique.

Cette commande permet de placer une OU à un endroit spécifique dans la hiérarchie AD.

---

# 🔒 Commande 3 : Créer une OU protégée contre la suppression accidentelle

```powershell
New-ADOrganizationalUnit -Name OUTest5 -ProtectedFromAccidentalDeletion $true
```

**Détails :**
- **`-ProtectedFromAccidentalDeletion $true`** : Active la protection contre la suppression accidentelle pour cette OU.

Cette commande est utile pour les OUs critiques qu’on souhaite protéger contre les suppressions accidentelles.

---

# 🔄 Commande 4 : Créer plusieurs OUs avec une boucle

```powershell
$ListeOU = "TestOU1","TestOU2","TestOU3","TestOU4"

foreach($OU in $ListeOU) {
  New-ADOrganizationalUnit -Name $OU -Description "Test création OU" -ProtectedFromAccidentalDeletion $false
}
```

**Détails :**
1. **$ListeOU** : Déclare une liste de noms pour les OUs à créer.
2. **foreach** : Utilise une boucle pour créer chaque OU de la liste avec la description "Test création OU" et sans protection contre la suppression accidentelle.

Cette commande permet d’automatiser la création de plusieurs OUs à la fois.

---

# 📋 Commande 5 : Lister toutes les unités d'organisation et afficher leurs noms

```powershell
Get-ADOrganizationalUnit -Filter * | Select-Object Name
```

**Détails :**
- **Get-ADOrganizationalUnit -Filter * | Select-Object Name** : Liste toutes les OUs et affiche uniquement leurs noms.

Cette commande est pratique pour vérifier la création de toutes les nouvelles OUs.

---

### 📝 Résumé

Ces commandes PowerShell permettent de créer des unités d'organisation dans Active Directory de manière flexible et sécurisée. Que ce soit pour créer une OU unique, en ajouter dans un emplacement spécifique, les protéger contre la suppression accidentelle, ou même en automatiser la création en masse, ces commandes simplifient la gestion des OUs dans un environnement AD.
