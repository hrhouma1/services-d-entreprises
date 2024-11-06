
# 📘 Guide pour l'ajout d'un contrôleur de domaine dans Active Directory avec PowerShell

Ce guide explique comment ajouter un nouveau contrôleur de domaine dans un domaine Active Directory existant. Chaque paramètre est expliqué pour que vous puissiez adapter la configuration selon vos besoins.

## ✅ Installation du rôle Active Directory Domain Services (AD DS)

Pour commencer, installez le rôle AD DS sur le serveur, car il est requis pour configurer un contrôleur de domaine.

```powershell
# Installe le rôle Active Directory Domain Services et les outils de gestion associés
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
```

- **But** : Installer le rôle Active Directory Domain Services (AD DS) et ses outils de gestion.
- **Explication** :
  - `Install-WindowsFeature` : Commande pour installer une fonctionnalité ou un rôle serveur.
  - `-Name AD-Domain-Services` : Installe le rôle AD DS, nécessaire pour qu’un serveur puisse devenir contrôleur de domaine.
  - `-IncludeManagementTools` : Installe également les outils de gestion AD DS (par exemple, les outils RSAT pour AD DS).

---

## ✅ Variables de configuration pour l'ajout du contrôleur de domaine

Définissez des variables pour configurer le contrôleur de domaine avec les options souhaitées.

```powershell
# Spécifie si le serveur sera configuré comme un catalogue global (true = oui)
$NoCatalogueGlobal = $false

# Indique si une délégation DNS doit être créée pour ce contrôleur
$DelegationDNS = $false

# Informations d'identification pour se connecter au domaine
$Identifiant = (Get-Credential lab.lan\Administrateur)

# Chemin pour stocker la base de données NTDS d'Active Directory
$CheminBDD = "C:\Windows\NTDS"

# Chemin pour stocker les fichiers journaux d'Active Directory
$CheminLOG = "C:\Windows\NTDS"

# Nom DNS du domaine où le contrôleur de domaine sera ajouté
$NomDomaine = "lab.lan"

# Indique si le DNS doit être installé (true = installe DNS)
$InstallationDNS = $true

# Indique si le serveur doit redémarrer automatiquement après l'installation (false = redémarre automatiquement)
$NePasRebooter = $false

# Nom du site Active Directory où le contrôleur sera ajouté
$NomSite = "Default-First-Site-Name"

# Chemin pour le dossier SYSVOL, utilisé pour la réplication de stratégies de groupe
$CheminSYSVOL = "C:\Windows\SYSVOL"

# Définit si la réplication critique est activée (true = seulement la réplication critique)
$Replication = $false

# Mot de passe pour le mode de restauration d'annuaire (nécessaire pour la récupération)
$MotDePasseRestauration = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
```

---

## 🚀 Ajout du contrôleur de domaine avec `Install-ADDSDomainController`

La commande suivante configure le serveur en tant que nouveau contrôleur de domaine dans un domaine Active Directory existant.

```powershell
Install-ADDSDomainController -NoGlobalCatalog:$NoCatalogueGlobal `
                             -CreateDnsDelegation:$DelegationDNS `
                             -Credential:$Identifiant `
                             -CriticalReplicationOnly:$Replication `
                             -DatabasePath $CheminBDD `
                             -DomainName $NomDomaine `
                             -InstallDns:$InstallationDNS `
                             -LogPath $CheminLOG  `
                             -NoRebootOnCompletion:$NePasRebooter `
                             -SiteName $NomSite `
                             -SysvolPath $CheminSYSVOL `
                             -SafeModeAdministratorPassword $MotDePasseRestauration `
                             -Force:$true `
                             -Confirm:$false
```

### Explication des paramètres :

- **Install-ADDSDomainController** : Installe un nouveau contrôleur de domaine dans un domaine Active Directory existant.

- **-NoGlobalCatalog:$NoCatalogueGlobal** : Indique si le serveur doit être configuré comme un catalogue global. `$NoCatalogueGlobal = $false` signifie que ce serveur sera un catalogue global.

- **-CreateDnsDelegation:$DelegationDNS** : Spécifie si une délégation DNS doit être créée pour ce contrôleur de domaine. `$DelegationDNS = $false` signifie qu’aucune délégation DNS ne sera créée.

- **-Credential:$Identifiant** : Fournit les informations d'identification nécessaires pour se connecter au domaine parent. `Get-Credential` ouvre une invite pour entrer le mot de passe de l’administrateur `lab.lan\Administrateur`.

- **-CriticalReplicationOnly:$Replication** : Définit si seule la réplication critique doit être effectuée pendant la configuration initiale. `$Replication = $false` signifie que toutes les données seront répliquées, pas seulement les données critiques.

- **-DatabasePath $CheminBDD** : Chemin pour stocker la base de données NTDS du contrôleur de domaine, ici `C:\Windows\NTDS`.

- **-DomainName $NomDomaine** : Nom DNS du domaine où le contrôleur de domaine sera ajouté, ici `lab.lan`.

- **-InstallDns:$InstallationDNS** : Indique si le service DNS doit être installé avec ce contrôleur de domaine. `$InstallationDNS = $true` signifie que DNS sera configuré.

- **-LogPath $CheminLOG** : Chemin pour les fichiers journaux d'Active Directory, ici `C:\Windows\NTDS`.

- **-NoRebootOnCompletion:$NePasRebooter** : Indique si le serveur doit redémarrer automatiquement une fois l'installation terminée. `$NePasRebooter = $false` signifie que le serveur redémarrera automatiquement pour finaliser l'installation.

- **-SiteName $NomSite** : Nom du site Active Directory dans lequel le contrôleur de domaine sera placé, ici `Default-First-Site-Name`.

- **-SysvolPath $CheminSYSVOL** : Chemin pour le dossier SYSVOL, utilisé pour la réplication des fichiers de stratégies de groupe. Ce dossier contient les scripts de connexion et autres données de réplication.

- **-SafeModeAdministratorPassword $MotDePasseRestauration** : Définit le mot de passe pour le mode de restauration d'annuaire (DRM), utilisé pour des opérations de récupération. `ConvertTo-SecureString` convertit le mot de passe en format sécurisé pour des raisons de sécurité.

- **-Force:$true** : Force l'exécution de la commande sans demander de confirmation supplémentaire.

- **-Confirm:$false** : Désactive la confirmation interactive, permettant une exécution sans interruption.

---

### 🎯 Conclusion

Ce guide vous permet de configurer un serveur comme contrôleur de domaine additionnel dans un domaine Active Directory existant. Grâce aux variables définies, vous pouvez facilement ajuster la configuration selon vos besoins. Une fois l’installation terminée, le serveur redémarrera pour finaliser l'intégration dans le domaine.
