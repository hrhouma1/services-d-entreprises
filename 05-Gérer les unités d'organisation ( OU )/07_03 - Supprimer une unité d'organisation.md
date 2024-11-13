## 📚 Cours détaillé : Supprimer une unité d'organisation dans Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser PowerShell pour supprimer des unités d'organisation (OU) dans Active Directory (AD) avec la commande `Remove-ADOrganizationalUnit`. Cette commande permet de supprimer des OUs spécifiques ou de filtrer les OUs selon des critères pour les supprimer en masse.

---

# ✨ Résumé des commandes

```powershell
# 🗑️ Supprime une unité d'organisation nommée "OUTest" sans confirmation
Remove-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Confirm:$false

# 🔄 Récupère les OUs vides dans une unité spécifique et simule leur suppression
$OUsVides = Get-ADOrganizationalUnit -Filter * -SearchBase "OU=OUTest,DC=lab,DC=lan"
$OUsVides | ForEach-Object { Remove-ADOrganizationalUnit -Identity $_.DistinguishedName -WhatIf }
```

---

# 🗑️ Commande 1 : Supprimer une unité d'organisation spécifique sans confirmation

```powershell
Remove-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" -Confirm:$false
```

**Détails :**
- **Remove-ADOrganizationalUnit** : Commande pour supprimer une unité d'organisation dans AD.
- **`-Identity "OU=OUTest,DC=lab,DC=lan"`** : Spécifie l’unité d'organisation à supprimer, ici "OUTest".
- **`-Confirm:$false`** : Supprime l'unité d'organisation sans demander de confirmation.

Cette commande est utile pour supprimer rapidement une OU spécifique.

---

# 🔄 Commande 2 : Supprimer plusieurs unités d'organisation dans une OU spécifique (en simulation)

```powershell
$OUsVides = Get-ADOrganizationalUnit -Filter * -SearchBase "OU=OUTest,DC=lab,DC=lan"
$OUsVides | ForEach-Object { Remove-ADOrganizationalUnit -Identity $_.DistinguishedName -WhatIf }
```

**Détails :**
1. **Get-ADOrganizationalUnit -Filter * -SearchBase "OU=OUTest,DC=lab,DC=lan"** : Récupère toutes les OUs dans une unité organisationnelle spécifique, ici "OUTest".
2. **ForEach-Object { Remove-ADOrganizationalUnit -Identity $_.DistinguishedName -WhatIf }** : Simule la suppression de chaque OU récupérée en utilisant `-WhatIf`, ce qui permet de vérifier sans exécuter réellement la suppression.

Cette commande est particulièrement utile pour identifier les OUs à supprimer avant de confirmer leur suppression dans un environnement réel.

---

### 📝 Résumé

Ces commandes PowerShell permettent de supprimer des unités d'organisation dans Active Directory de manière ciblée ou en masse, en fonction de critères définis. L'option `-WhatIf` est précieuse pour simuler la commande et vérifier les résultats avant une suppression réelle, garantissant ainsi une gestion plus sécurisée des OUs dans AD.
