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

- Cette commande permet de vérifier les liens de GPO existants pour une OU et d’afficher la liste des GPO héritées. Cela montre également l'ordre d’application des GPO, ce qui est essentiel pour comprendre les priorités et conflits potentiels entre différentes stratégies.

- GpoLinks ==> Voir *Annexe1*
  
-----------
#### Exemple de résultat:
-----------

Lorsque vous exécutez cette commande PowerShell pour afficher les liens GPO associés à une unité d'organisation (OU), le format de sortie ressemble généralement à ceci :

```plaintext
GpoID                                   DisplayName                  Enabled    Enforced
------                                   -----------                  -------    --------
{6AC1786C-016F-11D2-945F-00C04FB984F9}   Default Domain Policy        True       False
{31B2F340-016D-11D2-945F-00C04FB984F9}   Custom Security Policy       True       True
{12A52F67-ABF5-4DF5-B8FD-67A4F13E5EF8}   Software Deployment Policy   False      False
```

 Signification des  colonnes ==>

- **GpoID** : L'identifiant unique (GUID) du GPO.
- **DisplayName** : Le nom du GPO, qui facilite son identification.
- **Enabled** : Indique si le lien vers le GPO est activé pour cette OU (`True` signifie activé).
- **Enforced** : Indique si le GPO est forcé. Un GPO forcé ne peut pas être remplacé par un autre GPO appliqué à un niveau inférieur dans la hiérarchie Active Directory.

### Exemple d'interprétation

- Le **Default Domain Policy** est activé pour l'OU mais n'est pas forcé.
- Le **Custom Security Policy** est à la fois activé et forcé, ce qui signifie qu'il ne pourra pas être remplacé par d'autres GPO dans des sous-OU.
- Le **Software Deployment Policy** est désactivé pour cette OU.

*Ce type de sortie vous permet de visualiser rapidement quels GPOs sont actifs, désactivés ou forcés pour l'OU spécifiée.*


### 6. Créer un GPO de démarrage : `New-GPStarterGPO -Name "Test2GPOStarter" -Comment "Test GPOStarter"`

```powershell
New-GPStarterGPO -Name "Test2GPOStarter" -Comment "Test GPOStarter"
```

Les **GPO de démarrage** sont des modèles de configuration de base. Avec cette commande, vous créez un Starter GPO nommé **Test2GPOStarter**, accompagné d’un commentaire pour indiquer qu’il s’agit d’un GPO de démarrage de test. Vous pourrez ensuite utiliser ce Starter GPO comme base pour de nouvelles stratégies.

---

Ces commandes vous offrent une méthode complète pour créer, lier et gérer des GPO dans un domaine Active Directory. Utiliser des Starter GPO et vérifier l’héritage dans les OU permet une gestion plus structurée et un contrôle précis sur l’application des stratégies dans votre organisation.



# Annexe 1 : propriété `GpoLinks`

La propriété `GpoLinks` est une liste des liens vers les objets de stratégie de groupe (GPO) appliqués à une unité d’organisation (OU) spécifique. Voici quelques éléments pour mieux comprendre :

- **`GpoLinks`** : Cette propriété contient des informations sur chaque GPO lié à l'OU spécifiée, y compris :
  - L'identifiant du GPO (GUID).
  - L'état du lien (activé ou désactivé).
  - L'ordre de priorité des GPO (priorité d'application si plusieurs GPO sont appliqués).

En PowerShell, la commande :

```powershell
(Get-ADOrganizationalUnit -Identity "OU=OUTest,DC=lab,DC=lan" | Get-GPInheritance).GpoLinks
```

fait ce qui suit :
1. **`Get-ADOrganizationalUnit`** : Récupère l'OU spécifiée.
2. **`Get-GPInheritance`** : Obtient les informations d'héritage de GPO pour cette OU.
3. **`.GpoLinks`** : Affiche spécifiquement les liens GPO pour cette OU.

*Cela peut aider les administrateurs à voir les GPO appliqués, leur état et leur ordre d’application pour gérer les configurations et les politiques dans un environnement Active Directory.*
