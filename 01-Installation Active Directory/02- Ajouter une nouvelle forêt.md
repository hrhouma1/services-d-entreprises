

# 📘 Guide pour la création d'une nouvelle forêt Active Directory

Ce guide décrit les étapes pour ajouter une nouvelle forêt Active Directory, en configurant les chemins, les niveaux fonctionnels, et les options DNS, en utilisant la commande `Install-ADDSForest`.

## ✅ Variables de configuration

Nous définissons d'abord des variables pour stocker les informations de configuration. Cela simplifie l'exécution de la commande et permet de modifier facilement les paramètres si besoin.

```powershell
# Active ou désactive la création d'une délégation DNS
$DelegationDNS = $false

# Chemin pour la base de données NTDS (base de données principale d'Active Directory)
$CheminBDD = "C:\Windows\NTDS"

# Niveau fonctionnel du domaine (ici "Win2012" pour Windows Server 2012)
$NiveauDomaine = "Win2012"

# Nom complet DNS du nouveau domaine
$NomDeDomaine = "lab.lan"

# Nom NetBIOS pour le domaine, utilisé pour des raisons de compatibilité
$NomNetBios = "LAB"

# Niveau fonctionnel de la forêt (ici "Win2012" pour Windows Server 2012)
$NiveauForet = "Win2012"

# Active ou désactive l'installation du service DNS lors de la configuration du domaine
$InstallationDNS = $true

# Chemin pour stocker les fichiers de log d'Active Directory
$CheminLOG = "C:\Windows\NTDS"

# Indique si le serveur doit redémarrer automatiquement après l'installation
$NePasRebooter = $false

# Chemin pour le dossier SYSVOL, qui contient les fichiers de stratégie de groupe et de scripts de connexion
$CheminSYSVOL = "C:\Windows\SYSVOL"

# Mot de passe pour le mode de restauration d'annuaire (DRM), requis pour récupérer la base de données en cas de problème
$MotDePasseRestauration = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
```

---

## 🚀 Installation de la forêt Active Directory

Une fois les variables définies, utilisez la commande `Install-ADDSForest` pour créer la nouvelle forêt Active Directory.

```powershell
Install-ADDSForest -CreateDnsDelegation:$DelegationDNS `
                   -DatabasePath $CheminBDD `
                   -DomainMode $NiveauDomaine `
                   -DomainName $NomDeDomaine `
                   -DomainNetbiosName $NomNetBios `
                   -ForestMode $NiveauForet `
                   -InstallDns:$InstallationDNS `
                   -LogPath $CheminLOG `
                   -NoRebootOnCompletion:$NePasRebooter `
                   -SysvolPath $CheminSYSVOL `
                   -SafeModeAdministratorPassword $MotDePasseRestauration `
                   -Force:$true `
                   -Confirm:$false
```

### Explication des paramètres :

- **Install-ADDSForest** : Installe une nouvelle forêt Active Directory, qui est le plus haut niveau d'organisation dans Active Directory.

- **-CreateDnsDelegation:$DelegationDNS** : Spécifie si une délégation DNS doit être créée pour ce domaine. Ici, la variable `$DelegationDNS` est définie sur `false`, donc aucune délégation ne sera créée.

- **-DatabasePath $CheminBDD** : Chemin de stockage de la base de données NTDS d'Active Directory. Le dossier `C:\Windows\NTDS` est utilisé pour stocker cette base de données essentielle.

- **-DomainMode $NiveauDomaine** : Définit le niveau fonctionnel du domaine, ici `Win2012`. Ce niveau détermine les fonctionnalités disponibles pour les objets et opérations du domaine.

- **-DomainName $NomDeDomaine** : Nom DNS complet pour le nouveau domaine, ici `lab.lan`. Ce nom est celui que les utilisateurs utiliseront pour se connecter au domaine.

- **-DomainNetbiosName $NomNetBios** : Définit le nom NetBIOS du domaine, ici `LAB`. Ce nom est utilisé pour la compatibilité avec les anciennes applications.

- **-ForestMode $NiveauForet** : Niveau fonctionnel de la forêt. Le niveau de forêt `Win2012` permet des fonctionnalités spécifiques à cette version.

- **-InstallDns:$InstallationDNS** : Indique si le service DNS doit être installé avec Active Directory. Ici, `$InstallationDNS` est `true`, donc DNS sera configuré.

- **-LogPath $CheminLOG** : Chemin où seront stockés les fichiers journaux d'Active Directory. Le dossier `C:\Windows\NTDS` est utilisé ici pour stocker ces logs.

- **-NoRebootOnCompletion:$NePasRebooter** : Définit si le serveur doit redémarrer automatiquement une fois l'installation terminée. Ici, `$NePasRebooter` est `false`, donc le serveur redémarrera automatiquement pour finaliser l'installation.

- **-SysvolPath $CheminSYSVOL** : Chemin du dossier SYSVOL, qui contient les fichiers de stratégies de groupe et scripts de connexion, crucial pour la réplication dans le domaine.

- **-SafeModeAdministratorPassword $MotDePasseRestauration** : Définit le mot de passe pour le mode de restauration d'annuaire (DRM). Ce mot de passe est sécurisé en utilisant `ConvertTo-SecureString`.

- **-Force:$true** : Force l'exécution de la commande sans demander de confirmation supplémentaire.

- **-Confirm:$false** : Désactive la confirmation interactive pour éviter toute interruption pendant l'installation.

---

### 🎯 Conclusion

En suivant ce guide, vous avez créé une nouvelle forêt Active Directory en utilisant PowerShell, avec des paramètres personnalisés pour les chemins de stockage, les niveaux fonctionnels, et la configuration DNS. Une fois l'installation terminée, le serveur redémarrera et Active Directory sera prêt à être utilisé.
