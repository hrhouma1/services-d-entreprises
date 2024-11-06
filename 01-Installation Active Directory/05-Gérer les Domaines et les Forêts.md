# 📘 Guide de gestion des domaines et forêts dans Active Directory avec PowerShell

Ce guide couvre les principales commandes PowerShell pour gérer et administrer les domaines et forêts dans un environnement Active Directory. Vous y trouverez des exemples et des explications pour lister les domaines et forêts, ajouter des domaines, et gérer des paramètres spécifiques.

---

## ✅ Liste des domaines et des forêts dans l'environnement Active Directory

Pour obtenir des informations sur les domaines et les forêts dans votre environnement Active Directory, utilisez les commandes suivantes.

### 1️⃣ Lister tous les domaines dans la forêt

```powershell
# Obtient la liste de tous les domaines dans la forêt actuelle
(Get-ADForest).Domains
```

- **But** : Récupérer tous les domaines dans la forêt Active Directory.
- **Explication** : La commande `Get-ADForest` renvoie des informations globales sur la forêt, incluant la liste des domaines. La propriété `.Domains` affiche ces domaines sous forme de liste.

---

### 2️⃣ Obtenir des informations sur la forêt Active Directory

```powershell
# Affiche les informations générales sur la forêt
Get-ADForest
```

- **But** : Obtenir des détails sur la forêt Active Directory, incluant le niveau fonctionnel de la forêt, le contrôleur de schéma, le nom de la forêt, etc.
- **Explication** : `Get-ADForest` fournit des informations complètes sur la forêt, ce qui est utile pour connaître les contrôleurs de domaine principaux, le niveau fonctionnel, et les domaines enfants.

---

### 3️⃣ Lister tous les contrôleurs de domaine dans un domaine spécifique

```powershell
# Remplacez "nomdomaine.local" par le nom de votre domaine
Get-ADDomainController -Filter * -Server "nomdomaine.local"
```

- **But** : Lister tous les contrôleurs de domaine dans un domaine donné.
- **Explication** : `Get-ADDomainController` avec `-Filter *` liste tous les contrôleurs de domaine disponibles dans le domaine spécifié avec `-Server`.

---

## ✅ Gestion des domaines dans Active Directory

### 4️⃣ Ajouter un domaine enfant à une forêt existante

Pour ajouter un domaine enfant, assurez-vous d'avoir le rôle Active Directory Domain Services (AD DS) installé et d'utiliser la commande suivante :

```powershell
Install-ADDSDomain -NewDomainName "child" `
                   -ParentDomainName "parent.local" `
                   -DomainType "ChildDomain" `
                   -InstallDns:$true `
                   -Credential (Get-Credential)
```

- **But** : Ajouter un nouveau domaine enfant (par exemple, `child.parent.local`) dans une forêt existante.
- **Explication** : 
  - `-NewDomainName` : Définit le nom du nouveau domaine.
  - `-ParentDomainName` : Spécifie le domaine parent dans lequel le domaine enfant sera ajouté.
  - `-DomainType "ChildDomain"` : Définit le type de domaine en tant que domaine enfant.
  - `-InstallDns:$true` : Indique si le DNS doit être installé pour ce domaine.
  - `-Credential (Get-Credential)` : Demande les informations d'identification d'un administrateur pour le domaine parent.

---

### 5️⃣ Mettre à jour le niveau fonctionnel d'un domaine

```powershell
# Définit le niveau fonctionnel du domaine à "Win2016"
Set-ADDomainMode -Identity "domain.local" -DomainMode Windows2016Domain
```

- **But** : Mettre à jour le niveau fonctionnel du domaine pour activer des fonctionnalités supplémentaires.
- **Explication** : 
  - `Set-ADDomainMode` : Définit le niveau fonctionnel d'un domaine.
  - `-Identity` : Nom DNS du domaine à mettre à jour.
  - `-DomainMode` : Niveau fonctionnel cible (ex. `Windows2016Domain` pour Windows Server 2016).

---

### 6️⃣ Mettre à jour le niveau fonctionnel de la forêt

```powershell
# Définit le niveau fonctionnel de la forêt à "Win2016"
Set-ADForestMode -Identity "domain.local" -ForestMode Windows2016Forest
```

- **But** : Mettre à jour le niveau fonctionnel de la forêt pour activer les fonctionnalités spécifiques aux versions de serveur plus récentes.
- **Explication** : 
  - `Set-ADForestMode` : Définit le niveau fonctionnel de la forêt.
  - `-Identity` : Nom de la forêt.
  - `-ForestMode` : Niveau fonctionnel cible pour la forêt (ex. `Windows2016Forest`).

---

### 7️⃣ Vérifier les rôles FSMO (Flexible Single Master Operations) dans la forêt

```powershell
# Affiche les rôles FSMO de la forêt
Get-ADForest | Select-Object SchemaMaster, DomainNamingMaster
```

- **But** : Obtenir des informations sur les rôles FSMO au niveau de la forêt.
- **Explication** : `Get-ADForest` affiche des informations sur la forêt, et `Select-Object` permet de cibler spécifiquement les rôles FSMO de la forêt, comme le contrôleur de schéma et le contrôleur de nom de domaine.

---

### 8️⃣ Vérifier les rôles FSMO dans le domaine

```powershell
# Affiche les rôles FSMO du domaine
Get-ADDomain | Select-Object PDCEmulator, RIDMaster, InfrastructureMaster
```

- **But** : Obtenir des informations sur les rôles FSMO spécifiques au domaine.
- **Explication** : `Get-ADDomain` affiche des informations sur le domaine, et `Select-Object` filtre pour montrer les rôles FSMO du domaine, comme le maître d’infrastructure, le PDC (Primary Domain Controller Emulator), et le RID Master.

---

### 9️⃣ Ajouter un nouveau contrôleur de domaine dans un domaine existant

```powershell
Install-ADDSDomainController -DomainName "domain.local" `
                             -SiteName "Default-First-Site-Name" `
                             -InstallDns:$true `
                             -Credential (Get-Credential)
```

- **But** : Ajouter un contrôleur de domaine supplémentaire dans un domaine existant.
- **Explication** : 
  - `-DomainName` : Nom du domaine où le contrôleur de domaine sera ajouté.
  - `-SiteName` : Nom du site Active Directory pour placer ce contrôleur de domaine.
  - `-InstallDns:$true` : Indique si le service DNS doit être installé sur ce contrôleur.
  - `-Credential (Get-Credential)` : Utilise des informations d'identification d'un administrateur du domaine pour effectuer l'opération.

---

## 🎯 Conclusion

Ce guide vous fournit les commandes essentielles pour gérer les domaines et les forêts dans Active Directory via PowerShell. Ces opérations permettent d’obtenir des informations, d’ajouter des domaines ou des contrôleurs, et de configurer les niveaux fonctionnels, vous offrant un contrôle complet sur votre environnement Active Directory.
