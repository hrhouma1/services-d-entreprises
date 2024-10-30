# Guide : Création d'une GPO et Liaison à une Unité Organisationnelle (OU)

Ce guide explique comment créer une stratégie de groupe (GPO), l’associer à une unité organisationnelle (OU) dans un domaine Active Directory, et comment utiliser un GPO de démarrage (Starter GPO). En suivant ces étapes, vous pourrez gérer efficacement vos GPO et configurer des paramètres spécifiques pour des unités organisationnelles.

## Prérequis
Assurez-vous d'avoir les permissions nécessaires pour créer et lier des GPO dans votre environnement Active Directory et d’exécuter PowerShell en tant qu’administrateur.

### 1. Créer une nouvelle GPO avec un commentaire : `New-GPO -Name TestGPO -Comment "Ceci est une GPO de test"`

```powershell
New-GPO -Name TestGPO -Comment "Ceci est une GPO de test"
```

Cette commande crée un nouvel objet de stratégie de groupe nommé **TestGPO** et y ajoute un commentaire ("Ceci est une GPO de test"). Les commentaires sont utiles pour documenter le but de la GPO, facilitant ainsi la gestion des configurations.

### 2. Vérifier l’existence de la GPO créée : `Get-GPO -Name TestGPO`

```powershell
Get-GPO -Name TestGPO
```

Après la création de la GPO, utilisez cette commande pour confirmer son existence et afficher ses détails, tels que le nom, l’ID unique (GUID) et la date de création. Cela vous assure que la GPO a été créée correctement.

### 3. Créer une GPO à partir d’un GPO de démarrage : `New-GPO -Name TestGPO1 -StarterGpoName "testGPOStarter"`

```powershell
New-GPO -Name TestGPO1 -StarterGpoName "testGPOStarter"
```

Cette commande crée une nouvelle GPO appelée **TestGPO1** en se basant sur un modèle de GPO de démarrage nommé `"testGPOStarter"`. Les GPO de démarrage fournissent une base de paramètres prédéfinis, idéale pour appliquer des configurations standardisées.

### 4. Lier la GPO à une Unité Organisationnelle (OU) : `New-GPLink -Name TestGPO -Target "OU=OUTest,DC=lab,DC=lan"`

```powershell
New-GPLink -Name TestGPO -Target "OU=OUTest,DC=lab,DC=lan"
```

Cette commande lie la GPO nommée **TestGPO** à une OU spécifique, ici `OU=OUTest,DC=lab,DC=lan`. Cela signifie que les paramètres de la GPO seront appliqués aux objets (utilisateurs, ordinateurs) présents dans cette unité organisationnelle.

### 5. Vérifier l’héritage des GPO pour une OU : `(Get-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" | Get-GPInheritance).GpoLinks`

```powershell
(Get-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" | Get-GPInheritance).GpoLinks
```

Cette commande permet de vérifier les liens de GPO existants pour une OU et d’afficher la liste des GPO héritées. Cela montre également l'ordre d’application des GPO, ce qui est essentiel pour comprendre les priorités et conflits potentiels entre différentes stratégies.

### 6. Créer un GPO de démarrage : `New-GPStarterGPO -Name "Test2GPOStarter" -Comment "Test GPOStarter"`

```powershell
New-GPStarterGPO -Name "Test2GPOStarter" -Comment "Test GPOStarter"
```

Les **GPO de démarrage** sont des modèles de configuration de base. Avec cette commande, vous créez un Starter GPO nommé **Test2GPOStarter**, accompagné d’un commentaire pour indiquer qu’il s’agit d’un GPO de démarrage de test. Vous pourrez ensuite utiliser ce Starter GPO comme base pour de nouvelles stratégies.

---

Ces commandes vous offrent une méthode complète pour créer, lier et gérer des GPO dans un domaine Active Directory. Utiliser des Starter GPO et vérifier l’héritage dans les OU permet une gestion plus structurée et un contrôle précis sur l’application des stratégies dans votre organisation.
