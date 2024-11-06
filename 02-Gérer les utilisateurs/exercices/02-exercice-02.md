# Énoncé de l'exercice : Création automatique de comptes étudiants dans Active Directory

### 🎯 Objectif de l'exercice

L’objectif est de créer automatiquement les comptes utilisateurs pour une liste d’étudiants dans un collège en utilisant PowerShell et Active Directory. Chaque compte doit suivre un modèle d’identifiant unique basé sur le numéro d'étudiant et un email structuré sous la forme `e123456@clajoie.com`. Vous allez également définir un mot de passe initial pour chaque étudiant et configurer leur compte pour qu'ils soient obligés de le changer lors de la première connexion.

---

## 🛠️ Description de l'exercice

Vous avez été chargé de créer des comptes pour les nouveaux étudiants d’un collège, en utilisant leurs informations personnelles telles que le prénom, le nom de famille, et leur numéro d'identifiant unique. Voici les détails des exigences :

1. **Structure d'email et d'identifiant** : Chaque étudiant doit avoir une adresse email structurée selon un modèle spécifique, par exemple `e123456@clajoie.com`, où `123456` est le numéro d'identifiant de l’étudiant.
  
2. **Mot de passe par défaut** : Tous les étudiants auront un mot de passe initial par défaut, mais ils devront le changer lors de leur première connexion pour garantir la sécurité de leur compte.

3. **Stockage des informations** : Utiliser un fichier CSV pour stocker les informations de chaque étudiant, ce qui permettra une création massive de comptes en une seule exécution.

---

## 📝 Détails de l'exercice

1. **Fichier CSV** : Vous allez préparer un fichier `etudiants.csv` contenant les informations de base pour chaque étudiant :
   - **Identifiant** : Un numéro unique pour chaque étudiant (ex. `123456`).
   - **Prenom** : Le prénom de l’étudiant (ex. `Alice`).
   - **Nom** : Le nom de famille de l’étudiant (ex. `Dupont`).
   - **Departement** : Le département de l’étudiant (ex. `Informatique`).

   Voici un exemple du fichier CSV :

   ```csv
   Identifiant, Prenom, Nom, Departement
   123456, Alice, Dupont, Informatique
   123457, Marc, Lemoine, Gestion
   123458, Claire, Martin, Science
   123459, Julien, Durand, Art
   123460, Sophie, Bernard, Mathématiques
   ```

2. **Script PowerShell** : Vous allez rédiger un script PowerShell qui va :
   - Lire les informations du fichier `etudiants.csv`.
   - Créer un compte pour chaque étudiant avec un nom d'utilisateur (`SamAccountName`) et un email basé sur l’identifiant (ex. `e123456@clajoie.com`).
   - Attribuer un mot de passe par défaut et obliger l’étudiant à le changer lors de sa première connexion.
   - Ajouter des informations supplémentaires, comme le nom complet et le département de l’étudiant.

3. **Conditions de sécurité** :
   - Utiliser un mot de passe fort pour chaque étudiant.
   - Assurer que chaque étudiant doit changer son mot de passe à la première connexion.

---

### Exemple de résultat attendu

Après l’exécution du script, chaque étudiant aura :
- Un compte Active Directory actif.
- Un email et un identifiant unique (`e123456@clajoie.com`).
- Un mot de passe par défaut à changer lors de la première connexion.
- Des informations de profil complètes (prénom, nom, département).

---

### 💡 Conseils

- **Vérification des données** : Avant d’exécuter le script, assurez-vous que le fichier CSV est bien formaté et que les informations sont correctes.
- **Simuler l’ajout** : Utilisez l'option `-WhatIf` dans PowerShell pour tester le script sans créer de comptes, afin de vérifier que tout fonctionne correctement.



# Réponse : 

Pour un ajout massif d'étudiants dans un collège en utilisant des comptes structurés avec des patterns comme `e123456@clajoie.com`, vous pouvez créer un script PowerShell automatisé. Ce script génèrera des comptes en suivant le modèle défini et ajoutera les utilisateurs avec des informations personnalisées dans Active Directory.

---

# 🎯 Objectif

Automatiser la création de comptes utilisateurs pour des étudiants dans Active Directory, en utilisant un modèle d'adresse email basé sur un identifiant unique, et en ajoutant des informations comme le prénom, le nom, le département, etc.

---

## 🛠️ Prérequis

- Un accès administrateur à Active Directory.
- PowerShell avec les permissions pour ajouter des utilisateurs.
- Un fichier source (CSV) contenant la liste des étudiants (facultatif mais recommandé).

---

## 📝 Étape 1 : Préparer le fichier CSV contenant la liste des étudiants

Pour faciliter la création des comptes, préparez un fichier CSV avec les informations des étudiants. Voici un exemple de fichier CSV, nommé `etudiants.csv`, contenant les colonnes nécessaires :

```csv
Identifiant, Prenom, Nom, Departement
123456, Alice, Dupont, Informatique
123457, Marc, Lemoine, Gestion
123458, Claire, Martin, Science
123459, Julien, Durand, Art
123460, Sophie, Bernard, Mathématiques
```

