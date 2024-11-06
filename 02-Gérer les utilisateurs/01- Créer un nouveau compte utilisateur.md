# 📘 Guide détaillé pour la création de comptes utilisateurs dans Active Directory avec PowerShell

Ce guide explique comment créer des comptes utilisateurs dans Active Directory (AD) en utilisant PowerShell avec différentes options de configuration, comme le mot de passe, l'expiration du compte, et la définition de l'unité d'organisation (OU). Cela permet d'automatiser la gestion des comptes et de configurer des utilisateurs avec des paramètres spécifiques.

---

## ✅ Étape préalable : Définir un mot de passe sécurisé pour les utilisateurs

Pour créer un compte utilisateur avec PowerShell, il est souvent nécessaire de définir un mot de passe initial de manière sécurisée. La commande `ConvertTo-SecureString` permet de convertir un mot de passe en format sécurisé.

```powershell
# Définit un mot de passe sécurisé pour les utilisateurs
$MDP = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
```

- **But** : Convertir le mot de passe en une chaîne sécurisée pour la sécurité des informations.
- **Explication** :
  - `ConvertTo-SecureString` : Convertit un texte clair en un format de mot de passe sécurisé pour une utilisation dans Active Directory.
  - `-AsPlainText "P@$$word"` : Spécifie le mot de passe en texte clair (uniquement en environnement sécurisé).
  - `-Force` : Force la conversion en mot de passe sécurisé même si le texte est en clair.

---

## ✅ Commandes pour créer des comptes utilisateurs avec différentes configurations

### 1️⃣ Créer un compte utilisateur de base

```powershell
# Crée un utilisateur nommé Jean DUBOIS avec un mot de passe défini et activé
New-ADUser -GivenName "Jean" -Surname "DUBOIS" -Name "jdubois" `
           -DisplayName "Jean DUBOIS" -UserPrincipalName "jdubois@lab.lan" `
           -AccountPassword $MDP -Enabled $true
```

- **But** : Créer un utilisateur `Jean DUBOIS` avec le compte `jdubois`, activé et avec un mot de passe défini.
- **Explication** :
  - `-GivenName` et `-Surname` : Prénom et nom de famille de l'utilisateur.
  - `-Name` : Nom du compte (logon name) utilisé pour la connexion.
  - `-DisplayName` : Nom d'affichage complet de l'utilisateur.
  - `-UserPrincipalName` : Nom principal de l'utilisateur (UPN) utilisé pour se connecter, ici `jdubois@lab.lan`.
  - `-AccountPassword $MDP` : Définit le mot de passe en utilisant la variable `$MDP`.
  - `-Enabled $true` : Active le compte utilisateur lors de la création.

---

### 2️⃣ Créer un utilisateur avec obligation de changer le mot de passe au premier logon

```powershell
# Crée un utilisateur Marc LEROY avec un mot de passe initial et l'obligation de le changer
New-ADUser -GivenName "Marc" -Surname "LEROY" -Name "mleroy" `
           -DisplayName "Marc LEROY" -UserPrincipalName "mleroy@lab.lan" `
           -AccountPassword $MDP -ChangePasswordAtLogon $true -Enabled $true
```

- **But** : Créer un utilisateur `Marc LEROY` avec l'obligation de changer son mot de passe lors de la première connexion.
- **Explication** : 
  - `-ChangePasswordAtLogon $true` : Demande à l’utilisateur de changer son mot de passe lors de la première connexion.

---

### 3️⃣ Créer un utilisateur avec un mot de passe qui ne peut pas être modifié

```powershell
# Crée un utilisateur Damien ROCHE avec un mot de passe que l'utilisateur ne peut pas changer
New-ADUser -GivenName "Damien" -Surname "ROCHE" -Name "droche" `
           -DisplayName "Damien ROCHE" -UserPrincipalName "droche@lab.lan" `
           -AccountPassword $MDP -CannotChangePassword $true -Enabled $true
```

