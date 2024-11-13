## 📚 Cours détaillé : Lister les membres d'un groupe Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser `Get-ADGroupMember` pour afficher les membres d'un groupe Active Directory (AD). Cette commande permet de visualiser les utilisateurs et autres objets appartenant à un groupe spécifique.

---

# ✨ Résumé des commandes

```powershell
# 👥 Liste tous les membres du groupe "Administrateurs"
Get-ADGroupMember -Identity "Administrateurs"

# 📊 Compte le nombre total de membres dans le groupe "Administrateurs"
(Get-ADGroupMember -Identity "Administrateurs").Count

# 🔄 Récupère les noms des membres du groupe "groupetest1" et vérifie si "DC01" est présent
$RecupGroupes = Get-ADGroupMember -Identity groupetest1 | Select-Object -ExpandProperty Name
$RecupGroupes -contains 'DC01'

# 🌍 Liste les membres du groupe "Administrateurs" sur un serveur AD spécifique
Get-ADGroupMember -Identity "Administrateurs" -Server paris.lab.lan
```

---

# 👥 Commande 1 : Lister tous les membres d'un groupe

```powershell
Get-ADGroupMember -Identity "Administrateurs"
```

**Détails :**
- **Get-ADGroupMember** : Cette commande affiche les membres d’un groupe AD.
- **`-Identity "Administrateurs"`** : Indique le nom du groupe dont on souhaite voir les membres, ici "Administrateurs".

---

# 📊 Commande 2 : Compter le nombre total de membres dans un groupe

```powershell
(Get-ADGroupMember -Identity "Administrateurs").Count
```

**Détails :**
- **`.Count`** : Compte le nombre de membres du groupe "Administrateurs" en utilisant `Get-ADGroupMember`.

---

# 🔄 Commande 3 : Récupérer les noms des membres et vérifier la présence d’un membre spécifique

```powershell
$RecupGroupes = Get-ADGroupMember -Identity groupetest1 | Select-Object -ExpandProperty Name
$RecupGroupes -contains 'DC01'
```

**Détails :**
- **`Select-Object -ExpandProperty Name`** : Récupère uniquement le nom des membres du groupe "groupetest1".
- **`-contains 'DC01'`** : Vérifie si un membre nommé "DC01" est présent dans le groupe.

Cette commande permet de récupérer la liste des membres sous forme de noms et de vérifier rapidement si un membre spécifique fait partie du groupe.

---

# 🌍 Commande 4 : Lister les membres d'un groupe sur un serveur AD spécifique

```powershell
Get-ADGroupMember -Identity "Administrateurs" -Server paris.lab.lan
```

**Détails :**
- **`-Server paris.lab.lan`** : Indique un serveur AD spécifique (ici "paris.lab.lan") pour afficher les membres du groupe "Administrateurs".

Cette commande est utile pour les environnements avec plusieurs serveurs Active Directory, où vous souhaitez consulter les membres d'un groupe sur un serveur spécifique.

---

### 📝 Résumé

Ces commandes PowerShell permettent de lister et de gérer les membres d'un groupe Active Directory, de vérifier leur présence, de compter leur nombre, et de spécifier des serveurs AD. Elles sont utiles pour suivre et gérer les utilisateurs dans un environnement AD.
