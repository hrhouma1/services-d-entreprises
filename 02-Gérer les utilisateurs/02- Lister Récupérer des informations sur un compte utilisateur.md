# 📘 Guide pour lister et récupérer des informations sur un compte utilisateur dans Active Directory avec PowerShell

Ce guide explique comment utiliser PowerShell pour lister les comptes utilisateurs dans Active Directory (AD) et récupérer des informations spécifiques sur ces comptes. Les commandes présentées ici permettent de rechercher des utilisateurs avec différents filtres et d’obtenir des propriétés détaillées pour la gestion et l’audit des utilisateurs dans AD.

---

## ✅ Commandes pour lister et récupérer des informations sur les utilisateurs

### 1️⃣ Récupérer un utilisateur spécifique par son nom

Pour obtenir les informations de base d'un utilisateur spécifique, utilisez la commande suivante :

```powershell
# Récupère les informations de l'utilisateur nommé "Administrateur"
Get-ADUser -Filter "Name -eq 'Administrateur'"
```

- **But** : Rechercher un utilisateur spécifique en fonction de son nom dans Active Directory.
- **Explication** :
  - `Get-ADUser` : Cmdlet qui récupère les informations sur les utilisateurs dans AD.
  - `-Filter "Name -eq 'Administrateur'"` : Filtre pour rechercher un utilisateur avec le nom exact "Administrateur".

---

### 2️⃣ Récupérer toutes les propriétés d'un utilisateur

Pour obtenir toutes les informations disponibles sur un utilisateur spécifique, y compris les attributs personnalisés et cachés, utilisez `-Properties *`.

```powershell
# Récupère toutes les propriétés de l'utilisateur "Administrateur"
Get-ADUser -Filter "Name -eq 'Administrateur'" -Properties *
```

- **But** : Afficher toutes les propriétés associées à l'utilisateur "Administrateur" dans AD.
- **Explication** :
  - `-Properties *` : Charge toutes les propriétés de l’utilisateur, y compris les informations de profil, de compte, et d’attributs personnalisés.
  - Utiliser cette option peut être utile pour obtenir des informations complètes dans le cadre d’un audit ou d’une analyse.

---

### 3️⃣ Lister tous les utilisateurs dans Active Directory

Pour obtenir la liste complète de tous les utilisateurs, utilisez un filtre générique :

```powershell
# Récupère tous les utilisateurs dans Active Directory
Get-ADUser -Filter *
```

- **But** : Lister tous les utilisateurs dans AD sans appliquer de filtres.
- **Explication** : `-Filter *` indique qu’aucun filtre n’est appliqué, ce qui renvoie tous les utilisateurs de l'annuaire.

---

### 4️⃣ Lister uniquement les utilisateurs actifs

Pour obtenir la liste des utilisateurs dont les comptes sont activés, utilisez le filtre suivant :

```powershell
# Récupère les utilisateurs actifs dans Active Directory
Get-ADUser -Filter "Enabled -eq '$true'" | Select-Object Name
```

- **But** : Lister tous les utilisateurs dont les comptes sont activés dans AD.
- **Explication** :
  - `-Filter "Enabled -eq '$true'"` : Filtre pour récupérer uniquement les comptes actifs.
  - `| Select-Object Name` : Sélectionne uniquement la propriété `Name` pour un affichage simplifié.

---

### 5️⃣ Lister les utilisateurs actifs dans une unité d'organisation (OU) spécifique

Pour lister les utilisateurs actifs dans une OU spécifique, utilisez `-SearchBase` pour définir l’emplacement de recherche.

```powershell
# Récupère les utilisateurs actifs dans l'OU "Users" du domaine "lab.lan"
Get-ADUser -Filter "Enabled -eq '$true'" -SearchBase "CN=Users,DC=lab,DC=lan" | Select-Object Name
```

- **But** : Lister les utilisateurs actifs dans une unité d'organisation spécifique (ici, `Users` dans `lab.lan`).
- **Explication** :
  - `-SearchBase "CN=Users,DC=lab,DC=lan"` : Définit l’emplacement de recherche dans l'OU `Users` du domaine `lab.lan`.
  - Ce filtre est utile pour restreindre la recherche aux utilisateurs d'une unité d'organisation spécifique.

---

## ✅ Commandes pour obtenir des informations supplémentaires

### 6️⃣ Compter le nombre de groupes dans Active Directory

Pour obtenir le nombre total de groupes dans AD, utilisez la commande suivante :

```powershell
# Compte le nombre de groupes dans Active Directory
(Get-ADGroup -Filter *).count
```

- **But** : Compter tous les groupes dans Active Directory.
- **Explication** :
  - `Get-ADGroup -Filter *` : Récupère tous les groupes sans filtrer.
  - `.count` : Propriété qui compte le nombre total de groupes renvoyés par la commande.
  - Cette commande peut être utilisée pour un aperçu rapide de la structure de l’AD en termes de groupes d’utilisateurs.

---

### 📝 Remarques supplémentaires

- **Précautions sur l’utilisation des filtres** : Lors de l’utilisation de filtres pour rechercher des utilisateurs, soyez précis pour éviter des résultats inattendus, surtout dans les environnements AD de grande taille.
- **Chargement de propriétés spécifiques** : Charger uniquement les propriétés nécessaires (par exemple, `-Properties DisplayName, EmailAddress`) au lieu de `-Properties *` pour des raisons de performance.
- **Permissions requises** : Assurez-vous que le compte exécutant ces commandes a les permissions nécessaires pour interroger les informations dans Active Directory.

---

### 🎯 Conclusion

Ce guide vous permet de lister et de récupérer des informations détaillées sur les utilisateurs dans Active Directory, en adaptant les recherches selon les besoins spécifiques. Ces commandes PowerShell sont utiles pour l’audit, la gestion quotidienne des utilisateurs, et la maintenance de l’Active Directory.
