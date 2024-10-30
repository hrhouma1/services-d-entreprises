# Introduction 

Je vous présente un guide détaillé sur la récupération d'informations et l'analyse des stratégies de groupe (GPO) en utilisant des commandes PowerShell. 
*Ce guide vous montrera comment récupérer des informations, générer des rapports, analyser des permissions, et explorer les paramètres avancés des GPO.* 

### Prérequis
Avant de commencer, assurez-vous d'exécuter PowerShell avec les droits d'administrateur, car certaines commandes nécessitent des permissions élevées pour accéder aux GPO.

### 1. Lister tous les GPO : `Get-GPO -All`

```powershell
Get-GPO -All
```

Cette commande liste tous les objets de stratégie de groupe (GPO) présents dans le domaine. Cela permet d'obtenir un aperçu global de toutes les stratégies configurées. Vous verrez des informations de base pour chaque GPO, telles que le **Nom**, l'**ID unique (GUID)**, la **date de création**, et la **dernière modification**.

### 2. Récupérer un GPO spécifique par son nom : `Get-GPO -Name "Default Domain Policy"`

```powershell
Get-GPO -Name "Default Domain Policy"
```

Utilisez cette commande pour récupérer les informations d'un GPO particulier en spécifiant son nom. Par exemple, `"Default Domain Policy"` est souvent utilisé pour configurer des paramètres de sécurité de domaine par défaut.

### 3. Récupérer un GPO par son GUID : `Get-GPO -Guid "31B2F340-016D-11D2-945F-00C04FB984F9"`

```powershell
Get-GPO -Guid "31B2F340-016D-11D2-945F-00C04FB984F9"
```

Chaque GPO a un identifiant unique appelé GUID. Cette commande est utile si vous avez le GUID du GPO et que vous souhaitez obtenir ses informations spécifiques.

### 4. Générer un rapport HTML pour un GPO : `Get-GPOReport -Name "Default Domain Policy" -ReportType HTML -Path "c:\rapportGPO.html"`

```powershell
Get-GPOReport -Name "Default Domain Policy" -ReportType HTML -Path "c:\rapportGPO.html"
```

Cette commande génère un rapport HTML détaillé pour le GPO nommé `"Default Domain Policy"` et le sauvegarde à l'emplacement spécifié (`c:\rapportGPO.html`). Le rapport inclut toutes les configurations et paramètres appliqués par ce GPO. L'option `-ReportType` peut être définie sur `HTML` pour un rapport lisible dans un navigateur.

### 5. Générer un rapport HTML pour tous les GPO : `Get-GPOReport -All -ReportType HTML -Path "c:\rapportGPO.html"`

```powershell
Get-GPOReport -All -ReportType HTML -Path "c:\rapportGPO.html"
```

Pour obtenir un rapport HTML global pour tous les GPO dans le domaine, utilisez cette commande. Le rapport contient toutes les stratégies de groupe et leurs configurations, idéal pour une vue d'ensemble des configurations appliquées.

### 6. Générer un rapport XML pour un GPO : `Get-GPOReport -Name "Default Domain Policy" -ReportType Xml -Path "c:\rapportGPO.xml"`

```powershell
Get-GPOReport -Name "Default Domain Policy" -ReportType Xml -Path "c:\rapportGPO.xml"
```

En spécifiant `-ReportType Xml`, vous pouvez générer un rapport XML au lieu d'un rapport HTML. Ce format est utile pour des analyses automatisées ou pour intégrer les données dans d'autres scripts et applications.

### 7. Lister tous les GPO de démarrage : `Get-GPStarterGPO -All`

```powershell
Get-GPStarterGPO -All
```

Les **GPO de démarrage** (Starter GPO) sont des modèles de stratégie de groupe. Cette commande liste tous les Starter GPO disponibles, qui peuvent être utilisés pour créer de nouveaux GPO basés sur des configurations de base.

