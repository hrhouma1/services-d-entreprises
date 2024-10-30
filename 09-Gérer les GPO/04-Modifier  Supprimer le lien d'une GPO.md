# Guide : Modification et Suppression du Lien d'une GPO

Ce guide vous explique comment modifier et supprimer le lien d’une stratégie de groupe (GPO) dans Active Directory à l’aide de PowerShell. Vous verrez comment appliquer une GPO de manière forcée, désactiver son lien, ou supprimer le lien d’une OU.

## Prérequis
Assurez-vous d'avoir les droits d’administrateur et les permissions nécessaires pour modifier et supprimer les liens de GPO dans Active Directory. Exécutez PowerShell en tant qu'administrateur.

### 1. Appliquer une GPO de manière forcée : `Set-GPLink -Name test -Target "OU=OUTest,DC=lab,DC=lan" -Enforced Yes`

```powershell
Set-GPLink -Name test -Target "OU=OUTest,DC=lab,DC=lan" -Enforced Yes
```

Cette commande force l'application de la GPO nommée **test** sur l’unité organisationnelle spécifiée (`OU=OUTest,DC=lab,DC=lan`). Lorsqu’une GPO est forcée, elle s'applique en priorité sur d'autres GPO potentiellement en conflit dans la hiérarchie de l'Active Directory.

- **Paramètres** :
  - `-Name` : nom de la GPO.
  - `-Target` : chemin de l'OU où appliquer la GPO.
  - `-Enforced` : spécifie que la GPO est appliquée de manière forcée (`Yes`).

- **Résultat** :
  - La GPO **test** est appliquée de manière prioritaire et forcée sur l’OU cible, prenant le dessus sur les autres stratégies en cas de conflits.

### 2. Désactiver le lien d’une GPO : `Set-GPLink -Name test -Target "OU=OUTest,DC=lab,DC=lan" -LinkEnabled No`

```powershell
Set-GPLink -Name test -Target "OU=OUTest,DC=lab,DC=lan" -LinkEnabled No
```

Cette commande désactive le lien de la GPO sur l’OU spécifiée (`OU=OUTest,DC=lab,DC=lan`). Lorsque le lien d’une GPO est désactivé, la GPO n’a plus d'effet sur l'OU ciblée, mais elle reste active et peut être appliquée ailleurs si elle est liée à d'autres OUs.

- **Paramètres** :
  - `-Name` : nom de la GPO.
  - `-Target` : chemin de l'OU où le lien est désactivé.
  - `-LinkEnabled` : désactive le lien (`No`).

- **Résultat** :
  - Le lien de la GPO **test** sur l'OU est désactivé, ce qui empêche l’application de cette stratégie sur l’OU. La GPO reste cependant intacte et utilisable dans d’autres contextes.

### 3. Supprimer le lien d’une GPO : `Remove-GPLink -Name test -Target "OU=OUTest,DC=lab,DC=lan"`

```powershell
Remove-GPLink -Name test -Target "OU=OUTest,DC=lab,DC=lan"
```

Cette commande supprime complètement le lien de la GPO nommée **test** pour l'OU spécifiée (`OU=OUTest,DC=lab,DC=lan`). Contrairement à la désactivation, cette action retire entièrement l’association de la GPO avec l’OU, ce qui signifie qu'elle ne s'appliquera plus du tout à l’OU ciblée.

- **Paramètres** :
  - `-Name` : nom de la GPO.
  - `-Target` : chemin de l'OU pour laquelle le lien est supprimé.

- **Résultat** :
  - La GPO **test** n'est plus liée à l'OU, supprimant ainsi toute influence de cette stratégie sur les objets présents dans cette unité organisationnelle.

---

Ces commandes permettent de gérer finement l'application des GPO dans Active Directory. En utilisant le forçage, la désactivation, ou la suppression des liens, vous pouvez mieux contrôler l'impact des GPO et résoudre les conflits de stratégie efficacement dans votre domaine.
