# 📘 Guide pour modifier un compte utilisateur dans Active Directory avec PowerShell

Ce guide présente les principales commandes PowerShell pour modifier les propriétés d’un compte utilisateur dans Active Directory (AD). Que vous ayez besoin d’ajouter des informations, de remplacer des valeurs, ou de définir un responsable, les commandes suivantes vous aident à gérer efficacement les utilisateurs.

---

## ✅ Commandes pour modifier les informations d'un utilisateur

### 1️⃣ Ajouter une description à un compte utilisateur

Pour ajouter une description à un utilisateur, utilisez la commande suivante :

```powershell
# Ajoute une description au compte utilisateur "jlebon"
Set-ADUser -Identity jlebon -Description "Ceci est un compte de test"
```

- **But** : Ajouter une description au compte `jlebon`.
- **Explication** :
  - `Set-ADUser` : Cmdlet pour modifier les attributs d’un utilisateur dans AD.
  - `-Identity jlebon` : Spécifie l'utilisateur à modifier par son nom d'identité.
  - `-Description` : Champ où vous pouvez fournir une brève description du compte.

---

### 2️⃣ Ajouter un attribut personnalisé à un utilisateur

Pour ajouter un attribut personnalisé comme `division`, utilisez l’option `-Add` :

```powershell
# Ajoute l'attribut "division" avec la valeur "Division test" pour l'utilisateur "jlebon"
Set-ADUser -Identity jlebon -Add @{division="Division test"}
```

- **But** : Ajouter l’attribut `division` avec la valeur `"Division test"` pour l'utilisateur `jlebon`.
- **Explication** :
  - `-Add @{division="Division test"}` : Ajoute une nouvelle valeur pour l’attribut `division` dans le format `@{nom_attribut="valeur"}`.

---

### 3️⃣ Remplacer la valeur d'un attribut existant

Si un attribut existe déjà et que vous souhaitez le modifier, utilisez `-Replace` :

```powershell
# Remplace la valeur de l'attribut "division" par "Division"
Set-ADUser -Identity jlebon -Replace @{division="Division"}
```

- **But** : Remplacer la valeur actuelle de l’attribut `division` par `"Division"`.
- **Explication** :
  - `-Replace @{division="Division"}` : Remplace la valeur existante de `division` sans ajouter un nouvel attribut.

---

### 4️⃣ Supprimer la valeur d'un attribut

Pour effacer la valeur d’un attribut (le mettre à vide), utilisez `-Clear` :

```powershell
# Supprime la valeur de l'attribut "division" pour l'utilisateur "jlebon"
Set-ADUser -Identity jlebon -Clear division
```

- **But** : Supprimer la valeur de l’attribut `division` pour l'utilisateur `jlebon`.
- **Explication** : `-Clear division` vide la valeur de l’attribut spécifié, le laissant sans valeur.

---

## ✅ Modifications avancées pour plusieurs utilisateurs

### 5️⃣ Modifier le titre et ajouter une division pour les utilisateurs avec un titre spécifique

Pour modifier les propriétés de plusieurs utilisateurs répondant à un critère, vous pouvez combiner `Get-ADUser` et `Set-ADUser`.

```powershell
# Met à jour le titre et ajoute "Infrastructure" comme division pour les utilisateurs dont le titre contient "Ingé"
Get-ADUser -Filter "title -like 'Ingé*'" -Properties title, division | Set-ADUser -Title "Ingénieur(e) Système" -Add @{division="Infrastructure"}
```

- **But** : Pour tous les utilisateurs dont le titre contient `"Ingé"`, met à jour leur titre et ajoute `"Infrastructure"` comme division.
- **Explication** :
  - `-Filter "title -like 'Ingé*'"` : Filtre les utilisateurs dont le titre contient `"Ingé"`.
  - `| Set-ADUser -Title "Ingénieur(e) Système"` : Définit le titre pour ces utilisateurs.
  - `-Add @{division="Infrastructure"}` : Ajoute la division `"Infrastructure"` pour ces utilisateurs.

---

### 6️⃣ Attribuer un responsable à tous les utilisateurs sans responsable

Pour les utilisateurs sans responsable, vous pouvez utiliser `Where-Object` pour filtrer et `Set-ADUser` pour définir le manager.

```powershell
# Définit "jlebon" comme responsable pour tous les utilisateurs sans manager et dont le titre contient "Ingé"
Get-ADUser -Filter "title -like 'Ingé*'" -Properties manager | Where-Object {$_.manager -eq $null} | Set-ADUser -Manager jlebon
```

- **But** : Pour les utilisateurs sans responsable et dont le titre contient `"Ingé"`, définir `jlebon` comme manager.
- **Explication** :
  - `-Properties manager` : Charge la propriété `manager` pour chaque utilisateur.
  - `Where-Object {$_.manager -eq $null}` : Filtre les utilisateurs n'ayant pas de manager (`$null`).
  - `| Set-ADUser -Manager jlebon` : Définit `jlebon` comme responsable de ces utilisateurs.

---

### 7️⃣ Attribuer un responsable à tous les utilisateurs sans manager dans AD

Pour définir un manager pour tous les utilisateurs sans responsable dans AD :

```powershell
# Définit "sleroy" comme responsable pour tous les utilisateurs sans manager
Get-ADUser -Filter * -Properties manager | Where-Object {$_.manager -eq $null} | Set-ADUser -Manager sleroy
```

- **But** : Définir `sleroy` comme responsable pour tous les utilisateurs sans manager dans AD.
- **Explication** :
  - `-Filter *` : Récupère tous les utilisateurs dans AD.
  - `Where-Object {$_.manager -eq $null}` : Filtre pour inclure uniquement les utilisateurs sans responsable.
  - `Set-ADUser -Manager sleroy` : Attribue `sleroy` comme manager.

---

### 📝 Remarques supplémentaires

- **Attention aux permissions** : Certaines modifications nécessitent des privilèges d’administrateur dans AD.
- **Charger uniquement les propriétés nécessaires** : Lorsque vous utilisez `-Properties`, spécifiez uniquement les propriétés dont vous avez besoin pour éviter des temps de chargement inutiles.

---

### 🎯 Conclusion

Ce guide vous permet de modifier les propriétés des comptes utilisateurs dans Active Directory avec PowerShell, qu'il s'agisse d’ajouter des informations, de définir un responsable, ou de gérer des attributs personnalisés. Ces commandes sont utiles pour la gestion quotidienne des utilisateurs et pour maintenir les informations à jour dans l’Active Directory de manière efficace.