### 8. Récupérer un GPO de démarrage spécifique : `Get-GPStarterGPO -Name "testGPOStarter"`

```powershell
Get-GPStarterGPO -Name "testGPOStarter"
```

Si vous connaissez le nom d'un Starter GPO, vous pouvez utiliser cette commande pour récupérer ses informations et voir les configurations par défaut qu’il applique.

### 9. Vérifier les permissions d’un GPO pour un groupe : `Get-GPPermission -Name "Default Domain Policy" -TargetName "Admins du domaine" -TargetType Group`

```powershell
Get-GPPermission -Name "Default Domain Policy" -TargetName "Admins du domaine" -TargetType Group
```

Cette commande permet de voir les permissions d'un GPO pour un groupe spécifique, dans cet exemple `"Admins du domaine"`. Le paramètre `-TargetType Group` indique que la cible est un groupe d’utilisateurs.

### 10. Vérifier les permissions d’un GPO pour un utilisateur : `Get-GPPermission -Name "Default Domain Policy" -TargetName "Utilisateurs authentifiés" -TargetType user`

```powershell
Get-GPPermission -Name "Default Domain Policy" -TargetName "Utilisateurs authentifiés" -TargetType user
```

De la même manière que la commande précédente, celle-ci vérifie les permissions pour un utilisateur. Par exemple, `"Utilisateurs authentifiés"` est un utilisateur générique, et cette commande montre les niveaux d'accès que ce GPO leur accorde.

### 11. Vérifier l'héritage des GPO : `Get-GPInheritance -Target "OU=OUTest,DC=lab,DC=lan"`

```powershell
Get-GPInheritance -Target "OU=OUTest,DC=lab,DC=lan"
```

Cette commande montre comment les stratégies sont héritées dans une unité organisationnelle (OU) spécifique. Cela aide à comprendre comment les GPO sont appliqués et propagés dans une structure d’unités organisationnelles.

### 12. Charger un rapport XML en tant qu'objet XML PowerShell : `[xml]$RapportGPO = Get-Content -Path C:\rapportGPO.xml`

```powershell
[xml]$RapportGPO = Get-Content -Path C:\rapportGPO.xml
```

En utilisant cette syntaxe, vous chargez le contenu d'un fichier XML dans un objet XML PowerShell pour pouvoir accéder aux éléments et nœuds du document via des propriétés et méthodes.

### 13. Accéder au propriétaire du GPO dans le rapport XML : `$RapportGPO.gpo.SecurityDescriptor.Owner.name`

```powershell
$RapportGPO.gpo.SecurityDescriptor.Owner.name
```

Une fois le rapport chargé en tant qu’objet XML, cette commande permet d’obtenir le nom du propriétaire de la GPO. Cela peut être utile pour les audits de sécurité ou pour savoir qui a créé ou modifié la GPO.

### 14. Accéder aux liens associés au GPO dans le rapport XML : `$RapportGPO.gpo.LinksTo`

```powershell
$RapportGPO.gpo.LinksTo
```

Cette commande affiche les unités organisationnelles ou conteneurs auxquels le GPO est appliqué. Cela permet de voir dans quelles parties du domaine cette stratégie est en vigueur.

### 15. Accéder aux permissions du GPO dans le rapport XML : `$RapportGPO.gpo.SecurityDescriptor.Permissions.TrusteePermissions.trustee.name`

```powershell
$RapportGPO.gpo.SecurityDescriptor.Permissions.TrusteePermissions.trustee.name
```

Pour visualiser les permissions de la GPO, cette commande permet de voir les utilisateurs ou groupes ayant des droits d'accès sur cette stratégie. Cela donne une vue détaillée sur les permissions d'accès définies dans le GPO.

---

Ces commandes vous offrent une approche complète pour gérer, auditer, et analyser les stratégies de groupe dans un environnement Active Directory. En les combinant dans des scripts, vous pouvez automatiser les audits de sécurité, générer des rapports programmés, et contrôler les configurations de GPO pour le domaine.
