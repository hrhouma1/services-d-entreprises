# Projet Pratique : Création d’un Script PowerShell de Gestion des GPO au Collège Lemieux

Dans ce projet, vous allez créer un script PowerShell pour gérer les stratégies de groupe (GPO) du **Collège Lemieux**. Ce script centralisera la création des GPO, l’attribution des permissions, et la sauvegarde/restauration pour chaque département (Techniciens, Ressources Humaines, Enseignants, Étudiants). En suivant ce guide étape par étape, vous serez guidés pour configurer et automatiser les GPO dans Active Directory.

## Objectif

L’objectif de ce projet est de créer un **fichier PowerShell (.ps1)** contenant toutes les commandes nécessaires pour :
1. **Créer des GPO** pour chaque groupe.
2. **Attribuer des permissions** spécifiques pour chaque GPO et groupe.
3. **Sauvegarder et restaurer les GPO**.
4. **Vérifier les permissions** appliquées.

### À la fin, vous devrez fournir un fichier PowerShell nommé `GestionGPO_CollègeLemieux.ps1`.

---

## Instructions détaillées

Chaque étape ci-dessous contient les commandes exactes que vous devrez écrire dans le script PowerShell final. 

### 1. Création des GPO pour chaque département

Commencez votre script en utilisant la commande **`New-GPO`** pour créer une GPO pour chaque groupe. Voici les GPO que vous devrez créer :

- **GPO_Tech_Config** : pour les **Techniciens**
- **GPO_HR_Policies** : pour le département des **Ressources Humaines**
- **GPO_Ens_Res_Config** : pour les **Enseignants**
- **GPO_Etu_Accès_Limité** : pour les **Étudiants**
- **GPO_Générale_CollegeLemieux** : configuration générale pour tous

Ajoutez dans le script les lignes suivantes :

```powershell
# Création des GPO pour chaque groupe du Collège Lemieux
New-GPO -Name "GPO_Tech_Config" -Comment "Configuration pour le groupe des Techniciens"
New-GPO -Name "GPO_HR_Policies" -Comment "Configuration pour le département des Ressources Humaines"
New-GPO -Name "GPO_Ens_Res_Config" -Comment "Configuration pour les Enseignants"
New-GPO -Name "GPO_Etu_Accès_Limité" -Comment "Configuration pour les Étudiants"
New-GPO -Name "GPO_Générale_CollegeLemieux" -Comment "Configuration générale pour tous les groupes"
```

### 2. Configuration des Permissions pour chaque GPO

Pour chaque GPO, vous devrez configurer des droits spécifiques de **lecture** ou **écriture** pour les groupes du collège. Utilisez la commande **`Set-GPPermission`** pour définir les permissions.

**Détails des permissions** :

- **Techniciens** : Lecture et écriture sur `GPO_Tech_Config` et `GPO_Générale_CollegeLemieux`
- **HR** : Lecture seule sur `GPO_HR_Policies`
- **Enseignants** : Lecture et écriture sur `GPO_Ens_Res_Config`
- **Étudiants** : Lecture seule sur `GPO_Etu_Accès_Limité` et `GPO_Générale_CollegeLemieux`

Ajoutez les lignes suivantes dans le script :

```powershell
# Attribution des permissions pour chaque GPO
Set-GPPermission -Name "GPO_Tech_Config" -TargetName "Techniciens" -TargetType Group -PermissionLevel GpoEdit
Set-GPPermission -Name "GPO_Générale_CollegeLemieux" -TargetName "Techniciens" -TargetType Group -PermissionLevel GpoEdit

Set-GPPermission -Name "GPO_HR_Policies" -TargetName "HR" -TargetType Group -PermissionLevel GpoRead

Set-GPPermission -Name "GPO_Ens_Res_Config" -TargetName "Enseignants" -TargetType Group -PermissionLevel GpoEdit

Set-GPPermission -Name "GPO_Etu_Accès_Limité" -TargetName "Étudiants" -TargetType Group -PermissionLevel GpoRead
Set-GPPermission -Name "GPO_Générale_CollegeLemieux" -TargetName "Étudiants" -TargetType Group -PermissionLevel GpoRead
```

### 3. Sauvegarde des GPO

Utilisez la commande **`Backup-Gpo`** pour sauvegarder chaque GPO dans un dossier dédié. Pour cet exercice, vous devrez créer un dossier de sauvegarde appelé **C:\Sauvegarde_GPO_CollegeLemieux**.

Ajoutez les lignes suivantes dans le script pour sauvegarder chaque GPO :

```powershell
# Sauvegarde des GPO
Backup-Gpo -Name "GPO_Tech_Config" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Backup-Gpo -Name "GPO_HR_Policies" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Backup-Gpo -Name "GPO_Ens_Res_Config" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Backup-Gpo -Name "GPO_Etu_Accès_Limité" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Backup-Gpo -Name "GPO_Générale_CollegeLemieux" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
```

### 4. Vérification des Permissions

Après la configuration, utilisez la commande **`Get-GPPermission`** pour vérifier les permissions de chaque groupe sur leurs GPO respectives. Cela garantit que les permissions sont correctement appliquées.

