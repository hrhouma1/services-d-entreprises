## 📚 Cours détaillé : Création de groupes Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser les commandes PowerShell pour créer et configurer des groupes dans Active Directory (AD). Ces commandes sont essentielles pour gérer les utilisateurs et les permissions dans un environnement réseau.

---

# ✨ Résumé des commandes

```powershell
# 🛠️ Crée un groupe de sécurité global nommé GroupeTest1
New-ADGroup -Name GroupeTest1 -GroupScope Global -GroupCategory Security

# 📧 Crée un groupe de distribution local au domaine nommé GroupeTest2 avec une description
New-ADGroup -Name GroupeTest2 -GroupScope DomainLocal -GroupCategory Distribution -Description "Affichage Groupe Test 2"

# 📁 Crée un groupe de distribution local dans l'unité organisationnelle (OU) "Computers"
New-ADGroup -Name GroupeTest3 -GroupScope DomainLocal -GroupCategory Distribution -Path "CN=Computers,DC=lab,DC=lan"

# 🌍 Crée un groupe de distribution local GroupeTest2 sur le serveur paris.lab.lan avec une description
New-ADGroup -Name GroupeTest2 -GroupScope DomainLocal -GroupCategory Distribution -Description "Affichage Groupe Test 2" -Server paris.lab.lan

# 🛡️ Crée un groupe de sécurité local nommé GroupeTest20 avec un attribut personnalisé "info"
New-ADGroup -Name GroupeTest20 -GroupScope DomainLocal -GroupCategory Security -OtherAttributes @{info="Test info groupe"}

# 📂 Importe des données de groupes depuis un fichier CSV pour traitement en bloc
$Groupes = Import-Csv -Path 'C:\groupes ad.csv' -Delimiter ";" -Encoding UTF8

# 🔄 Boucle pour chaque groupe importé, en définissant et en créant les groupes selon le fichier CSV
foreach($Groupe in $Groupes)
{
    # Définit l'emplacement OU selon le domaine du groupe
    if($Groupe.Domaine -eq "paris.lab.lan")
    {
        $EmplacementOU = "OU=Agences,DC=Paris,DC=lab,DC=lan"
    }
    elseif($Groupe.Domaine -eq "lab.lan")
    {
        $EmplacementOU = "OU=Agences,DC=lab,DC=lan"
    }

    # Crée le groupe AD avec les informations du CSV
    New-ADGroup -Name $Groupe.NomGroupe `
                -GroupCategory $Groupe.TypeGroupe `
                -GroupScope $Groupe.EtendueGroupe `
                -Server $Groupe.Domaine `
                -Path $EmplacementOU
}
```

---

# 🛠️ Commande 1 : Créer un groupe de sécurité global

```powershell
New-ADGroup -Name GroupeTest1 -GroupScope Global -GroupCategory Security
```

**Détails :**
- **New-ADGroup** : Crée un nouveau groupe dans AD.
- **`-Name`** : Définit le nom, ici "GroupeTest1".
- **`-GroupScope Global`** : La portée globale permet de partager le groupe entre domaines.
- **`-GroupCategory Security`** : C’est un groupe de sécurité, donc utilisé pour les permissions.

Cette commande crée un groupe global de sécurité, qui est accessible dans tout le domaine.

---

# 📧 Commande 2 : Créer un groupe de distribution local avec une description

```powershell
New-ADGroup -Name GroupeTest2 -GroupScope DomainLocal -GroupCategory Distribution -Description "Affichage Groupe Test 2"
```

**Détails :**
- **`-Name`** : Nom du groupe, "GroupeTest2".
- **`-GroupScope DomainLocal`** : Limite le groupe au domaine actuel.
- **`-GroupCategory Distribution`** : Utilisé pour les communications, non pour les permissions.
- **`-Description`** : Ajoute une description informative.

Cela crée un groupe de distribution local au domaine avec une description.

---

# 📁 Commande 3 : Créer un groupe de distribution dans une OU spécifique

```powershell
New-ADGroup -Name GroupeTest3 -GroupScope DomainLocal -GroupCategory Distribution -Path "CN=Computers,DC=lab,DC=lan"
```

**Détails :**
- **`-Path`** : Emplacement dans AD où le groupe sera créé (OU "Computers").

Cette commande organise le groupe dans une unité organisationnelle, facilitant sa gestion.

---

# 🌍 Commande 4 : Créer un groupe de distribution local avec un serveur AD spécifique

```powershell
New-ADGroup -Name GroupeTest2 -GroupScope DomainLocal -GroupCategory Distribution -Description "Affichage Groupe Test 2" -Server paris.lab.lan
```

**Détails :**
- **`-Server`** : Spécifie le serveur AD (ici, "paris.lab.lan") pour le groupe.

Cela permet de gérer les groupes dans un environnement multi-domaine.

---

# 🛡️ Commande 5 : Créer un groupe de sécurité avec des attributs supplémentaires

```powershell
New-ADGroup -Name GroupeTest20 -GroupScope DomainLocal -GroupCategory Security -OtherAttributes @{info="Test info groupe"}
```

**Détails :**
- **`-OtherAttributes`** : Définit des attributs additionnels pour le groupe, ici `info`.

Cette commande documente des informations spécifiques sur le groupe.

---

# 📂 Utilisation d'un fichier CSV pour la création automatique de groupes

#### 🔄 Importation des données depuis un fichier CSV

```powershell
$Groupes = Import-Csv -Path 'C:\groupes ad.csv' -Delimiter ";" -Encoding UTF8
```

**Détails :**
- **`Import-Csv`** : Importe les données d’un fichier CSV en objets.
- **`-Path`** : Chemin du fichier.
- **`-Delimiter ";"`** : Séparateur de colonnes.
- **`-Encoding UTF8`** : Gère les caractères spéciaux.

Cela permet de charger une liste de groupes pour automatiser leur création.

---

### 🔄 Création automatique de groupes en fonction du contenu du fichier CSV

#### Boucle `foreach` pour créer chaque groupe

```powershell
foreach($Groupe in $Groupes)
{
    if($Groupe.Domaine -eq "paris.lab.lan")
    {
        $EmplacementOU = "OU=Agences,DC=Paris,DC=lab,DC=lan"
    }
    elseif($Groupe.Domaine -eq "lab.lan")
    {
        $EmplacementOU = "OU=Agences,DC=lab,DC=lan"
    }

    New-ADGroup -Name $Groupe.NomGroupe `
                -GroupCategory $Groupe.TypeGroupe `
                -GroupScope $Groupe.EtendueGroupe `
                -Server $Groupe.Domaine `
                -Path $EmplacementOU
}
```

**Détails :**
- **Boucle `foreach`** : Parcourt chaque groupe du fichier CSV.
- **Conditions `if` et `elseif`** : Attribue un emplacement selon le domaine.
- **Création automatique** : Utilise les données du CSV pour configurer chaque groupe.

---

### 📝 Résumé

Ce script PowerShell permet d'automatiser la création de groupes AD en utilisant un fichier CSV et une boucle pour configurer chaque groupe en fonction des paramètres du fichier.