- **Identifiant** : Numéro d'identifiant unique pour chaque étudiant, qui sera intégré dans l'adresse email.
- **Prenom** et **Nom** : Prénom et nom de famille de l’étudiant.
- **Departement** : Département auquel appartient l’étudiant (optionnel).

---

## 📝 Étape 2 : Écrire le script PowerShell pour l'ajout massif

Ce script PowerShell lira les données du fichier CSV et créera un compte pour chaque étudiant en utilisant un mot de passe par défaut et en suivant le modèle d’adresse email `e123456@clajoie.com`.

```powershell
# Définir un mot de passe par défaut pour tous les comptes d'étudiants
$MotDePasse = ConvertTo-SecureString -AsPlainText "MotdePasse2024!" -Force

# Lire le fichier CSV contenant les informations des étudiants
$Etudiants = Import-Csv -Path "C:\chemin\vers\etudiants.csv"

# Parcourir chaque ligne du fichier CSV et créer un utilisateur
foreach ($Etudiant in $Etudiants) {
    # Générer l'adresse email et l'identifiant unique basé sur l'identifiant de l'étudiant
    $IdentifiantUnique = "e" + $Etudiant.Identifiant
    $Email = "$IdentifiantUnique@clajoie.com"
    
    # Créer le compte utilisateur dans Active Directory
    New-ADUser -Name $IdentifiantUnique `
               -GivenName $Etudiant.Prenom `
               -Surname $Etudiant.Nom `
               -DisplayName "$($Etudiant.Prenom) $($Etudiant.Nom)" `
               -UserPrincipalName $Email `
               -SamAccountName $IdentifiantUnique `
               -Department $Etudiant.Departement `
               -AccountPassword $MotDePasse `
               -Enabled $true `
               -ChangePasswordAtLogon $true
               
    Write-Output "Compte créé pour $($Etudiant.Prenom) $($Etudiant.Nom) avec l'email $Email"
}
```

### Explication du script

1. **Définition du mot de passe** : Le mot de passe par défaut pour tous les étudiants est défini dans `$MotDePasse` en utilisant `ConvertTo-SecureString` pour le rendre sécurisé.
   
2. **Lecture du fichier CSV** : Le script lit les informations des étudiants à partir du fichier `etudiants.csv` en utilisant `Import-Csv`.

3. **Création des utilisateurs** :
   - **Identifiant et email** : Le script génère un identifiant unique et un email pour chaque étudiant en utilisant son numéro d’identifiant dans le fichier CSV.
   - **New-ADUser** : Cette commande crée le compte utilisateur en Active Directory en utilisant les informations du fichier CSV :
     - `-Name` : Nom d’utilisateur unique (par ex. `e123456`).
     - `-GivenName` et `-Surname` : Prénom et nom de l’étudiant.
     - `-DisplayName` : Nom complet qui apparaît dans l’annuaire.
     - `-UserPrincipalName` : Email de connexion basé sur le modèle `e123456@clajoie.com`.
     - `-SamAccountName` : Utilise le même identifiant pour simplifier.
     - `-Department` : Département de l’étudiant, s’il est précisé dans le fichier CSV.
     - `-AccountPassword` : Mot de passe de l’utilisateur (défini dans `$MotDePasse`).
     - `-Enabled` : Active le compte immédiatement.
     - `-ChangePasswordAtLogon` : Oblige l’étudiant à changer son mot de passe lors de la première connexion.

4. **Confirmation de la création** : `Write-Output` affiche un message pour chaque étudiant, confirmant la création du compte et l’adresse email.

---

## 📝 Étape 3 : Vérifier la création des utilisateurs

Après avoir exécuté le script, vous pouvez lister tous les utilisateurs créés pour vérifier leur présence dans Active Directory.

```powershell
# Lister les comptes étudiants ajoutés avec l'email contenant "clajoie.com"
Get-ADUser -Filter "UserPrincipalName -like '*@clajoie.com'" -Properties DisplayName, UserPrincipalName
```

---

### ⚠️ Remarques importantes

- **Sécurité des mots de passe** : Utilisez un mot de passe fort par défaut. Il est recommandé de demander aux étudiants de le changer lors de la première connexion.
- **Vérification des données CSV** : Assurez-vous que les données dans le fichier CSV sont exactes pour éviter des erreurs dans les noms ou les identifiants.
- **Simulation de la création** : Avant de lancer le script en production, vous pouvez ajouter `-WhatIf` à la commande `New-ADUser` pour simuler la création des utilisateurs sans réellement les ajouter.

---

### 🎯 Conclusion

Ce script automatisé facilite l’ajout de comptes étudiants en suivant un modèle d’identifiant et d’email standard. En utilisant un fichier CSV pour les données source, vous pouvez facilement étendre ou modifier les informations et gérer efficacement l’intégration de nouveaux utilisateurs dans Active Directory.
