# 📘 Guide détaillé pour déplacer un rôle FSMO (Flexible Single Master Operations) d'un contrôleur de domaine (DC) vers un autre

Les rôles FSMO sont des rôles critiques pour le fonctionnement de l'Active Directory. Ils sont répartis en deux niveaux :
- **Rôles au niveau de la forêt** (deux rôles) : *Schema Master* et *Domain Naming Master*.
- **Rôles au niveau du domaine** (trois rôles) : *PDC Emulator*, *RID Master*, et *Infrastructure Master*.

Dans certains cas, il peut être nécessaire de déplacer un ou plusieurs rôles FSMO d'un contrôleur de domaine (DC) vers un autre, pour des raisons de maintenance, de disponibilité, ou de redondance. Ce guide explique comment vérifier les rôles FSMO actuels, et comment déplacer un rôle FSMO vers un autre contrôleur de domaine en utilisant PowerShell.

---

## ✅ Connaître les rôles FSMO actuels

Avant de déplacer un rôle FSMO, il est important de connaître quel contrôleur de domaine détient actuellement chaque rôle. 

### 1️⃣ Vérifier les rôles FSMO au niveau du domaine

Les rôles FSMO au niveau du domaine incluent :
- **PDC Emulator** : Il gère les opérations de synchronisation de l'heure, les mises à jour de mot de passe, et est également le maître pour les rétrocompatibilités avec les serveurs NT4.
- **RID Master** : Il alloue des pools d'identifiants relatifs (RID) aux contrôleurs de domaine pour permettre la création d'objets dans le domaine.
- **Infrastructure Master** : Il est chargé de maintenir les informations de mise à jour inter-domaines (pour les environnements multi-domaines).

Pour voir quel contrôleur de domaine détient ces rôles FSMO, utilisez la commande suivante :

```powershell
# Affiche les rôles FSMO au niveau du domaine actuel
Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator
```

### 2️⃣ Vérifier les rôles FSMO au niveau de la forêt

Les rôles FSMO au niveau de la forêt incluent :
- **Schema Master** : Il gère les modifications du schéma de l'Active Directory dans la forêt.
- **Domain Naming Master** : Il gère les ajouts et suppressions de domaines dans la forêt.

Pour afficher les rôles FSMO au niveau de la forêt, utilisez la commande suivante :

```powershell
# Affiche les rôles FSMO au niveau de la forêt
Get-ADForest | Select-Object SchemaMaster, DomainNamingMaster
```

Ces commandes vous donneront un aperçu des rôles FSMO actuels, ce qui vous permet de planifier les déplacements vers d’autres contrôleurs de domaine si nécessaire.

---

## ✅ Déplacer un rôle FSMO vers un autre contrôleur de domaine

Pour déplacer un rôle FSMO, la commande `Move-ADDirectoryServerOperationMasterRole` permet de transférer le rôle à un autre contrôleur de domaine de manière simple et rapide.

### Commande pour déplacer un rôle FSMO

Pour déplacer un rôle FSMO spécifique, utilisez la commande suivante en spécifiant le rôle et le contrôleur de domaine de destination :

```powershell
# Déplace un rôle FSMO spécifique (par exemple, RIDMaster) vers le contrôleur de domaine DC03
Move-ADDirectoryServerOperationMasterRole -Identity DC03 RIDMaster -Confirm:$false
```

### Explication des paramètres :

- **Move-ADDirectoryServerOperationMasterRole** : Cette commande transfère un ou plusieurs rôles FSMO vers le contrôleur de domaine spécifié.
  
- **-Identity DC03** : Définit le contrôleur de domaine de destination. Remplacez `DC03` par le nom du contrôleur de domaine auquel vous souhaitez attribuer le rôle FSMO.

- **RIDMaster** : Indique le rôle FSMO à déplacer. Vous pouvez remplacer `RIDMaster` par un autre rôle (ex. `PDCEmulator`, `InfrastructureMaster`, `SchemaMaster`, ou `DomainNamingMaster`) selon vos besoins.

- **-Confirm:$false** : Évite toute confirmation interactive pour permettre un transfert automatisé.

### Déplacer plusieurs rôles FSMO en une seule commande

Il est possible de déplacer plusieurs rôles FSMO vers le même contrôleur de domaine en listant les rôles dans une seule commande. Par exemple, pour déplacer les rôles **PDC Emulator** et **RID Master** vers `DC03` :

```powershell
Move-ADDirectoryServerOperationMasterRole -Identity DC03 PDCEmulator, RIDMaster -Confirm:$false
```

---

## ✅ Vérifier le transfert du rôle FSMO

Une fois le rôle déplacé, il est important de vérifier que le nouveau contrôleur de domaine détient bien le rôle FSMO.

### Commande pour vérifier le rôle FSMO après déplacement

Pour vérifier l’emplacement des rôles FSMO dans le domaine, utilisez la même commande que celle utilisée pour la vérification initiale :

```powershell
# Vérifie les rôles FSMO dans le domaine
Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator
```

Pour vérifier les rôles FSMO au niveau de la forêt :

```powershell
# Vérifie les rôles FSMO dans la forêt
Get-ADForest | Select-Object SchemaMaster, DomainNamingMaster
```

Ces commandes confirment que le transfert a bien eu lieu en indiquant le contrôleur de domaine actuellement responsable de chaque rôle.

---

## 🔄 Liste complète des rôles FSMO et leurs noms pour la commande

Voici une liste des noms de rôles FSMO que vous pouvez utiliser avec `Move-ADDirectoryServerOperationMasterRole` :

- **PDCEmulator** : Contrôleur de domaine principal (émulation PDC).
- **RIDMaster** : Maître RID.
- **InfrastructureMaster** : Maître d'infrastructure.
- **SchemaMaster** : Maître de schéma (au niveau de la forêt).
- **DomainNamingMaster** : Maître de nommage de domaine (au niveau de la forêt).

---

### 📝 Remarque sur la redondance et la résilience des rôles FSMO

En raison de l'importance des rôles FSMO pour le fonctionnement d'Active Directory, il est recommandé d’assigner ces rôles à des contrôleurs de domaine fiables et disponibles en permanence. Pour une résilience accrue, placez les rôles FSMO critiques (comme PDC Emulator et RID Master) sur des contrôleurs de domaine bien protégés et connectés de manière optimale au réseau.

---

### 🎯 Conclusion

Ce guide vous permet de gérer efficacement les rôles FSMO dans un environnement Active Directory, en vous assurant que chaque rôle est placé sur le contrôleur de domaine le plus adapté à vos besoins d’administration et de sécurité. En suivant les étapes pour déplacer et vérifier les rôles FSMO, vous pouvez maintenir un environnement Active Directory bien organisé et résilient.
