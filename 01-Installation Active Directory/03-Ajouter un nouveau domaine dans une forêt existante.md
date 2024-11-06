# 📘 Guide d'installation d'un domaine enfant Active Directory avec PowerShell

Ce guide vous permet de configurer un domaine enfant dans une forêt Active Directory, en spécifiant les paramètres pour le stockage de la base de données, la configuration DNS, et le niveau fonctionnel du domaine.

## ✅ Installation du rôle Active Directory Domain Services (AD DS)

Avant de pouvoir créer un domaine enfant, installez le rôle AD DS sur le serveur.

```powershell
# Installe le rôle Active Directory Domain Services et les outils de gestion
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
```

- **But** : Installer le rôle Active Directory Domain Services (AD DS) avec les outils de gestion pour configurer un domaine Active Directory.
- **Explication** :
  - `Install-WindowsFeature` : Permet d’installer une fonctionnalité sur le serveur.
  - `-Name AD-Domain-Services` : Spécifie le rôle AD DS, nécessaire pour l'Active Directory.
  - `-IncludeManagementTools` : Installe également les outils de gestion AD DS.

---

## ✅ Variables de configuration pour l'installation du domaine enfant

Définissez des variables pour configurer le domaine enfant avec les options souhaitées. Cela facilite la personnalisation et l'organisation des informations.

```powershell
# Définir si le serveur doit être configuré en tant que catalogue global
$NoCatalogueGlobal = $false

# Définir la création d'une délégation DNS pour le domaine enfant
$DelegationDNS = $true

# Informations d'identification administratives pour le domaine parent
$Identifiant = (Get-Credential lab.lan\Administrateur)

# Chemin pour stocker la base de données NTDS d'Active Directory
$CheminBDD = "C:\Windows\NTDS"

# Niveau fonctionnel du domaine, ici Windows Server 2012
$NiveauDomaine = "Win2012"

# Type de domaine, spécifiant qu'il s'agit d'un domaine enfant
$TypeDomaine = "ChildDomain"

# Indique si le DNS doit être installé avec AD DS
$InstallationDNS = $true

# Chemin pour les fichiers journaux d'Active Directory
$CheminLOG = "C:\Windows\NTDS"

# Nom DNS du nouveau domaine enfant
$NomDomaine = "Paris"

# Nom NetBIOS du domaine enfant, utilisé pour la compatibilité
$NomNetBIOS = "PARIS"

# Nom du domaine parent (existant dans la forêt)
$DomaineParent = "lab.lan"

# Indique si le serveur doit redémarrer automatiquement après l'installation
$NePasRebooter = $false

# Nom du site Active Directory
$NomSite = "Default-First-Site-Name"

# Chemin pour le dossier SYSVOL, qui contient les fichiers de réplication de stratégies de groupe
$CheminSYSVOL = "C:\Windows\SYSVOL"

# Mot de passe pour le mode de restauration d'annuaire, requis pour la récupération de la base de données
$MotDePasseRestauration = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
```

---

## 🚀 Création du domaine enfant avec `Install-ADDSDomain`

La commande suivante crée le domaine enfant dans le domaine parent spécifié, en utilisant les options définies.

```powershell
Install-ADDSDomain -NoGlobalCatalog:$NoCatalogueGlobal  `
                   -CreateDnsDelegation:$DelegationDNS `
                   -Credential:$Identifiant `
                   -DatabasePath $CheminBDD `
                   -DomainMode $NiveauDomaine `
                   -DomainType $TypeDomaine `
                   -InstallDns:$InstallationDNS `
                   -LogPath $CheminLOG  `
                   -NewDomainName $NomDomaine `
                   -NewDomainNetbiosName $NomNetBIOS `
                   -ParentDomainName $DomaineParent `
                   -NoRebootOnCompletion:$NePasRebooter `
                   -SiteName $NomSite `
                   -SysvolPath $CheminSYSVOL `
                   -SafeModeAdministratorPassword $MotDePasseRestauration `
                   -Force:$true `
                   -Confirm:$false
```

### Explication des paramètres :

- **Install-ADDSDomain** : Crée un nouveau domaine Active Directory, ici un domaine enfant, dans une forêt existante.

- **-NoGlobalCatalog:$NoCatalogueGlobal** : Spécifie si le serveur sera un catalogue global (fournit une vue complète de la forêt). `$NoCatalogueGlobal = $false` signifie que ce serveur sera un catalogue global.

- **-CreateDnsDelegation:$DelegationDNS** : Indique si une délégation DNS doit être créée pour ce domaine enfant. `$DelegationDNS = $true` signifie qu’une délégation DNS sera créée.

- **-Credential:$Identifiant** : Utilise des informations d'identification administratives pour le domaine parent. `Get-Credential` ouvre une invite pour entrer le mot de passe de l’utilisateur `lab.lan\Administrateur`.

- **-DatabasePath $CheminBDD** : Chemin pour stocker la base de données NTDS du domaine enfant.

- **-DomainMode $NiveauDomaine** : Définit le niveau fonctionnel du domaine, ici `Win2012`, qui active les fonctionnalités compatibles avec Windows Server 2012.

- **-DomainType $TypeDomaine** : Indique le type de domaine, ici `"ChildDomain"`, qui spécifie que ce domaine est un domaine enfant.

- **-InstallDns:$InstallationDNS** : Indique si le service DNS doit être installé. `$InstallationDNS = $true` signifie que DNS sera configuré avec ce domaine enfant.

- **-LogPath $CheminLOG** : Chemin pour les fichiers journaux d'Active Directory, ici `C:\Windows\NTDS`.

- **-NewDomainName $NomDomaine** : Définit le nom DNS du nouveau domaine enfant, ici `Paris`. Ce nom DNS identifie le domaine dans la forêt.

- **-NewDomainNetbiosName $NomNetBIOS** : Définit le nom NetBIOS pour le domaine enfant, ici `PARIS`, utilisé pour la compatibilité avec les anciennes applications.

- **-ParentDomainName $DomaineParent** : Définit le nom du domaine parent, ici `lab.lan`, dans lequel le domaine enfant sera créé.

- **-NoRebootOnCompletion:$NePasRebooter** : Spécifie si le serveur doit redémarrer automatiquement à la fin de l'installation. `$NePasRebooter = $false` signifie que le serveur redémarrera automatiquement pour finaliser l'installation.

- **-SiteName $NomSite** : Définit le site Active Directory où ce contrôleur de domaine sera placé, ici `Default-First-Site-Name`.

- **-SysvolPath $CheminSYSVOL** : Chemin pour le dossier SYSVOL, qui contient les fichiers de réplication des stratégies de groupe.

- **-SafeModeAdministratorPassword $MotDePasseRestauration** : Définit le mot de passe pour le mode de restauration d'annuaire, utilisé pour des opérations de récupération. `ConvertTo-SecureString` convertit le mot de passe en format sécurisé.

- **-Force:$true** : Force l'exécution de la commande sans demander de confirmation.

- **-Confirm:$false** : Désactive la confirmation interactive, permettant une exécution sans interruption.

---

### 🎯 Conclusion

Ce guide permet de configurer un domaine enfant dans une forêt Active Directory avec des paramètres personnalisés. En utilisant PowerShell et les variables définies, vous pouvez créer des configurations automatisées pour l'Active Directory, adaptables aux différents besoins de votre environnement. Une fois l'installation terminée, le serveur redémarrera, et votre domaine enfant sera opérationnel.
