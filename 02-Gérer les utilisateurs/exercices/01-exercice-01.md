# Exercice #1 sur la gestion des comptes utilisateurs Active Directory avec PowerShell

Cet exercice vous guidera étape par étape pour créer, lister, modifier et supprimer des comptes utilisateurs dans Active Directory en utilisant PowerShell. Chaque étape est expliquée en détail pour vous assurer de bien comprendre chaque commande et de maîtriser la gestion des utilisateurs dans Active Directory.

---

## 🎯 Objectif

À la fin de cet exercice, vous serez capable de :
1. Créer un nouveau compte utilisateur dans Active Directory.
2. Lister et récupérer des informations sur les comptes utilisateurs.
3. Modifier les propriétés d'un compte utilisateur.
4. Supprimer un compte utilisateur de manière sécurisée.

---

## 🛠️ Prérequis

- Avoir accès à un environnement Active Directory.
- Pouvoir exécuter PowerShell en tant qu'administrateur.
- Disposer des permissions nécessaires pour gérer les utilisateurs dans Active Directory.

---

## 📝 Étape 1 : Créer un nouveau compte utilisateur

### 🎯 Objectif de cette étape

Vous allez apprendre à créer un compte utilisateur avec un mot de passe sécurisé, des informations de profil, et l'activation immédiate du compte.

### 🔄 Action

1. **Ouvrez PowerShell** avec des droits administratifs.
2. **Définissez un mot de passe sécurisé** pour l'utilisateur en utilisant la commande suivante :

   ```powershell
   # Crée une chaîne de mot de passe sécurisée pour l'utilisateur
   $MDP = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
   ```

   - Cette commande convertit le mot de passe `"P@$$word"` en un format sécurisé. **Ne jamais utiliser des mots de passe en clair en production !**

3. **Créez un nouvel utilisateur** dans Active Directory avec les informations suivantes :
   - Prénom : `Alice`
   - Nom de famille : `Martin`
   - Nom de connexion : `amartin`
   - Affichage complet : `Alice MARTIN`
   - Adresse de connexion : `amartin@lab.lan`

   ```powershell
   # Crée un compte utilisateur pour Alice MARTIN
   New-ADUser -GivenName "Alice" -Surname "Martin" -Name "amartin" `
              -DisplayName "Alice MARTIN" -UserPrincipalName "amartin@lab.lan" `
              -AccountPassword $MDP -Enabled $true
   ```

4. **Vérifiez la création** de l’utilisateur en listant tous les utilisateurs de votre AD (voir Étape 2).

---

## 📝 Étape 2 : Lister et récupérer des informations sur un compte utilisateur

### 🎯 Objectif de cette étape

Apprendre à lister tous les utilisateurs, puis à cibler un utilisateur spécifique pour récupérer des informations détaillées.

### 🔄 Action

1. **Lister tous les utilisateurs** dans Active Directory en utilisant :

   ```powershell
   # Liste tous les utilisateurs dans AD
   Get-ADUser -Filter *
   ```

   - Cette commande renvoie tous les utilisateurs enregistrés dans AD.

2. **Récupérez les informations de l'utilisateur Alice MARTIN** en spécifiant son nom :

   ```powershell
   # Récupère les informations de l'utilisateur "Alice MARTIN"
   Get-ADUser -Filter "Name -eq 'Alice MARTIN'"
   ```

   - Cela vous permet de voir les informations de base de l'utilisateur `Alice MARTIN`.

3. **Afficher toutes les propriétés** d'Alice MARTIN, y compris celles qui ne sont pas affichées par défaut :

   ```powershell
   # Affiche toutes les propriétés de l'utilisateur "Alice MARTIN"
   Get-ADUser -Filter "Name -eq 'Alice MARTIN'" -Properties *
   ```

   - Cette commande est utile pour voir des informations détaillées, comme l’adresse email, les informations de connexion, etc.

---

## 📝 Étape 3 : Modifier un compte utilisateur

