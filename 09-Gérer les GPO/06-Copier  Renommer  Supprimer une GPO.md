# Guide : Copier, Renommer et Supprimer une GPO

Ce guide vous explique comment copier, renommer et supprimer une stratégie de groupe (GPO) dans Active Directory en utilisant PowerShell. Ces opérations vous permettent de gérer et de réorganiser vos GPO, que ce soit pour créer des copies, ajuster les noms ou supprimer des GPO inutilisées.

## Prérequis
Assurez-vous d'avoir les droits d’administrateur et les permissions nécessaires pour gérer les GPO dans votre environnement Active Directory. Exécutez PowerShell en mode administrateur.

### 1. Copier une GPO : `Copy-GPO -SourceName test -TargetName testcopie`

```powershell
Copy-GPO -SourceName test -TargetName testcopie
```

Cette commande crée une copie de la GPO nommée **test** sous le nom **testcopie**. La nouvelle GPO aura les mêmes paramètres et configurations, mais elle ne sera pas liée aux mêmes unités organisationnelles.

- **Paramètres** :
  - `-SourceName` : nom de la GPO d’origine.
  - `-TargetName` : nom de la GPO de destination.

- **Résultat** :
  - Une nouvelle GPO appelée **testcopie** est créée avec les mêmes paramètres que la GPO **test**.

### 2. Copier une GPO avec les permissions d’accès (ACL) : `Copy-GPO -SourceName test -TargetName testcopie1 -CopyAcl`

```powershell
Copy-GPO -SourceName test -TargetName testcopie1 -CopyAcl
```

Cette commande crée une copie de la GPO **test** avec le nom **testcopie1** en incluant les permissions d’accès (ACL). Cela signifie que les utilisateurs et groupes ayant des permissions spécifiques sur la GPO d’origine auront les mêmes permissions sur la GPO copiée.

- **Paramètres** :
  - `-CopyAcl` : copie également les permissions d’accès de la GPO d’origine.

- **Résultat** :
  - Une nouvelle GPO appelée **testcopie1** est créée avec les mêmes paramètres et les mêmes permissions que la GPO **test**.

### 3. Renommer une GPO : `Rename-GPO -Name test -TargetName testrenommage`

```powershell
Rename-GPO -Name test -TargetName testrenommage
```

Cette commande modifie le nom de la GPO **test** en **testrenommage**. Renommer une GPO peut être utile pour clarifier son rôle ou l’organiser selon une nouvelle convention de nommage.

- **Paramètres** :
  - `-Name` : nom actuel de la GPO.
  - `-TargetName` : nouveau nom souhaité pour la GPO.

- **Résultat** :
  - La GPO **test** est renommée **testrenommage** sans affecter ses configurations ou ses liens avec les OUs.

### 4. Supprimer une GPO : `Remove-GPO -Name testgpo1`

```powershell
Remove-GPO -Name testgpo1
```

Cette commande supprime définitivement la GPO nommée **testgpo1** du domaine Active Directory. La suppression d'une GPO est irréversible, alors assurez-vous qu’elle n’est plus nécessaire avant d’exécuter cette commande.

- **Paramètres** :
  - `-Name` : nom de la GPO à supprimer.

- **Résultat** :
  - La GPO **testgpo1** est supprimée du domaine et ne peut plus être récupérée.

