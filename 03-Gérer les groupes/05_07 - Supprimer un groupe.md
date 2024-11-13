## 📚 Cours détaillé : Supprimer un groupe Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser PowerShell pour supprimer des groupes Active Directory (AD) avec la commande `Remove-ADGroup`. Ces commandes permettent de supprimer des groupes spécifiques, de manière ciblée ou automatisée, selon certains critères.

---

# ✨ Résumé des commandes

```powershell
# 🔍 Vérifie l'existence et les informations du groupe "GroupeTest1"
Get-ADGroup -Identity GroupeTest1

# 🗑️ Supprime le groupe "GroupeTest1"
Remove-ADGroup -Identity GroupeTest1

# 🔍 Vérifie à nouveau pour confirmer la suppression
Get-ADGroup -Identity GroupeTest1

# 🔄 Récupère tous les groupes dans l'unité organisationnelle "OUTest"
$Groupes = Get-ADGroup -Filter * -SearchBase "OU=OUTest,DC=lab,DC=lan"

foreach($Groupe in $Groupes)
{
   # 📊 Compte le nombre de membres dans chaque groupe
   $NombreMembre = (Get-ADGroupMember -Identity $Groupe | Measure-Object).count

   Write-Host "Le groupe $($Groupe.Name) contient $($NombreMembre) membre(s)"

   # 🗑️ Supprime le groupe si le nombre de membres est égal à 0
   if($NombreMembre -eq 0)
   {
     Remove-ADGroup -Identity $Groupe.Name -Confirm:$false
   }
}

# 🗑️ Supprime le groupe "GroupeLyon" sur un serveur AD spécifique sans confirmation
Remove-ADGroup -Identity GroupeLyon -Server paris.lab.lan -Confirm:$false
```

---

# 🔍 Commande 1 : Vérifier l'existence et les informations d'un groupe

```powershell
Get-ADGroup -Identity GroupeTest1
```

**Détails :**
- **Get-ADGroup** : Affiche les informations d’un groupe AD pour vérifier son existence.
- **`-Identity GroupeTest1`** : Spécifie le groupe cible, ici "GroupeTest1".

Cette commande permet de consulter les informations du groupe avant de le supprimer.

---

# 🗑️ Commande 2 : Supprimer un groupe spécifique

```powershell
Remove-ADGroup -Identity GroupeTest1
```

**Détails :**
- **Remove-ADGroup** : Supprime un groupe AD spécifié.
- **`-Identity GroupeTest1`** : Spécifie le groupe à supprimer, ici "GroupeTest1".

Cette commande retire complètement le groupe "GroupeTest1" d'Active Directory.

---

# 🔍 Commande 3 : Vérifier la suppression d'un groupe

```powershell
Get-ADGroup -Identity GroupeTest1
```

**Détails :**
- Cette commande permet de vérifier si le groupe a bien été supprimé d'AD en consultant à nouveau les informations du groupe "GroupeTest1".

---

# 🔄 Commande 4 : Supprimer automatiquement les groupes vides dans une unité organisationnelle (OU)

```powershell
$Groupes = Get-ADGroup -Filter * -SearchBase "OU=OUTest,DC=lab,DC=lan"
```

**Détails :**
- **Get-ADGroup -Filter * -SearchBase "OU=OUTest,DC=lab,DC=lan"** : Récupère tous les groupes de l’OU spécifiée.
- **$Groupes** : Stocke la liste des groupes récupérés pour traitement dans une boucle.

---

# 📊 Commande 5 : Boucle pour vérifier le nombre de membres et supprimer les groupes vides

```powershell
foreach($Groupe in $Groupes)
{
   $NombreMembre = (Get-ADGroupMember -Identity $Groupe | Measure-Object).count
   Write-Host "Le groupe $($Groupe.Name) contient $($NombreMembre) membre(s)"

   if($NombreMembre -eq 0)
   {
     Remove-ADGroup -Identity $Groupe.Name -Confirm:$false
   }
}
```

**Détails :**
- **foreach($Groupe in $Groupes)** : Parcourt chaque groupe de l'OU.
- **(Get-ADGroupMember -Identity $Groupe | Measure-Object).count** : Compte le nombre de membres de chaque groupe.
- **Write-Host** : Affiche le nom et le nombre de membres de chaque groupe.
- **if($NombreMembre -eq 0)** : Vérifie si le groupe est vide.
- **Remove-ADGroup -Identity $Groupe.Name -Confirm:$false** : Supprime le groupe si le nombre de membres est égal à zéro, sans demander confirmation.

Cette boucle supprime automatiquement les groupes vides de l'OU "OUTest".

---

# 🗑️ Commande 6 : Supprimer un groupe sur un serveur AD spécifique sans confirmation

```powershell
Remove-ADGroup -Identity GroupeLyon -Server paris.lab.lan -Confirm:$false
```

**Détails :**
- **`-Server paris.lab.lan`** : Spécifie le serveur AD sur lequel la commande doit être exécutée.
- **`-Confirm:$false`** : Supprime le groupe sans demander de confirmation.

Cette commande permet de cibler un serveur AD spécifique pour supprimer un groupe en évitant les confirmations.

---

### 📝 Résumé

Ces commandes PowerShell permettent de supprimer des groupes Active Directory de manière ciblée ou en bloc. Vous pouvez vérifier l'existence d'un groupe, le supprimer immédiatement, ou automatiser la suppression de groupes vides dans une OU spécifique, ce qui facilite la gestion des groupes inutilisés dans AD.
