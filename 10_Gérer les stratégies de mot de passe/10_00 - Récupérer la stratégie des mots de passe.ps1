## 📚 Cours détaillé : Récupérer la stratégie des mots de passe dans Active Directory avec PowerShell

Dans ce cours, nous allons apprendre à utiliser PowerShell pour récupérer et vérifier la stratégie de mots de passe par défaut d'un domaine dans Active Directory (AD) avec la commande `Get-ADDefaultDomainPasswordPolicy`. Cette commande permet de consulter les paramètres de sécurité appliqués aux mots de passe dans le domaine, comme la complexité requise et la durée de verrouillage.

---

# ✨ Résumé des commandes

```powershell
# 🔐 Récupère la stratégie de mot de passe par défaut du domaine
Get-ADDefaultDomainPasswordPolicy

# 🌐 Récupère la stratégie de mot de passe par défaut d'un domaine spécifique
Get-ADDefaultDomainPasswordPolicy -Server paris.lab.lan

# ✅ Vérifie si la stratégie de mot de passe respecte des critères de complexité et de verrouillage
$MDPComplexe       = $true
$DureeVerrouillage = "00:30:00"
$StrategieMDP = Get-ADDefaultDomainPasswordPolicy -Identity lab.lan

if($StrategieMDP.ComplexityEnabled -eq $MDPComplexe) {
   Write-Host "La stratégie de mot de passe répond aux exigences de complexité" -ForegroundColor Green
}

if($StrategieMDP.LockoutDuration -ne $DureeVerrouillage) {
   Write-Host "La durée de verrouillage ne répond pas aux exigences" -ForegroundColor Red
}
```

---

# 🔐 Commande 1 : Récupérer la stratégie de mot de passe par défaut du domaine

```powershell
Get-ADDefaultDomainPasswordPolicy
```

**Détails :**
- **Get-ADDefaultDomainPasswordPolicy** : Cette commande récupère la politique de mots de passe par défaut appliquée dans le domaine actuel.

Cette commande permet de consulter les paramètres de sécurité relatifs aux mots de passe, comme la complexité, la durée de verrouillage et l’historique.

---

# 🌐 Commande 2 : Récupérer la stratégie de mot de passe pour un domaine spécifique

```powershell
Get-ADDefaultDomainPasswordPolicy -Server paris.lab.lan
```

**Détails :**
- **`-Server paris.lab.lan`** : Spécifie un serveur ou domaine particulier pour lequel on souhaite consulter la stratégie de mot de passe.

Cette commande est utile pour récupérer les politiques de sécurité des mots de passe sur un domaine spécifique, surtout dans des environnements multi-domaine.

---

# ✅ Commande 3 : Vérifier la conformité de la stratégie de mot de passe

```powershell
$MDPComplexe       = $true
$DureeVerrouillage = "00:30:00"
$StrategieMDP = Get-ADDefaultDomainPasswordPolicy -Identity lab.lan

if($StrategieMDP.ComplexityEnabled -eq $MDPComplexe) {
   Write-Host "La stratégie de mot de passe répond aux exigences de complexité" -ForegroundColor Green
}

if($StrategieMDP.LockoutDuration -ne $DureeVerrouillage) {
   Write-Host "La durée de verrouillage ne répond pas aux exigences" -ForegroundColor Red
}
```

**Détails :**
1. **$MDPComplexe** : Définit une exigence de complexité pour le mot de passe (ici, `$true`).
2. **$DureeVerrouillage** : Définit une exigence de durée de verrouillage (ici, 30 minutes).
3. **`if($StrategieMDP.ComplexityEnabled -eq $MDPComplexe)`** : Vérifie si la stratégie de complexité est activée.
4. **`if($StrategieMDP.LockoutDuration -ne $DureeVerrouillage)`** : Vérifie si la durée de verrouillage respecte l'exigence.

Cette commande permet de valider si la politique de mots de passe actuelle répond à des critères spécifiques, facilitant ainsi la conformité aux standards de sécurité.

---

### 📝 Résumé

Ces commandes PowerShell permettent de récupérer et de vérifier la stratégie de mots de passe dans Active Directory, en analysant des paramètres de sécurité tels que la complexité requise et la durée de verrouillage. Ces commandes sont utiles pour assurer que la politique de sécurité des mots de passe est conforme aux exigences organisationnelles et réglementaires.
