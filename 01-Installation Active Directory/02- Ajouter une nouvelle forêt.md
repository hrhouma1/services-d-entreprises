
# 📘 Configuration et installation d'un domaine Active Directory avec PowerShell

Ce guide vous montre comment configurer un domaine Active Directory en utilisant la commande `Install-ADDSForest` avec des variables définissant les paramètres nécessaires.

## ✅ Variables de configuration

Nous définissons d'abord des variables pour les différents paramètres de configuration du domaine, ce qui permet une personnalisation rapide et évite de taper de longs arguments dans la commande finale.

```powershell
# Active ou désactive la délégation DNS (false = pas de délégation)
$DelegationDNS = $false

# Chemin pour stocker la base de données NTDS de l'Active Directory
$CheminBDD = "C:\Windows\NTDS"

# Niveau fonctionnel du domaine (ici "Win2012" pour Windows Server 2012)
$NiveauDomaine = "Win2012"

# Nom complet du domaine à créer (nom DNS)
$NomDeDomaine = "lab.lan"

# Nom NetBIOS pour le domaine (identifiant abrégé, utilisé pour la compatibilité)
$NomNetBios = "LAB"

# Niveau fonctionnel de la forêt (ici "Win2012" pour Windows Server 2012)
$NiveauForet = "Win2012"

# Active ou désactive l'installation du service DNS (true = installe DNS)
$InstallationDNS = $true

# Chemin pour stocker les fichiers de log de l'Active Directory
$CheminLOG = "C:\Windows\NTDS"

# Indique si le serveur doit redémarrer automatiquement à la fin (false = redémarre automatiquement)
$NePasRebooter = $false

# Chemin pour le dossier SYSVOL, contenant les informations de réplication des stratégies de groupe
$CheminSYSVOL = "C:\Windows\SYSVOL"

# Mot de passe de restauration pour le mode de restauration d'annuaire (DRM), requis en cas de récupération
$MotDePasseRestauration = ConvertTo-SecureString -AsPlainText "P@$$word" -Force
```

---

## 🚀 Installation de la forêt Active Directory

La commande suivante utilise les variables définies pour installer une nouvelle forêt Active Directory, créant le premier contrôleur de domaine dans le domaine spécifié.

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

### Explication des options :

- **Install-ADDSForest** : Installe une nouvelle forêt Active Directory, configurant un nouveau domaine racine et un contrôleur de domaine.

- **-CreateDnsDelegation:$DelegationDNS** : Spécifie si une délégation DNS doit être créée. Ici, `$DelegationDNS` est défini sur `false`, donc aucune délégation ne sera créée.

- **-DatabasePath $CheminBDD** : Chemin de la base de données Active Directory. La base de données NTDS sera stockée dans ce répertoire.

- **-DomainMode $NiveauDomaine** : Définit le niveau fonctionnel du domaine. `$NiveauDomaine` est défini sur "Win2012", donc les fonctionnalités de domaine sont compatibles avec Windows Server 2012.

- **-DomainName $NomDeDomaine** : Nom DNS complet du domaine (ici `lab.lan`). Cela correspond au nom du domaine que les utilisateurs utiliseront pour se connecter.

- **-DomainNetbiosName $NomNetBios** : Nom NetBIOS pour le domaine, défini ici sur `LAB`. Le nom NetBIOS est utilisé pour la compatibilité avec les applications plus anciennes.

- **-ForestMode $NiveauForet** : Niveau fonctionnel de la forêt, défini sur "Win2012". Cela détermine les fonctionnalités disponibles au niveau de la forêt.

- **-InstallDns:$InstallationDNS** : Définit si le service DNS doit être installé avec AD DS. Ici, `$InstallationDNS` est `true`, donc le DNS sera configuré en même temps qu’AD DS.

- **-LogPath $CheminLOG** : Chemin pour les fichiers journaux de l'Active Directory. `$CheminLOG` est ici défini comme `C:\Windows\NTDS`.

- **-NoRebootOnCompletion:$NePasRebooter** : Indique si le serveur doit redémarrer automatiquement une fois l'installation terminée. `$NePasRebooter` est `false`, ce qui signifie que le serveur redémarrera automatiquement à la fin.

- **-SysvolPath $CheminSYSVOL** : Chemin pour le dossier SYSVOL. SYSVOL contient les fichiers de stratégies de groupe et de scripts de connexion pour le domaine.

- **-SafeModeAdministratorPassword $MotDePasseRestauration** : Définit le mot de passe pour le mode de restauration d'annuaire (DRM), requis pour les opérations de récupération. La commande `ConvertTo-SecureString` convertit le mot de passe en un format sécurisé pour des raisons de sécurité.

- **-Force:$true** : Forcer l'installation sans demander de confirmation additionnelle.

- **-Confirm:$false** : Désactive la confirmation interactive pour éviter toute interruption pendant l'installation.

---

### 🎯 Conclusion

Avec ce guide, vous avez configuré une forêt Active Directory en spécifiant des chemins de données, des niveaux fonctionnels et des options de sécurité. Une fois l'installation terminée, le serveur redémarre et Active Directory est prêt à être utilisé.
