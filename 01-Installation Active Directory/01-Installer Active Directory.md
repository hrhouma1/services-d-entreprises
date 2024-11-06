# 📘 Guide détaillé pour l'installation d'Active Directory avec PowerShell

Ce guide vous montre comment installer Active Directory Domain Services (AD DS) en utilisant PowerShell. Les étapes comprennent la vérification des modules nécessaires et l'installation de la fonctionnalité AD DS.

## ✅ Prérequis
Assurez-vous d’exécuter PowerShell en tant qu’administrateur, car l’installation d’Active Directory nécessite des privilèges élevés.

---

### 1️⃣ Vérifier la disponibilité des modules Active Directory

```powershell
# Vérifie si le module ActiveDirectory est installé et disponible
Get-Module -Name ActiveDirectory -ListAvailable

# Vérifie si le module ADDSDeployment est installé et disponible
Get-Module -Name ADDSDeployment -ListAvailable

# Vérifie si le module GroupPolicy est installé et disponible
Get-Module -Name GroupPolicy -ListAvailable
```

- **But** : Ces commandes vérifient la disponibilité des modules nécessaires pour gérer Active Directory, déployer AD DS, et configurer les stratégies de groupe.
- **Explication** : Le paramètre `-ListAvailable` montre tous les modules disponibles sans les importer immédiatement dans la session PowerShell. 

---

### 2️⃣ Lister les fonctionnalités Windows disponibles

```powershell
# Affiche toutes les fonctionnalités Windows installables ou déjà installées
Get-WindowsFeature
```

- **But** : Cette commande permet de vérifier quelles fonctionnalités sont installées sur le serveur ou disponibles pour installation.
- **Explication** : Recherchez **AD-Domain-Services** dans la liste. Si cette fonctionnalité est marquée comme non installée, vous devrez l’installer pour activer AD DS.

---

### 3️⃣ Installer Active Directory Domain Services (AD DS)

```powershell
# Installe le rôle Active Directory Domain Services (AD DS) et les outils de gestion associés
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
```

- **But** : Installer AD DS pour permettre la configuration d’Active Directory sur le serveur.
- **Explication** : 
  - `Install-WindowsFeature` : Commande qui installe une fonctionnalité Windows.
  - `-Name AD-Domain-Services` : Indique que l’on installe AD DS.
  - `-IncludeManagementTools` : Ajoute les outils de gestion d’AD DS, ce qui permet de gérer Active Directory via PowerShell ou l’interface graphique (comme les outils RSAT).

---

### 4️⃣ Vérifier les modules installés

Après avoir installé AD DS, vous pouvez vérifier à nouveau que les modules sont bien disponibles pour une utilisation.

```powershell
# Re-vérifie la disponibilité du module ActiveDirectory
Get-Module -Name ActiveDirectory -ListAvailable

# Re-vérifie la disponibilité du module ADDSDeployment
Get-Module -Name ADDSDeployment -ListAvailable

# Re-vérifie la disponibilité du module GroupPolicy
Get-Module -Name GroupPolicy -ListAvailable
```

- **But** : Confirmer que les modules nécessaires sont bien installés et prêts à l'emploi.
- **Explication** : Ces commandes vérifient que les modules ont été ajoutés à la liste des modules disponibles pour des commandes de gestion Active Directory.

---

### 5️⃣ Compter les commandes disponibles dans chaque module

```powershell
# Compte le nombre de commandes disponibles dans le module ActiveDirectory
Get-Command -Module ActiveDirectory | Measure-Object

# Compte le nombre de commandes disponibles dans le module ADDSDeployment
Get-Command -Module ADDSDeployment | Measure-Object

# Compte le nombre de commandes disponibles dans le module GroupPolicy
Get-Command -Module GroupPolicy | Measure-Object
```

- **But** : Vérifier combien de commandes sont incluses dans chaque module pour estimer les fonctionnalités disponibles.
- **Explication** : 
  - `Get-Command -Module <ModuleName>` : Affiche toutes les commandes disponibles dans un module spécifique.
  - `| Measure-Object` : Compte le nombre total de commandes listées pour chaque module, fournissant un aperçu du nombre d'outils de gestion disponibles pour chaque module.

---

### 🎯 Conclusion

En suivant ces étapes, vous installez et configurez Active Directory Domain Services (AD DS) et vérifiez les outils PowerShell nécessaires pour une gestion efficace d'Active Directory. Vous pouvez maintenant utiliser PowerShell pour des tâches administratives sur les utilisateurs, les groupes et les stratégies de groupe dans votre domaine Active Directory.
