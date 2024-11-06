# 📘 Guide pour supprimer un compte utilisateur dans Active Directory avec PowerShell

Ce guide explique comment supprimer des comptes utilisateurs dans Active Directory (AD) à l’aide de PowerShell. Vous apprendrez à supprimer un utilisateur spécifique, à identifier les comptes désactivés, et à exécuter des suppressions en bloc avec des filtres. 

---

## ✅ Commandes pour supprimer des comptes utilisateurs

### 1️⃣ Supprimer un compte utilisateur sans confirmation

Si vous souhaitez supprimer un utilisateur de manière directe sans confirmation, utilisez `-Confirm:$false` pour éviter les prompts de validation.

```powershell
# Supprime le compte utilisateur "jlebon" sans demander de confirmation
Remove-ADUser -Identity jlebon -Confirm:$false
```

- **But** : Supprimer immédiatement le compte `jlebon` de l’Active Directory sans prompt de confirmation.
- **Explication** :
  - `Remove-ADUser` : Cmdlet pour supprimer un utilisateur dans Active Directory.
  - `-Identity jlebon` : Identifie l’utilisateur à supprimer en utilisant son nom d’identité.
  - `-Confirm:$false` : Supprime l’utilisateur sans confirmation, ce qui est utile pour l’automatisation. **Attention** : utilisez avec prudence pour éviter les suppressions accidentelles.

---

### 2️⃣ Supprimer un compte utilisateur avec confirmation

Si vous souhaitez une sécurité supplémentaire lors de la suppression d’un compte, omettez `-Confirm:$false`. Cela permettra de confirmer chaque suppression.

```powershell
# Supprime le compte utilisateur "jlebon" avec confirmation
Remove-ADUser -Identity jlebon
```

- **But** : Supprimer le compte `jlebon` tout en confirmant manuellement l’action.
- **Explication** : PowerShell demandera une confirmation avant de supprimer l’utilisateur, ce qui est une bonne pratique pour éviter les suppressions accidentelles.

---

## ✅ Suppression en bloc de comptes désactivés

Dans certains cas, il peut être utile de supprimer plusieurs utilisateurs désactivés. Vous pouvez identifier ces comptes, puis les supprimer en utilisant PowerShell.

### 3️⃣ Lister les utilisateurs désactivés dans Active Directory

Pour lister les utilisateurs désactivés avant de les supprimer, utilisez la commande suivante :

```powershell
# Récupère tous les utilisateurs désactivés (sauf "krbtgt" et "Invité")
$UtilisateursDesactives = Get-ADUser -Filter "Enabled -eq '$false' -and Name -ne 'krbtgt' -and Name -ne 'Invité'"
```

- **But** : Lister tous les utilisateurs désactivés, à l’exception de certains comptes système comme `krbtgt` et `Invité`.
- **Explication** :
  - `Get-ADUser -Filter "Enabled -eq '$false'"` : Filtre pour récupérer uniquement les comptes désactivés.
  - `-and Name -ne 'krbtgt'` : Exclut le compte `krbtgt`, utilisé par le service Kerberos.
  - `-and Name -ne 'Invité'` : Exclut le compte `Invité`, souvent utilisé pour les accès temporaires.

### 4️⃣ Suppression en bloc des comptes désactivés avec simulation

Avant de procéder à la suppression réelle, il est conseillé de simuler l’opération en utilisant `-WhatIf`, ce qui permet de voir ce qui se passerait sans réellement supprimer les comptes.

```powershell
# Simule la suppression des utilisateurs désactivés
$UtilisateursDesactives | ForEach-Object { Remove-ADUser -Identity $_.Name -WhatIf }
```

- **But** : Simuler la suppression de chaque utilisateur désactivé dans la liste `$UtilisateursDesactives`.
- **Explication** :
  - `ForEach-Object` : Parcourt chaque utilisateur dans `$UtilisateursDesactives`.
  - `Remove-ADUser -WhatIf` : Affiche ce qui se passerait sans effectuer l’opération. C’est utile pour vérifier que la commande fonctionne comme prévu avant d’exécuter la suppression réelle.

### 5️⃣ Suppression en bloc des comptes désactivés (exécution réelle)

Une fois que vous êtes sûr des comptes à supprimer, exécutez la suppression sans `-WhatIf` pour supprimer les utilisateurs désactivés.

```powershell
# Supprime les utilisateurs désactivés
$UtilisateursDesactives | ForEach-Object { Remove-ADUser -Identity $_.Name -Confirm:$false }
```

- **But** : Supprimer tous les utilisateurs désactivés dans `$UtilisateursDesactives` sans confirmation individuelle.
- **Explication** : 
  - `-Confirm:$false` : Supprime chaque utilisateur sans confirmation, permettant une suppression en bloc. **Attention** : Assurez-vous d’avoir bien vérifié la liste avant d'exécuter cette commande pour éviter des suppressions accidentelles.

---

### 📝 Remarques importantes

- **Précautions** : Lors de la suppression en bloc d’utilisateurs, vérifiez toujours la liste en utilisant `-WhatIf` pour éviter des erreurs.
- **Comptes système** : Certains comptes (comme `krbtgt` et `Invité`) sont utilisés par le système et ne doivent généralement pas être supprimés. Assurez-vous d'exclure ces comptes de la liste.
- **Permissions** : Le compte exécutant ces commandes doit disposer de droits administratifs dans AD pour pouvoir supprimer des utilisateurs.

---

### 🎯 Conclusion

Ce guide vous permet de supprimer des comptes utilisateurs de manière sécurisée dans Active Directory en utilisant PowerShell. Les options `-WhatIf` et `-Confirm` fournissent un contrôle supplémentaire pour éviter des erreurs lors des suppressions en bloc, tout en permettant une gestion automatisée des utilisateurs désactivés. Utilisez ces commandes avec prudence pour maintenir un environnement AD propre et sécurisé.
