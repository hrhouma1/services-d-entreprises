## 📚 Cours détaillé : Modifier les propriétés d'un groupe Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser PowerShell pour modifier les propriétés d'un groupe Active Directory (AD) avec la commande `Set-ADGroup`. Ces commandes permettent de mettre à jour la description, la portée, la catégorie, et les attributs personnalisés d'un groupe pour une gestion plus efficace.

---

# ✨ Résumé des commandes

```powershell
# 🔍 Affiche les informations actuelles du groupe "GroupeTest1"
Get-ADGroup -Identity GroupeTest1

# ✏️ Modifie la description du groupe "GroupeTest1"
Set-ADGroup -Identity GroupeTest1 -Description "Test description"

# 🔄 Change la catégorie et la portée du groupe "GroupeTest1" en "Security" et "Universal"
Set-ADGroup -Identity GroupeTest1 -GroupCategory Security -GroupScope Universal

# ➕ Ajoute un nouvel attribut "info" au groupe "GroupeTest1"
Set-ADGroup -Identity GroupeTest1 -Add @{info="info test"}

# ➕ Ajoute deux attributs personnalisés "info" et "extensionName" au groupe "GroupeTest1"
Set-ADGroup -Identity GroupeTest1 -Add @{info="info test"; extensionName="deuxième modif"}

# 🔄 Remplace la valeur de l'attribut "info" par "info modifiée"
Set-ADGroup -Identity GroupeTest1 -Replace @{info="info modifiée"}

# 🧹 Supprime l'attribut "info" du groupe "GroupeTest1"
Set-ADGroup -Identity GroupeTest1 -Clear info

# 🧹 Supprime tous les membres du groupe "GroupeTest3"
Get-ADGroup -Identity GroupeTest3 | Set-ADGroup -Clear member
```

---

# 🔍 Commande 1 : Afficher les informations actuelles d'un groupe

```powershell
Get-ADGroup -Identity GroupeTest1
```

**Détails :**
- **Get-ADGroup** : Affiche les informations de base d’un groupe AD.
- **`-Identity GroupeTest1`** : Spécifie le groupe cible, ici "GroupeTest1".

Cette commande permet de consulter les informations actuelles du groupe avant de les modifier.

---

# ✏️ Commande 2 : Modifier la description d'un groupe

```powershell
Set-ADGroup -Identity GroupeTest1 -Description "Test description"
```

**Détails :**
- **Set-ADGroup** : Utilisé pour modifier les propriétés d’un groupe AD.
- **`-Description "Test description"`** : Met à jour la description du groupe avec "Test description".

Cette commande permet d'ajouter des informations supplémentaires sur le groupe en modifiant sa description.

---

# 🔄 Commande 3 : Changer la catégorie et la portée d'un groupe

```powershell
Set-ADGroup -Identity GroupeTest1 -GroupCategory Security -GroupScope Universal
```

**Détails :**
- **`-GroupCategory Security`** : Définit le groupe comme un groupe de sécurité.
- **`-GroupScope Universal`** : Définit la portée du groupe en tant qu'universelle, permettant l’accès entre plusieurs domaines.

---

# ➕ Commande 4 : Ajouter un nouvel attribut au groupe

```powershell
Set-ADGroup -Identity GroupeTest1 -Add @{info="info test"}
```

**Détails :**
- **`-Add @{info="info test"}`** : Ajoute un attribut personnalisé "info" avec la valeur "info test".

Cette commande permet d'ajouter des informations supplémentaires en créant de nouveaux attributs.

---

# ➕ Commande 5 : Ajouter plusieurs attributs personnalisés

```powershell
Set-ADGroup -Identity GroupeTest1 -Add @{info="info test"; extensionName="deuxième modif"}
```

**Détails :**
- **`-Add @{info="info test"; extensionName="deuxième modif"}`** : Ajoute deux attributs personnalisés avec leurs valeurs respectives.

Cela permet de gérer plusieurs informations en une seule commande en ajoutant plusieurs attributs.

---

# 🔄 Commande 6 : Remplacer la valeur d'un attribut

```powershell
Set-ADGroup -Identity GroupeTest1 -Replace @{info="info modifiée"}
```

**Détails :**
- **`-Replace @{info="info modifiée"}`** : Remplace la valeur de l'attribut "info" par "info modifiée".

Cette commande est utilisée pour mettre à jour une valeur existante d’un attribut sans en créer un nouveau.

---

# 🧹 Commande 7 : Supprimer un attribut d'un groupe

```powershell
Set-ADGroup -Identity GroupeTest1 -Clear info
```

**Détails :**
- **`-Clear info`** : Supprime l'attribut "info" du groupe "GroupeTest1".

Cette commande est utile pour effacer des informations devenues obsolètes.

---

# 🧹 Commande 8 : Supprimer tous les membres d'un groupe

```powershell
Get-ADGroup -Identity GroupeTest3 | Set-ADGroup -Clear member
```

**Détails :**
- **`Set-ADGroup -Clear member`** : Supprime tous les membres d’un groupe en utilisant le paramètre `-Clear member`.

Cela permet de réinitialiser un groupe en le vidant de ses membres actuels.

---

### 📝 Résumé

Ces commandes PowerShell permettent de gérer et de modifier facilement les propriétés d'un groupe Active Directory, en ajustant sa description, sa portée, sa catégorie, et ses attributs personnalisés. Elles permettent également de supprimer des informations spécifiques ou de réinitialiser les membres d'un groupe pour une gestion optimisée dans un environnement AD.
