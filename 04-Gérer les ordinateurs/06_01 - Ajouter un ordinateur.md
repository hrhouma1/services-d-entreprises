## 📚 Cours détaillé : Ajouter un ordinateur dans Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser la commande `New-ADComputer` de PowerShell pour ajouter de nouveaux ordinateurs dans Active Directory (AD). Cette commande permet de créer des objets ordinateur avec des propriétés spécifiques, facilitant la gestion des machines dans le domaine.

---

# ✨ Résumé des commandes

```powershell
# 💻 Crée un nouvel ordinateur nommé "PCTest1"
New-ADComputer -Name PCTest1

# 📂 Crée un ordinateur nommé "PCTest2" dans un chemin OU spécifique
New-ADComputer -Name PCTest2 -Path "CN=Builtin,DC=lab,DC=lan"

# 🔐 Crée un ordinateur nommé "PCtest3" avec la délégation de confiance activée
New-ADComputer -Name PCtest3 -TrustedForDelegation $true

# 🖥️ Crée un ordinateur nommé "PCtest3" avec un système d'exploitation spécifié
New-ADComputer -Name PCtest3 -OperatingSystem "Windows Server 2016"
```

---

# 💻 Commande 1 : Créer un nouvel ordinateur avec un nom spécifique

```powershell
New-ADComputer -Name PCTest1
```

**Détails :**
- **New-ADComputer** : Utilisé pour créer un nouvel objet ordinateur dans AD.
- **`-Name PCTest1`** : Définit le nom de l'ordinateur, ici "PCTest1".

Cette commande ajoute un nouvel ordinateur au domaine avec un nom unique.

---

# 📂 Commande 2 : Créer un ordinateur dans une unité organisationnelle (OU) spécifique

```powershell
New-ADComputer -Name PCTest2 -Path "CN=Builtin,DC=lab,DC=lan"
```

**Détails :**
- **`-Path`** : Spécifie le chemin d'emplacement de l'ordinateur dans AD, ici "CN=Builtin,DC=lab,DC=lan".

Cette commande permet de placer un nouvel ordinateur dans une OU particulière pour une meilleure organisation.

---

# 🔐 Commande 3 : Créer un ordinateur avec la délégation de confiance activée

```powershell
New-ADComputer -Name PCtest3 -TrustedForDelegation $true
```

**Détails :**
- **`-TrustedForDelegation $true`** : Active la délégation de confiance pour cet ordinateur, autorisant des services à se déléguer.

Cette commande est utile lorsque l'ordinateur doit être autorisé à déléguer des actions au nom d'autres utilisateurs ou services.

---

# 🖥️ Commande 4 : Créer un ordinateur avec un système d'exploitation spécifique

```powershell
New-ADComputer -Name PCtest3 -OperatingSystem "Windows Server 2016"
```

**Détails :**
- **`-OperatingSystem "Windows Server 2016"`** : Définit le système d'exploitation de l'ordinateur dans AD.

Cette commande permet de documenter le système d'exploitation de chaque machine pour une gestion plus précise des versions et configurations.

---

### 📝 Résumé

Ces commandes PowerShell permettent de créer des objets ordinateur dans Active Directory avec des propriétés spécifiques, comme le nom, le chemin d'OU, la délégation de confiance, et le système d'exploitation. Elles facilitent l'ajout et la gestion des ordinateurs dans un environnement AD pour une organisation et un contrôle optimaux.
