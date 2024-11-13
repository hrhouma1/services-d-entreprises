## 📚 Cours détaillé : Modifier les propriétés d'un ordinateur dans Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser PowerShell pour modifier les propriétés d'un ordinateur dans Active Directory (AD) avec la commande `Set-ADComputer`. Cette commande permet de mettre à jour des informations comme la description, les attributs personnalisés, et le système d'exploitation.

---

# ✨ Résumé des commandes

```powershell
# ✏️ Modifie la description de l'ordinateur "PCtest3"
Set-ADComputer -Identity PCtest3 -Description "Modification description"

# ➕ Ajoute un nouvel attribut "comment" à l'ordinateur "PCtest3"
Set-ADComputer -Identity PCtest3 -Add @{comment="test comment"}

# 🔄 Remplace la valeur de l'attribut "comment" par "comment modifié"
Set-ADComputer -Identity PCtest3 -Replace @{comment="comment modifié"}

# 🧹 Supprime l'attribut "comment" de l'ordinateur "PCtest3"
Set-ADComputer -Identity PCtest3 -Clear comment

# 🔄 Modifie la description de tous les ordinateurs ayant un système d'exploitation contenant "Server"
Get-ADComputer -Filter "OperatingSystem -like '*Server*'" -Properties Description | Set-ADComputer -Description "Windows Serveur"
```

---

# ✏️ Commande 1 : Modifier la description d'un ordinateur

```powershell
Set-ADComputer -Identity PCtest3 -Description "Modification description"
```

**Détails :**
- **Set-ADComputer** : Utilisé pour modifier les propriétés d’un objet ordinateur dans AD.
- **`-Description "Modification description"`** : Met à jour la description de l'ordinateur avec "Modification description".

Cette commande permet d'ajouter ou de mettre à jour des informations descriptives pour l'ordinateur.

---

# ➕ Commande 2 : Ajouter un nouvel attribut personnalisé

```powershell
Set-ADComputer -Identity PCtest3 -Add @{comment="test comment"}
```

**Détails :**
- **`-Add @{comment="test comment"}`** : Ajoute un attribut personnalisé "comment" avec la valeur "test comment".

Cette commande permet d’ajouter des informations supplémentaires, utiles pour des notes ou des annotations spécifiques.

---

# 🔄 Commande 3 : Remplacer la valeur d'un attribut

```powershell
Set-ADComputer -Identity PCtest3 -Replace @{comment="comment modifié"}
```

**Détails :**
- **`-Replace @{comment="comment modifié"}`** : Remplace la valeur de l'attribut "comment" par "comment modifié".

Cette commande est utile pour mettre à jour des informations existantes sans ajouter de nouveaux attributs.

---

# 🧹 Commande 4 : Supprimer un attribut

```powershell
Set-ADComputer -Identity PCtest3 -Clear comment
```

**Détails :**
- **`-Clear comment`** : Supprime l'attribut "comment" de l'ordinateur "PCtest3".

Cette commande est utilisée pour supprimer des informations devenues obsolètes ou inutiles.

---

# 🔄 Commande 5 : Modifier la description pour tous les ordinateurs ayant un OS spécifique

```powershell
Get-ADComputer -Filter "OperatingSystem -like '*Server*'" -Properties Description | Set-ADComputer -Description "Windows Serveur"
```

**Détails :**
- **Get-ADComputer -Filter "OperatingSystem -like '*Server*'"** : Filtre pour sélectionner les ordinateurs dont le système d'exploitation contient "Server".
- **Set-ADComputer -Description "Windows Serveur"** : Met à jour la description de chaque ordinateur filtré avec "Windows Serveur".

Cette commande est pratique pour appliquer une modification à plusieurs ordinateurs répondant à un critère spécifique.

---

### 📝 Résumé

Ces commandes PowerShell permettent de modifier les propriétés d'un ordinateur dans Active Directory, en ajoutant ou en mettant à jour des descriptions, des attributs personnalisés, et des informations spécifiques à chaque machine. Elles facilitent la gestion et la mise à jour des ordinateurs dans un environnement AD.
