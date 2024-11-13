## 📚 Cours détaillé : Supprimer un ordinateur dans Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser PowerShell pour supprimer des objets ordinateur dans Active Directory (AD) avec la commande `Remove-ADComputer`. Cette commande permet de supprimer des ordinateurs spécifiques ou plusieurs ordinateurs répondant à des critères définis.

---

# ✨ Résumé des commandes

```powershell
# 🗑️ Supprime l'ordinateur nommé "PCtest3" sans demander de confirmation
Remove-ADComputer -Identity PCtest3 -Confirm:$false

# 🔄 Récupère les ordinateurs désactivés dans une OU spécifique et simule leur suppression
$OrdinateursDesactives = Get-ADComputer -Filter "Enabled -eq '$false'" -SearchBase "CN=Computers,DC=lab,DC=lan"
$OrdinateursDesactives | ForEach-Object { Remove-ADComputer -Identity $_.Name -WhatIf }
```

---

# 🗑️ Commande 1 : Supprimer un ordinateur spécifique sans confirmation

```powershell
Remove-ADComputer -Identity PCtest3 -Confirm:$false
```

**Détails :**
- **Remove-ADComputer** : Commande pour supprimer un objet ordinateur dans AD.
- **`-Identity PCtest3`** : Spécifie l’ordinateur à supprimer, ici "PCtest3".
- **`-Confirm:$false`** : Supprime l'ordinateur sans demander de confirmation.

Cette commande est utile pour supprimer un ordinateur spécifique de manière rapide.

---

# 🔄 Commande 2 : Supprimer plusieurs ordinateurs désactivés dans une OU spécifique (en simulation)

```powershell
$OrdinateursDesactives = Get-ADComputer -Filter "Enabled -eq '$false'" -SearchBase "CN=Computers,DC=lab,DC=lan"
$OrdinateursDesactives | ForEach-Object { Remove-ADComputer -Identity $_.Name -WhatIf }
```

**Détails :**
1. **Get-ADComputer -Filter "Enabled -eq '$false'" -SearchBase "CN=Computers,DC=lab,DC=lan"** : Récupère tous les ordinateurs désactivés dans l’OU spécifiée "CN=Computers,DC=lab,DC=lan".
2. **ForEach-Object { Remove-ADComputer -Identity $_.Name -WhatIf }** : Simule la suppression de chaque ordinateur en utilisant `-WhatIf`, ce qui permet de vérifier sans exécuter la suppression.

Cette commande est particulièrement utile pour identifier les ordinateurs désactivés avant de confirmer leur suppression dans un environnement réel.

---

### 📝 Résumé

Ces commandes PowerShell permettent de supprimer des ordinateurs Active Directory individuellement ou en masse en fonction de critères spécifiques, comme l'état activé/désactivé. L'option `-WhatIf` est très utile pour tester la commande avant de l'exécuter réellement, offrant ainsi une gestion plus sécurisée des ressources AD.
