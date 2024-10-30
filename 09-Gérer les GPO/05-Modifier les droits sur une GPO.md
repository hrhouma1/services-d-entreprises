# Guide : Modification des Droits sur une GPO

Ce guide explique comment modifier les permissions d'une stratégie de groupe (GPO) pour des groupes ou des utilisateurs dans Active Directory. Vous apprendrez à attribuer différents niveaux de droits, à vérifier les permissions et à appliquer des permissions en fonction de critères spécifiques.

## Prérequis
Pour exécuter ces commandes, assurez-vous d'avoir des droits d'administrateur dans Active Directory et d'exécuter PowerShell en tant qu’administrateur.

### 1. Accorder un accès en lecture seule à un groupe sur une GPO : `Set-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group -PermissionLevel GpoRead`

```powershell
Set-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group -PermissionLevel GpoRead
```

Cette commande donne au groupe nommé **GroupeTest1** des droits de **lecture seule** sur la GPO **test**. Le niveau d'accès **GpoRead** permet aux membres du groupe de consulter la GPO sans pouvoir la modifier.

- **Paramètres** :
  - `-Name` : nom de la GPO.
  - `-TargetName` : nom de la cible (ici, le groupe **GroupeTest1**).
  - `-TargetType` : type de la cible (ici, `Group`).
  - `-PermissionLevel` : niveau d’accès, ici **GpoRead** pour lecture seule.

- **Résultat** :
  - Les membres de **GroupeTest1** pourront visualiser la GPO **test**, mais ne pourront pas la modifier.

### 2. Accorder des droits de modification à un groupe sur une GPO : `Set-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group -PermissionLevel GpoEdit`

```powershell
Set-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group -PermissionLevel GpoEdit
```

Avec cette commande, le groupe **GroupeTest1** reçoit les droits de **modification** sur la GPO **test**. Le niveau d’accès **GpoEdit** permet aux membres du groupe de lire et de modifier la GPO.

- **Paramètres** :
  - `-PermissionLevel` : ici **GpoEdit** pour accorder des droits de modification.

- **Résultat** :
  - Les membres de **GroupeTest1** pourront consulter et modifier la GPO **test** selon les besoins.

### 3. Retirer tous les droits d’un groupe sur une GPO : `Set-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group -PermissionLevel none`

```powershell
Set-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group -PermissionLevel none
```

Cette commande supprime tous les droits d'accès du groupe **GroupeTest1** sur la GPO **test**. Le niveau de permission **none** empêche totalement le groupe d’accéder à la GPO.

- **Paramètres** :
  - `-PermissionLevel` : ici **none** pour retirer toutes les permissions.

- **Résultat** :
  - Les membres de **GroupeTest1** n'auront plus aucun accès à la GPO **test**.

### 4. Vérifier les droits d'un groupe sur une GPO : `Get-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group`

```powershell
Get-GPPermission -Name test -TargetName "GroupeTest1" -TargetType Group
```

Cette commande affiche les permissions actuelles de **GroupeTest1** sur la GPO **test**. C’est une méthode pratique pour vérifier quels niveaux d'accès sont appliqués à un groupe spécifique sur une GPO donnée.

- **Résultat** :
  - Affiche les niveaux de permissions actuels de **GroupeTest1** sur la GPO **test**.

### 5. Accorder des droits de modification à tous les utilisateurs ayant un titre particulier : 

```powershell
Get-ADUser -Filter "title -like 'Ingé*'" | ForEach-Object {
    Set-GPPermission -Name test -TargetName $_.Name -TargetType User -PermissionLevel GpoEdit
}
```

Dans cet exemple, on accorde des droits de **modification** sur la GPO **test** à tous les utilisateurs dont le titre commence par `"Ingé"`. La commande `Get-ADUser` filtre les utilisateurs et `Set-GPPermission` applique les droits de modification individuellement à chaque utilisateur correspondant.

- **Paramètres** :
  - `-Filter "title -like 'Ingé*'"` : filtre les utilisateurs ayant un titre commençant par `"Ingé"` (comme **Ingénieur**).
  - `-TargetType User` : cible de type utilisateur.
  - `-PermissionLevel GpoEdit` : niveau de permission pour autoriser les modifications.

- **Résultat** :
  - Tous les utilisateurs répondant au critère **Ingé*** recevront des droits de modification sur la GPO **test**.

---

Ces commandes vous permettent de gérer précisément les permissions d’accès aux GPO, que ce soit pour accorder, vérifier ou retirer les droits. Utiliser des filtres vous permet d’attribuer des permissions selon des critères particuliers, simplifiant ainsi la gestion des droits dans Active Directory.
