## 📚 Cours détaillé : Récupérer des informations sur les ordinateurs Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser la commande `Get-ADComputer` de PowerShell pour récupérer des informations sur les ordinateurs dans Active Directory (AD). Cette commande permet de lister, filtrer, et afficher des détails spécifiques sur les ordinateurs configurés dans le domaine AD.

---

# ✨ Résumé des commandes

```powershell
# 🖥️ Affiche les informations de base des ordinateurs dans Active Directory
Get-ADComputer

# 🔍 Liste tous les ordinateurs dans Active Directory
Get-ADComputer -Filter *

# 📋 Liste tous les ordinateurs et affiche uniquement leurs noms
Get-ADComputer -Filter * | Select-Object Name

# 🌐 Liste tous les ordinateurs avec toutes leurs propriétés
Get-ADComputer -Filter * -Properties *

# ✅ Liste tous les ordinateurs activés uniquement
Get-ADComputer -Filter "Enabled -eq '$true'"

# 🎯 Récupère les informations de l'ordinateur nommé "DC01"
Get-ADComputer -Filter "Name -eq 'DC01'"

# 🌐 Récupère toutes les propriétés de l'ordinateur nommé "DC01"
Get-ADComputer -Filter "Name -eq 'DC01'" -Properties *

# 💻 Récupère le système d'exploitation de l'ordinateur nommé "DC01"
Get-ADComputer -Filter "Name -eq 'DC01'" -Properties OperatingSystem

# 🖥️ Liste tous les ordinateurs avec un système d'exploitation contenant "Server" et affiche leurs noms et OS
Get-ADComputer -Filter "OperatingSystem -like '*Server*'" -Properties OperatingSystem | Select-Object Name, OperatingSystem
```

---

# 🖥️ Commande 1 : Afficher les informations de base des ordinateurs

```powershell
Get-ADComputer
```

**Détails :**
- **Get-ADComputer** : Affiche les informations de base des ordinateurs enregistrés dans Active Directory.

---

# 🔍 Commande 2 : Lister tous les ordinateurs dans Active Directory

```powershell
Get-ADComputer -Filter *
```

**Détails :**
- **`-Filter *`** : En utilisant `*` comme filtre, cette commande liste tous les ordinateurs disponibles dans Active Directory.

---

# 📋 Commande 3 : Afficher uniquement les noms des ordinateurs

```powershell
Get-ADComputer -Filter * | Select-Object Name
```

**Détails :**
- **`Select-Object Name`** : Sélectionne uniquement le nom de chaque ordinateur.

Cette commande permet d'afficher une liste concise des noms des ordinateurs sans autres détails.

---

# 🌐 Commande 4 : Lister tous les ordinateurs avec toutes leurs propriétés

```powershell
Get-ADComputer -Filter * -Properties *
```

**Détails :**
- **`-Properties *`** : Affiche toutes les propriétés disponibles pour chaque ordinateur.

Cette commande est utile pour afficher tous les détails des ordinateurs, comme le système d’exploitation, les descriptions, etc.

---

# ✅ Commande 5 : Lister uniquement les ordinateurs activés

```powershell
Get-ADComputer -Filter "Enabled -eq '$true'"
```

**Détails :**
- **`Filter "Enabled -eq '$true'"`** : Filtre pour afficher uniquement les ordinateurs qui sont activés dans Active Directory.

---

# 🎯 Commande 6 : Récupérer les informations d'un ordinateur spécifique

```powershell
Get-ADComputer -Filter "Name -eq 'DC01'"
```

**Détails :**
- **`Filter "Name -eq 'DC01'"`** : Filtre pour récupérer les informations de l'ordinateur nommé "DC01".

Cette commande permet de cibler un ordinateur spécifique pour consulter ses détails de base.

---

# 🌐 Commande 7 : Récupérer toutes les propriétés d'un ordinateur spécifique

```powershell
Get-ADComputer -Filter "Name -eq 'DC01'" -Properties *
```

**Détails :**
- **`-Properties *`** : Récupère toutes les propriétés de l'ordinateur nommé "DC01".

Cette commande permet d’afficher tous les détails disponibles d’un ordinateur spécifique.

---

# 💻 Commande 8 : Récupérer uniquement le système d'exploitation d'un ordinateur spécifique

```powershell
Get-ADComputer -Filter "Name -eq 'DC01'" -Properties OperatingSystem
```

**Détails :**
- **`-Properties OperatingSystem`** : Récupère uniquement le système d'exploitation de l'ordinateur "DC01".

Cela permet de limiter les informations récupérées en n'affichant que le système d'exploitation.

---

# 🖥️ Commande 9 : Lister les ordinateurs avec un système d'exploitation spécifique

```powershell
Get-ADComputer -Filter "OperatingSystem -like '*Server*'" -Properties OperatingSystem | Select-Object Name, OperatingSystem
```

**Détails :**
- **`Filter "OperatingSystem -like '*Server*'"`** : Filtre les ordinateurs dont le système d'exploitation contient "Server".
- **`Select-Object Name, OperatingSystem`** : Affiche uniquement le nom et le système d'exploitation de chaque ordinateur.

Cette commande est utile pour lister tous les serveurs ou autres ordinateurs exécutant un système spécifique.

---

### 📝 Résumé

Ces commandes PowerShell permettent de récupérer des informations spécifiques ou globales sur les ordinateurs Active Directory, que ce soit pour afficher leurs noms, leurs propriétés complètes, leur statut activé/désactivé, ou des détails précis comme le système d'exploitation. Elles permettent une gestion simplifiée et ciblée des ordinateurs dans un environnement AD.
