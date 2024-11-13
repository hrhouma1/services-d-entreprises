## 📚 Cours détaillé : Lister et récupérer des informations sur un groupe Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser la commande `Get-ADGroup` de PowerShell pour récupérer des informations sur les groupes Active Directory (AD). Cette commande permet d'afficher les détails des groupes pour faciliter la gestion et le suivi.

---

# ✨ Résumé des commandes

```powershell
# 🛠️ Récupère un groupe spécifique en utilisant son nom
Get-ADGroup

# 🔍 Liste tous les groupes dans Active Directory
Get-ADGroup -Filter *

# 🎯 Récupère un groupe spécifique en fonction de son nom, ici "GroupeTest1"
Get-ADGroup -Identity GroupeTest1

# 🌐 Récupère toutes les propriétés d'un groupe spécifique
Get-ADGroup -Identity GroupeTest1 -Properties *

# 🗄️ Liste tous les groupes situés dans une unité organisationnelle (OU) spécifique
Get-ADGroup -Filter * -SearchBase "CN=Computers,DC=lab,DC=lan"

# 🔎 Filtre les groupes ayant une portée locale au domaine et affiche uniquement les noms et la portée
Get-ADGroup -Filter "GroupScope -eq 'DomainLocal'" | Select-Object Name, GroupScope

# 🔎 Filtre les groupes globaux et affiche uniquement les noms et la portée
Get-ADGroup -Filter "GroupScope -eq 'Global'" | Select-Object Name, GroupScope

# 📊 Compte le nombre total de groupes dans Active Directory
(Get-ADGroup -Filter *).count

# 🌍 Liste tous les groupes sur un serveur AD spécifique
Get-ADGroup -Filter * -Server paris.lab.lan
```

---

# 🛠️ Commande 1 : Récupérer un groupe spécifique

```powershell
Get-ADGroup
```

**Détails :**
- **Get-ADGroup** : Cette commande permet de récupérer les informations de base d’un groupe. Elle affiche les groupes AD configurés dans le domaine par défaut.

---

# 🔍 Commande 2 : Lister tous les groupes dans Active Directory

```powershell
Get-ADGroup -Filter *
```

**Détails :**
- **`-Filter *`** : En utilisant le filtre `*`, cette commande liste tous les groupes disponibles dans Active Directory, sans appliquer de filtre.

---

# 🎯 Commande 3 : Récupérer un groupe spécifique par nom

```powershell
Get-ADGroup -Identity GroupeTest1
```

**Détails :**
- **`-Identity`** : Ce paramètre permet de rechercher un groupe spécifique par son nom, ici "GroupeTest1".

---

# 🌐 Commande 4 : Récupérer toutes les propriétés d'un groupe spécifique

```powershell
Get-ADGroup -Identity GroupeTest1 -Properties *
```

**Détails :**
- **`-Properties *`** : Récupère toutes les propriétés du groupe, au-delà des informations de base, comme les descriptions, l'emplacement, etc.

---

# 🗄️ Commande 5 : Lister les groupes dans une OU spécifique

```powershell
Get-ADGroup -Filter * -SearchBase "CN=Computers,DC=lab,DC=lan"
```

**Détails :**
- **`-SearchBase`** : Spécifie une unité organisationnelle (OU) pour filtrer les groupes qui s’y trouvent uniquement, ici "CN=Computers".

---

# 🔎 Commande 6 : Filtrer les groupes avec une portée "DomainLocal" et afficher certaines propriétés

```powershell
Get-ADGroup -Filter "GroupScope -eq 'DomainLocal'" | Select-Object Name, GroupScope
```

**Détails :**
- **`-Filter "GroupScope -eq 'DomainLocal'"`** : Filtre les groupes ayant une portée **DomainLocal**.
- **`| Select-Object Name, GroupScope`** : Affiche seulement le nom et la portée des groupes.

---

# 🔎 Commande 7 : Filtrer les groupes avec une portée "Global" et afficher certaines propriétés

```powershell
Get-ADGroup -Filter "GroupScope -eq 'Global'" | Select-Object Name, GroupScope
```

**Détails :**
- **`-Filter "GroupScope -eq 'Global'"`** : Filtre les groupes ayant une portée **Global**.
- **`| Select-Object Name, GroupScope`** : Affiche le nom et la portée de chaque groupe global.

---

# 📊 Commande 8 : Compter le nombre total de groupes dans Active Directory

```powershell
(Get-ADGroup -Filter *).count
```

**Détails :**
- **`.count`** : Compte le nombre total de groupes listés par la commande `Get-ADGroup -Filter *`.

---

# 🌍 Commande 9 : Lister tous les groupes sur un serveur Active Directory spécifique

```powershell
Get-ADGroup -Filter * -Server paris.lab.lan
```

**Détails :**
- **`-Server`** : Spécifie le serveur AD, ici "paris.lab.lan", pour afficher les groupes disponibles sur ce serveur spécifique.

---

### 📝 Résumé

Ces commandes permettent de gérer et de récupérer des informations spécifiques sur les groupes Active Directory. Que ce soit pour lister tous les groupes, filtrer par portée, récupérer toutes les propriétés d’un groupe, ou compter le nombre total de groupes, ces commandes sont essentielles pour une gestion efficace dans un environnement réseau.