### 🎯 Objectif de cette étape

Vous allez modifier des informations pour l’utilisateur `Alice MARTIN`, en ajoutant une description et en lui assignant un titre.

### 🔄 Action

1. **Ajoutez une description** au compte utilisateur d'Alice :

   ```powershell
   # Ajoute une description au compte d'Alice MARTIN
   Set-ADUser -Identity amartin -Description "Utilisateur de test"
   ```

   - **Explication** : Cette commande ajoute une description pour aider à identifier le rôle ou la fonction de l'utilisateur.

2. **Définissez un titre** pour Alice, par exemple `"Développeuse Junior"` :

   ```powershell
   # Définit le titre de l'utilisateur Alice MARTIN
   Set-ADUser -Identity amartin -Title "Développeuse Junior"
   ```

3. **Ajoutez un champ personnalisé** pour indiquer sa division (`Développement`) :

   ```powershell
   # Ajoute la division de l'utilisateur Alice MARTIN
   Set-ADUser -Identity amartin -Add @{division="Développement"}
   ```

4. **Vérifiez les modifications** apportées au compte utilisateur :

   ```powershell
   # Vérifie les nouvelles informations de l'utilisateur
   Get-ADUser -Filter "Name -eq 'Alice MARTIN'" -Properties Description, Title, division
   ```

   - Vous devriez voir les informations mises à jour, comme la description, le titre, et la division.

---

## 📝 Étape 4 : Supprimer un compte utilisateur

### 🎯 Objectif de cette étape

Vous allez supprimer le compte utilisateur `Alice MARTIN`. **Attention :** Cette action est irréversible, donc à utiliser avec précaution.

### 🔄 Action

1. **Simulez la suppression** du compte pour voir ce qui se passerait sans réellement exécuter la suppression :

   ```powershell
   # Simule la suppression de l'utilisateur Alice MARTIN
   Remove-ADUser -Identity amartin -WhatIf
   ```

   - **Explication** : L'option `-WhatIf` permet de voir ce que ferait la commande sans l’exécuter réellement.

2. **Supprimez réellement** le compte utilisateur :

   ```powershell
   # Supprime l'utilisateur Alice MARTIN sans confirmation
   Remove-ADUser -Identity amartin -Confirm:$false
   ```

   - **Explication** : `-Confirm:$false` supprime l’utilisateur sans demander de confirmation, ce qui est utile pour des scripts automatisés.

3. **Vérifiez la suppression** en listant de nouveau les utilisateurs :

   ```powershell
   # Vérifie si l'utilisateur a bien été supprimé
   Get-ADUser -Filter "Name -eq 'Alice MARTIN'"
   ```

   - Si la commande ne renvoie aucun résultat, cela signifie que l’utilisateur a été supprimé avec succès.

---

### 📘 Récapitulatif

Vous avez maintenant appris à :
1. **Créer un nouveau compte utilisateur** avec PowerShell.
2. **Lister et récupérer des informations** sur un compte utilisateur spécifique.
3. **Modifier un compte utilisateur** pour ajouter des informations et personnaliser son profil.
4. **Supprimer un compte utilisateur** de manière sécurisée en utilisant des options pour simuler ou confirmer l’action.

---

### 📝 Remarques

- **Sécurité des mots de passe** : En environnement de production, évitez d’utiliser des mots de passe en clair. Demandez à l’utilisateur de changer son mot de passe lors de la première connexion.
- **Prudence pour les suppressions** : Utilisez toujours `-WhatIf` pour simuler les suppressions en bloc, surtout si vous travaillez dans un environnement de production.
- **Permission requise** : Assurez-vous d’avoir les droits nécessaires dans Active Directory pour effectuer ces opérations.

---

Cet exercice vous a permis de couvrir les bases de la gestion des utilisateurs dans Active Directory avec PowerShell. Vous êtes désormais prêt à gérer efficacement les utilisateurs dans un environnement AD.
