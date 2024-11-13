## 📚 Cours détaillé : Configurer les PSO (Password Settings Objects) dans Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser PowerShell pour configurer et gérer des Password Settings Objects (PSO) dans Active Directory (AD) à l'aide de différentes commandes. Les PSO permettent de définir des stratégies de mots de passe granulaires, applicables à des utilisateurs ou groupes spécifiques, et offrent une plus grande flexibilité dans la gestion des politiques de sécurité.

---

# ✨ Résumé des commandes

```powershell
# 🔍 Liste toutes les stratégies de mots de passe granulaires dans Active Directory
Get-ADFineGrainedPasswordPolicy -Filter *

# 🔍 Filtre les PSO dont la durée maximale de mot de passe est supérieure à 10 jours
Get-ADFineGrainedPasswordPolicy -Filter "MaxPasswordAge -gt '10'"

# 👤 Récupère les sujets d'une stratégie de mots de passe granulaire spécifique
Get-ADFineGrainedPasswordPolicySubject -Identity Test-PSO2

# 🆕 Crée une nouvelle PSO nommée "PSO-Test" avec des paramètres spécifiques
New-ADFineGrainedPasswordPolicy -Name PSO-Test `
-ComplexityEnabled $true `
-LockoutDuration 00:30:00 `
-LockoutObservationWindow 00:30:00 `
-LockoutThreshold 0 `
-MaxPasswordAge 60.00:00:00 `
-MinPasswordAge 5.00:00:00 `
-MinPasswordLength 10 `
-Precedence 5 

# 🔄 Vérifie les paramètres de la PSO "PSO-Test"
Get-ADFineGrainedPasswordPolicy PSO-Test

# ➕ Associe la PSO "PSO-Test" au groupe "GroupeTest3"
Add-ADFineGrainedPasswordPolicySubject -Identity PSO-Test -Subjects GroupeTest3

# ➕ Associe la PSO "PSO-Test" à tous les utilisateurs dont le titre commence par "Ingé"
Get-ADUser -Filter "title -like 'Ingé*'" | Add-ADFineGrainedPasswordPolicySubject -Identity PSO-Test

# ✏️ Modifie la durée maximale du mot de passe pour la PSO "PSO-Test"
Set-ADFineGrainedPasswordPolicy -Identity PSO-Test -MaxPasswordAge 50.00:00:00

# 🔍 Vérifie les modifications apportées à la PSO "PSO-Test"
Get-ADFineGrainedPasswordPolicy PSO-Test

# 🔍 Récupère la stratégie de mot de passe applicable à l'utilisateur "sleroy"
Get-ADUserResultantPasswordPolicy sleroy

# 🗑️ Supprime la PSO "Test-PSO2" sans confirmation
Remove-ADFineGrainedPasswordPolicy -Identity Test-PSO2 -Confirm:$false

# 🔒 Désactive la protection contre la suppression accidentelle pour "Test-PSO1"
Set-ADFineGrainedPasswordPolicy -Identity Test-PSO1 -ProtectedFromAccidentalDeletion $false

# 🔍 Vérifie les paramètres de la PSO "Test-PSO1"
Get-ADFineGrainedPasswordPolicy Test-PSO1

# 🗑️ Supprime l'association entre "Test-PSO1" et l'utilisateur "sleroy" sans confirmation
Remove-ADFineGrainedPasswordPolicySubject -Identity Test-PSO1 -Subjects sleroy -Confirm:$false
```

---

# 🔍 Commande 1 : Lister toutes les stratégies de mots de passe granulaires

```powershell
Get-ADFineGrainedPasswordPolicy -Filter *
```

**Détails :**
- **Get-ADFineGrainedPasswordPolicy -Filter *** : Liste toutes les PSO disponibles dans Active Directory.

Cette commande est utilisée pour obtenir un aperçu de toutes les stratégies de mots de passe granulaires dans le domaine.

---

# 👤 Commande 2 : Récupérer les sujets d'une PSO spécifique

```powershell
Get-ADFineGrainedPasswordPolicySubject -Identity Test-PSO2
```

**Détails :**
- **Get-ADFineGrainedPasswordPolicySubject** : Affiche les utilisateurs ou groupes associés à la PSO spécifiée.

---

# 🆕 Commande 3 : Créer une nouvelle PSO avec des paramètres spécifiques

```powershell
New-ADFineGrainedPasswordPolicy -Name PSO-Test `
-ComplexityEnabled $true `
-LockoutDuration 00:30:00 `
-LockoutObservationWindow 00:30:00 `
-LockoutThreshold 0 `
-MaxPasswordAge 60.00:00:00 `
-MinPasswordAge 5.00:00:00 `
-MinPasswordLength 10 `
-Precedence 5
```

**Détails :**
- **New-ADFineGrainedPasswordPolicy** : Crée une nouvelle PSO avec des paramètres de sécurité, incluant la complexité et les durées de verrouillage et de mot de passe.

---

# ➕ Commande 4 : Associer une PSO à des groupes ou utilisateurs spécifiques

```powershell
Add-ADFineGrainedPasswordPolicySubject -Identity PSO-Test -Subjects GroupeTest3
```

**Détails :**
- **Add-ADFineGrainedPasswordPolicySubject** : Associe la PSO spécifiée à un groupe ou utilisateur.

---

# ✏️ Commande 5 : Modifier une PSO existante

```powershell
Set-ADFineGrainedPasswordPolicy -Identity PSO-Test -MaxPasswordAge 50.00:00:00
```

**Détails :**
- **Set-ADFineGrainedPasswordPolicy** : Modifie les paramètres d'une PSO existante.

---

# 🔍 Commande 6 : Récupérer la PSO applicable à un utilisateur

```powershell
Get-ADUserResultantPasswordPolicy sleroy
```

**Détails :**
- **Get-ADUserResultantPasswordPolicy** : Affiche la PSO effective pour un utilisateur spécifique.

---

# 🗑️ Commande 7 : Supprimer une PSO ou une association avec un utilisateur ou groupe

```powershell
Remove-ADFineGrainedPasswordPolicy -Identity Test-PSO2 -Confirm:$false
Remove-ADFineGrainedPasswordPolicySubject -Identity Test-PSO1 -Subjects sleroy -Confirm:$false
```

**Détails :**
- **Remove-ADFineGrainedPasswordPolicy** : Supprime une PSO.
- **Remove-ADFineGrainedPasswordPolicySubject** : Supprime une association PSO avec un utilisateur/groupe.

---

### 📝 Résumé

Ces commandes PowerShell permettent de créer, configurer, associer et supprimer des stratégies de mots de passe granulaires (PSO) dans Active Directory. En définissant des PSO pour des utilisateurs ou groupes spécifiques, on peut personnaliser les politiques de sécurité au-delà de la stratégie de domaine par défaut, pour répondre aux besoins de sécurité particuliers de l'organisation.
