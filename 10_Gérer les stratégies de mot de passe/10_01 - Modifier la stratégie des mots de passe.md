## 📚 Cours détaillé : Modifier la stratégie des mots de passe dans Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser PowerShell pour modifier la stratégie de mots de passe par défaut dans Active Directory (AD) avec la commande `Set-ADDefaultDomainPasswordPolicy`. Cette commande permet de configurer les paramètres de sécurité des mots de passe dans le domaine, comme la complexité, la durée de verrouillage et la durée de vie maximale.

---

# ✨ Résumé des commandes

```powershell
# 🔐 Récupère la stratégie de mot de passe par défaut du domaine
Get-ADDefaultDomainPasswordPolicy

# ✏️ Modifie la stratégie de mot de passe pour désactiver la complexité, définir une durée de verrouillage de 45 minutes et un âge maximum de 30 jours
Set-ADDefaultDomainPasswordPolicy -Identity lab.lan -ComplexityEnabled $false -LockoutDuration 00:45:00 -MaxPasswordAge 30.00:00:00

# 🔄 Vérifie la stratégie de mot de passe après modification
Get-ADDefaultDomainPasswordPolicy

# ✅ Vérifie si la complexité de mot de passe répond aux exigences, et propose la mise en conformité si nécessaire
$MDPComplexe = $true
$StrategieMDP = Get-ADDefaultDomainPasswordPolicy -Identity lab.lan

if($StrategieMDP.ComplexityEnabled -eq $MDPComplexe) {
   Write-Host "La stratégie de mot de passe répond aux exigences de complexité" -ForegroundColor Green
} else {
   Write-Host "La stratégie de mot de passe ne répond pas aux exigences de complexité." -ForegroundColor Red
   Write-Host "Souhaitez-vous mettre en conformité l'exigence de complexité (O/N) ? " -ForegroundColor Green -NoNewline
   $Reponse = Read-Host
   if($Reponse -eq "O") {
      Set-ADDefaultDomainPasswordPolicy -Identity lab.lan -ComplexityEnabled $true
      Write-Host "La stratégie de mot de passe a été mise en conformité."
   } elseif($Reponse -eq "N") {
      Write-Host "La stratégie de mot de passe n'a pas été modifiée."
   }
}
```

---

# 🔐 Commande 1 : Récupérer la stratégie de mot de passe par défaut du domaine

```powershell
Get-ADDefaultDomainPasswordPolicy
```

**Détails :**
- **Get-ADDefaultDomainPasswordPolicy** : Récupère les paramètres de stratégie de mots de passe du domaine.

Cette commande est utilisée pour consulter les règles de sécurité des mots de passe actuelles.

---

# ✏️ Commande 2 : Modifier la stratégie de mot de passe

```powershell
Set-ADDefaultDomainPasswordPolicy -Identity lab.lan -ComplexityEnabled $false -LockoutDuration 00:45:00 -MaxPasswordAge 30.00:00:00
```

**Détails :**
- **Set-ADDefaultDomainPasswordPolicy** : Permet de configurer la politique de mots de passe du domaine.
- **`-ComplexityEnabled $false`** : Désactive la règle de complexité pour les mots de passe.
- **`-LockoutDuration 00:45:00`** : Définit la durée de verrouillage à 45 minutes.
- **`-MaxPasswordAge 30.00:00:00`** : Définit une durée de vie maximale de 30 jours pour les mots de passe.

Cette commande est utile pour mettre à jour les règles de sécurité des mots de passe en fonction des politiques de l'organisation.

---

# 🔄 Commande 3 : Vérifier la stratégie de mot de passe après modification

```powershell
Get-ADDefaultDomainPasswordPolicy
```

**Détails :**
- Cette commande permet de vérifier les modifications appliquées à la stratégie de mot de passe.

---

# ✅ Commande 4 : Vérifier la conformité de la stratégie de complexité des mots de passe

```powershell
$MDPComplexe = $true
$StrategieMDP = Get-ADDefaultDomainPasswordPolicy -Identity lab.lan

if($StrategieMDP.ComplexityEnabled -eq $MDPComplexe) {
   Write-Host "La stratégie de mot de passe répond aux exigences de complexité" -ForegroundColor Green
} else {
   Write-Host "La stratégie de mot de passe ne répond pas aux exigences de complexité." -ForegroundColor Red
   Write-Host "Souhaitez-vous mettre en conformité l'exigence de complexité (O/N) ? " -ForegroundColor Green -NoNewline
   $Reponse = Read-Host
   if($Reponse -eq "O") {
      Set-ADDefaultDomainPasswordPolicy -Identity lab.lan -ComplexityEnabled $true
      Write-Host "La stratégie de mot de passe a été mise en conformité."
   } elseif($Reponse -eq "N") {
      Write-Host "La stratégie de mot de passe n'a pas été modifiée."
   }
}
```

**Détails :**
1. **$MDPComplexe** : Définit la valeur de complexité attendue pour le mot de passe.
2. **`if($StrategieMDP.ComplexityEnabled -eq $MDPComplexe)`** : Vérifie si la complexité des mots de passe est activée selon les exigences.
3. **`Write-Host`** : Affiche un message pour indiquer si la stratégie respecte ou non les exigences de complexité.
4. **`Read-Host`** : Permet à l'utilisateur de choisir s'il souhaite modifier la stratégie pour activer la complexité.

Cette section de script est utile pour s'assurer que la politique de mots de passe est conforme et propose une mise à jour automatique si nécessaire.

---

### 📝 Résumé

Ces commandes PowerShell permettent de gérer et de vérifier la stratégie de mots de passe par défaut dans Active Directory, en configurant des paramètres de sécurité tels que la complexité, la durée de verrouillage, et la durée de vie maximale des mots de passe. Ce script offre également une validation interactive de conformité, permettant d'ajuster la politique de mots de passe en fonction des standards de sécurité.
