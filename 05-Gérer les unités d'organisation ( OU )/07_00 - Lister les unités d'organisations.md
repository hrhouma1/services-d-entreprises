## 📚 Cours détaillé : Lister les unités d'organisation dans Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser la commande `Get-ADOrganizationalUnit` pour récupérer des informations sur les unités d'organisation (OU) dans Active Directory (AD). Cette commande permet de lister toutes les unités d'organisation, de filtrer selon des critères spécifiques, et de vérifier certaines propriétés comme la protection contre la suppression accidentelle.

---

# ✨ Résumé des commandes

```powershell
# 📋 Liste toutes les unités d'organisation dans Active Directory
Get-ADOrganizationalUnit -Filter *

# 📝 Liste les noms de toutes les unités d'organisation
Get-ADOrganizationalUnit -Filter * | Select-Object Name

# 🔍 Récupère toutes les propriétés de l'unité d'organisation nommée "OUTest"
Get-ADOrganizationalUnit -Filter "Name -eq 'OUTest'" -Properties *

# 🔢 Récupère une seule unité d'organisation parmi toutes
Get-ADOrganizationalUnit -Filter * -ResultSetSize 1

# 🔒 Liste les unités d'organisation protégées contre la suppression accidentelle
Get-ADOrganizationalUnit -Filter * -Properties ProtectedFromAccidentalDeletion | Where-Object {$_.ProtectedFromAccidentalDeletion -eq $true} | Select-Object Name,ProtectedFromAccidentalDeletion
```

---

# 📋 Commande 1 : Lister toutes les unités d'organisation

```powershell
Get-ADOrganizationalUnit -Filter *
```

**Détails :**
- **Get-ADOrganizationalUnit** : Commande pour lister les unités d'organisation dans AD.
- **`-Filter *`** : Utilise un filtre global (`*`) pour lister toutes les OUs sans restriction.

Cette commande affiche toutes les unités d'organisation disponibles dans le domaine.

---

# 📝 Commande 2 : Lister uniquement les noms des unités d'organisation

```powershell
Get-ADOrganizationalUnit -Filter * | Select-Object Name
```

**Détails :**
- **`Select-Object Name`** : Sélectionne et affiche uniquement le nom de chaque unité d'organisation.

Cela permet d’obtenir une vue simplifiée des noms des OUs sans autres informations.

---

# 🔍 Commande 3 : Récupérer toutes les propriétés d'une unité d'organisation spécifique

```powershell
Get-ADOrganizationalUnit -Filter "Name -eq 'OUTest'" -Properties *
```

**Détails :**
- **`Filter "Name -eq 'OUTest'"`** : Filtre pour cibler l'unité d'organisation nommée "OUTest".
- **`-Properties *`** : Affiche toutes les propriétés de cette unité d'organisation.

Cette commande est utile pour obtenir des détails complets sur une OU spécifique.

---

# 🔢 Commande 4 : Récupérer une seule unité d'organisation

```powershell
Get-ADOrganizationalUnit -Filter * -ResultSetSize 1
```

**Détails :**
- **`-ResultSetSize 1`** : Limite le nombre de résultats à une seule unité d'organisation.

Cette commande est utilisée pour afficher uniquement la première OU trouvée dans le domaine.

---

# 🔒 Commande 5 : Lister les unités d'organisation protégées contre la suppression accidentelle

```powershell
Get-ADOrganizationalUnit -Filter * -Properties ProtectedFromAccidentalDeletion | Where-Object {$_.ProtectedFromAccidentalDeletion -eq $true} | Select-Object Name,ProtectedFromAccidentalDeletion
```

**Détails :**
- **`-Properties ProtectedFromAccidentalDeletion`** : Inclut la propriété de protection contre la suppression accidentelle.
- **`Where-Object {$_.ProtectedFromAccidentalDeletion -eq $true}`** : Filtre pour ne garder que les OUs protégées.
- **`Select-Object Name,ProtectedFromAccidentalDeletion`** : Affiche uniquement le nom et l’état de protection contre la suppression accidentelle.

Cette commande est essentielle pour identifier les OUs sécurisées contre les suppressions accidentelles.

---

### 📝 Résumé

Ces commandes PowerShell permettent de lister, filtrer et afficher des informations spécifiques sur les unités d'organisation dans Active Directory. Elles sont particulièrement utiles pour obtenir une vue d'ensemble des OUs, récupérer des détails complets sur une OU spécifique, limiter les résultats, et vérifier la protection contre la suppression accidentelle pour une gestion plus sécurisée.
