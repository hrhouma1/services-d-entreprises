# Guide : Sauvegarder et Restaurer une GPO

Ce guide vous explique comment sauvegarder et restaurer une stratégie de groupe (GPO) dans un environnement Active Directory à l’aide de commandes PowerShell. La sauvegarde régulière des GPO est essentielle pour garantir la récupération rapide des configurations en cas de suppression ou de modification non souhaitée.

## Prérequis
Assurez-vous d'exécuter PowerShell en tant qu’administrateur et de disposer des permissions nécessaires pour sauvegarder et restaurer les GPO dans Active Directory.

### 1. Sauvegarder une GPO : `Backup-Gpo -Name TestGPO -Path C:\sauvegarde`

```powershell
Backup-Gpo -Name TestGPO -Path C:\sauvegarde
```

Cette commande sauvegarde une GPO spécifique, ici nommée **TestGPO**, dans le dossier spécifié (`C:\sauvegarde`). La sauvegarde comprend tous les paramètres et configurations associés à la GPO, permettant une restauration rapide en cas de besoin.

- **Paramètres** :
  - `-Name` : nom de la GPO que vous souhaitez sauvegarder.
  - `-Path` : chemin où les fichiers de sauvegarde seront stockés.

- **Résultat** :
  - Un fichier de sauvegarde est créé dans le dossier spécifié, incluant toutes les configurations de la GPO. Ce fichier peut être utilisé ultérieurement pour restaurer la GPO dans son état actuel.

### 2. Restaurer une GPO depuis une sauvegarde : `Restore-GPO -Name TestGPO -Path C:\sauvegarde`

```powershell
Restore-GPO -Name TestGPO -Path C:\sauvegarde
```

Cette commande restaure une GPO existante à partir d'une sauvegarde. Elle remplace toutes les configurations actuelles de la GPO par celles sauvegardées dans le dossier spécifié (`C:\sauvegarde`).

- **Paramètres** :
  - `-Name` : nom de la GPO à restaurer.
  - `-Path` : chemin contenant la sauvegarde de la GPO.

- **Résultat** :
  - La GPO **TestGPO** est restaurée selon les configurations sauvegardées dans `C:\sauvegarde`. Toutes les modifications ultérieures sont remplacées par celles de la sauvegarde.

---

En suivant ces étapes, vous pouvez efficacement sauvegarder et restaurer les GPO dans votre domaine Active Directory. La sauvegarde régulière est une pratique recommandée pour préserver les configurations critiques et faciliter la récupération en cas de perte ou d’altération accidentelle des stratégies de groupe.