- **But** : Créer un utilisateur `Damien ROCHE` avec un mot de passe qui ne peut pas être changé par l’utilisateur.
- **Explication** :
  - `-CannotChangePassword $true` : Interdit à l’utilisateur de modifier son mot de passe.

---

### 4️⃣ Créer un utilisateur avec une date d'expiration du compte

```powershell
# Crée un utilisateur Jean LEBON avec un compte expirant le 30/12/2023
New-ADUser -GivenName "Jean" -Surname "LEBON" -Name "jlebon" `
           -DisplayName "Jean LEBON" -UserPrincipalName "jlebon@lab.lan" `
           -AccountPassword $MDP -AccountExpirationDate "30/12/2023" -Enabled $true
```

- **But** : Créer un utilisateur `Jean LEBON` dont le compte expirera automatiquement le 30 décembre 2023.
- **Explication** :
  - `-AccountExpirationDate "30/12/2023"` : Définit une date d’expiration pour le compte.

---

### 5️⃣ Créer un utilisateur sur un contrôleur de domaine spécifique

```powershell
# Crée un utilisateur Jean LEBON avec une date d'expiration et en précisant le serveur de domaine
New-ADUser -GivenName "Jean" -Surname "LEBON" -Name "jlebon" `
           -DisplayName "Jean LEBON" -UserPrincipalName "jlebon@lab.lan" `
           -AccountPassword $MDP -AccountExpirationDate "30/12/2023" `
           -Server paris.lab.lan -Enabled $true
```

- **But** : Créer un utilisateur `Jean LEBON` sur un contrôleur de domaine spécifique `paris.lab.lan`.
- **Explication** :
  - `-Server paris.lab.lan` : Spécifie le serveur Active Directory (contrôleur de domaine) sur lequel créer l'utilisateur.

---

### 6️⃣ Créer un utilisateur dans une unité d'organisation (OU) spécifique

```powershell
# Crée un utilisateur Jérôme DUROC dans une unité d'organisation spécifique
New-ADUser -GivenName "Jérôme" -Surname "DUROC" -Name "jduroc" `
           -DisplayName "Jérôme DUROC" -UserPrincipalName "jduroc@lab.lan" `
           -AccountPassword $MDP -Enabled $true -Path "OU=OUTest,DC=lab,DC=lan"
```

- **But** : Créer un utilisateur `Jérôme DUROC` dans une unité d'organisation spécifique `OU=OUTest,DC=lab,DC=lan`.
- **Explication** :
  - `-Path "OU=OUTest,DC=lab,DC=lan"` : Définit l’unité d’organisation (OU) dans laquelle l’utilisateur sera placé.

---

### 7️⃣ Créer un utilisateur avec des attributs personnalisés

```powershell
# Crée un utilisateur user1 avec des attributs supplémentaires
New-ADUser -Name "user1" -OtherAttributes @{info="test info"}
```

- **But** : Créer un utilisateur `user1` avec un attribut personnalisé `info`.
- **Explication** :
  - `-OtherAttributes @{info="test info"}` : Permet d’ajouter des attributs personnalisés en utilisant une syntaxe de type dictionnaire (`@{clé="valeur"}`).

---

### 📝 Remarques supplémentaires

- **Attention à la sécurité du mot de passe** : Le mot de passe est ici défini en clair pour des raisons d’exemple, mais il est recommandé de le demander de manière sécurisée dans un environnement de production.
- **Rôle et permissions** : Assurez-vous que le script est exécuté par un utilisateur ayant les permissions nécessaires pour créer des comptes dans Active Directory.

---

### 🎯 Conclusion

Ce guide vous montre comment créer des comptes utilisateurs avec PowerShell dans Active Directory, en incluant des configurations courantes comme la définition d’un mot de passe sécurisé, la date d'expiration, et le placement dans une unité d'organisation spécifique. Grâce à ces commandes, la gestion des utilisateurs devient plus simple et rapide, en automatisant la création de comptes avec des paramètres personnalisés adaptés aux besoins de l’organisation.