Ajoutez les lignes suivantes dans le script pour vérifier les permissions :

```powershell
# Vérification des permissions pour chaque GPO
Get-GPPermission -Name "GPO_Tech_Config" -TargetName "Techniciens" -TargetType Group
Get-GPPermission -Name "GPO_Générale_CollegeLemieux" -TargetName "Techniciens" -TargetType Group

Get-GPPermission -Name "GPO_HR_Policies" -TargetName "HR" -TargetType Group

Get-GPPermission -Name "GPO_Ens_Res_Config" -TargetName "Enseignants" -TargetType Group

Get-GPPermission -Name "GPO_Etu_Accès_Limité" -TargetName "Étudiants" -TargetType Group
Get-GPPermission -Name "GPO_Générale_CollegeLemieux" -TargetName "Étudiants" -TargetType Group
```

### 5. Restauration des GPO

En cas de besoin, ajoutez un bloc de code pour restaurer les GPO à partir du dossier de sauvegarde. Utilisez la commande **`Restore-GPO`** pour restaurer les configurations de chaque GPO.

Ajoutez les lignes suivantes dans le script pour restaurer chaque GPO :

```powershell
# Restauration des GPO
Restore-GPO -Name "GPO_Tech_Config" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Restore-GPO -Name "GPO_HR_Policies" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Restore-GPO -Name "GPO_Ens_Res_Config" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Restore-GPO -Name "GPO_Etu_Accès_Limité" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Restore-GPO -Name "GPO_Générale_CollegeLemieux" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
```

---

## Format Final du Script

Une fois que vous avez complété toutes les étapes ci-dessus, votre fichier **`GestionGPO_CollègeLemieux.ps1`** devrait contenir toutes les commandes dans l’ordre suivant :

```powershell
# Création des GPO pour chaque groupe du Collège Lemieux
New-GPO -Name "GPO_Tech_Config" -Comment "Configuration pour le groupe des Techniciens"
New-GPO -Name "GPO_HR_Policies" -Comment "Configuration pour le département des Ressources Humaines"
New-GPO -Name "GPO_Ens_Res_Config" -Comment "Configuration pour les Enseignants"
New-GPO -Name "GPO_Etu_Accès_Limité" -Comment "Configuration pour les Étudiants"
New-GPO -Name "GPO_Générale_CollegeLemieux" -Comment "Configuration générale pour tous les groupes"

# Attribution des permissions pour chaque GPO
Set-GPPermission -Name "GPO_Tech_Config" -TargetName "Techniciens" -TargetType Group -PermissionLevel GpoEdit
Set-GPPermission -Name "GPO_Générale_CollegeLemieux" -TargetName "Techniciens" -TargetType Group -PermissionLevel GpoEdit

Set-GPPermission -Name "GPO_HR_Policies" -TargetName "HR" -TargetType Group -PermissionLevel GpoRead

Set-GPPermission -Name "GPO_Ens_Res_Config" -TargetName "Enseignants" -TargetType Group -PermissionLevel GpoEdit

Set-GPPermission -Name "GPO_Etu_Accès_Limité" -TargetName "Étudiants" -TargetType Group -PermissionLevel GpoRead


Set-GPPermission -Name "GPO_Générale_CollegeLemieux" -TargetName "Étudiants" -TargetType Group -PermissionLevel GpoRead

# Sauvegarde des GPO
Backup-Gpo -Name "GPO_Tech_Config" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Backup-Gpo -Name "GPO_HR_Policies" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Backup-Gpo -Name "GPO_Ens_Res_Config" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Backup-Gpo -Name "GPO_Etu_Accès_Limité" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Backup-Gpo -Name "GPO_Générale_CollegeLemieux" -Path "C:\Sauvegarde_GPO_CollegeLemieux"

# Vérification des permissions pour chaque GPO
Get-GPPermission -Name "GPO_Tech_Config" -TargetName "Techniciens" -TargetType Group
Get-GPPermission -Name "GPO_Générale_CollegeLemieux" -TargetName "Techniciens" -TargetType Group

Get-GPPermission -Name "GPO_HR_Policies" -TargetName "HR" -TargetType Group

Get-GPPermission -Name "GPO_Ens_Res_Config" -TargetName "Enseignants" -TargetType Group

Get-GPPermission -Name "GPO_Etu_Accès_Limité" -TargetName "Étudiants" -TargetType Group
Get-GPPermission -Name "GPO_Générale_CollegeLemieux" -TargetName "Étudiants" -TargetType Group

# Restauration des GPO
Restore-GPO -Name "GPO_Tech_Config" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Restore-GPO -Name "GPO_HR_Policies" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Restore-GPO -Name "GPO_Ens_Res_Config" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Restore-GPO -Name "GPO_Etu_Accès_Limité" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
Restore-GPO -Name "GPO_Générale_CollegeLemieux" -Path "C:\Sauvegarde_GPO_CollegeLemieux"
```

---

### Instructions de Soumission

Une fois le script complété, enregistrez-le sous le nom **`GestionGPO_CollègeLemieux.ps1`** et soumettez ce fichier pour évaluation. 

> **Note :** Assurez-vous que chaque commande fonctionne correctement avant de soumettre le script final !
