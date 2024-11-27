# Prérequis

Avant de commencer l'installation d'Exchange, assurez-vous d'avoir :

- Un serveur Windows Server (2016 ou 2019 recommandé)
- Un domaine Active Directory fonctionnel
- Les droits d'administrateur sur le serveur et le domaine

# Étapes d'installation

### 1. Installer les prérequis Windows

Exécutez la commande PowerShell suivante pour installer les fonctionnalités Windows nécessaires :

```powershell
Install-WindowsFeature RSAT-ADDS, Server-Media-Foundation, NET-Framework-45-Core, NET-Framework-45-ASPNET, NET-WCF-HTTP-Activation45, NET-WCF-Pipe-Activation45, NET-WCF-TCP-Activation45, NET-WCF-TCP-PortSharing45, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation
```

### 2. Préparer Active Directory

Exécutez la commande suivante pour préparer Active Directory :

```cmd
Setup.exe /IAcceptExchangeServerLicenseTerms_DiagnosticDataON /PrepareAD /OrganizationName VotreOrganisation
```

Remplacez "VotreOrganisation" par le nom souhaité pour votre organisation Exchange.

### 3. Installer Exchange Server

1. Téléchargez la dernière version d'Exchange Server depuis le site officiel de Microsoft.

2. Montez l'image ISO ou extrayez les fichiers d'installation.

3. Exécutez Setup.exe en tant qu'administrateur.

4. Suivez l'assistant d'installation graphique :
   - Acceptez les termes de la licence
   - Choisissez une installation typique ou personnalisée
   - Sélectionnez les rôles serveur à installer
   - Configurez le nom du site Exchange et le chemin d'installation

5. Laissez l'installation se terminer (cela peut prendre un certain temps).

### 4. Configuration post-installation

Après l'installation, vous devrez :

- Configurer les certificats SSL
- Créer les boîtes aux lettres des utilisateurs
- Configurer les stratégies de rétention et d'archivage
- Mettre en place la sécurité et les règles de transport

## Conclusion

L'installation d'Exchange Server est un processus complexe qui nécessite une planification minutieuse. Assurez-vous de bien comprendre chaque étape et de sauvegarder vos données importantes avant de commencer. Pour une configuration plus avancée ou des environnements complexes, il est recommandé de consulter la documentation officielle de Microsoft ou de faire appel à un professionnel certifié.







# Annexe : 


----------------------
# 01 - Installer Exchange
----------------------

```powershell
Install-WindowsFeature RSAT-ADDS
```

- *Cette commande PowerShell est utilisée pour installer la fonctionnalité "RSAT-ADDS" (Remote Server Administration Tools - Active Directory Domain Services) sur un serveur Windows. Cela permet de gérer les services AD DS (Active Directory Domain Services).*


----------------------
# 02 - Commandes
----------------------

1. **Commande :**
   ```powershell
   Install-WindowsFeature RSAT-ADDS
   ```
   Utilisée pour installer les outils d'administration Active Directory sur un serveur.

2. **Commande :**
   ```powershell
   Install-WindowsFeature Server-Media-Foundation
   ```
   Installe la fonctionnalité "Server Media Foundation" pour la prise en charge des formats multimédias.

3. **Commande étendue :**
   ```powershell
   Install-WindowsFeature Server-Media-Foundation, NET-Framework-45-Core, NET-Framework-45-ASPNET, NET-WCF-HTTP-Activation45, NET-WCF-Pipe-Activation45, NET-WCF-TCP-Activation45, NET-WCF-TCP-PortSharing45, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation, RSAT-ADDS
   ```
   Cette commande installe une liste étendue de fonctionnalités Windows Server, comprenant les outils de gestion Active Directory (RSAT-ADDS), des composants Web, .NET Framework et des options de clustering.






----------------------
# 03 - Installation
----------------------


```powershell
Setup.exe /IAcceptExchangeServerLicenseTerms_DiagnosticDataON /PrepareAD /OrganizationName NS_
```

### Description :
1. **`Setup.exe`** :
   - Lance l'exécutable de configuration pour installer ou préparer un environnement Exchange Server.

2. **`/IAcceptExchangeServerLicenseTerms_DiagnosticDataON`** :
   - Accepte les termes de licence pour Exchange Server.
   - Active l'envoi des données de diagnostic.

3. **`/PrepareAD`** :
   - Prépare l'Active Directory pour l'installation ou la mise à jour d'Exchange Server.

4. **`/OrganizationName NS_`** :
   - Définit le nom de l'organisation dans l'environnement Exchange.


-------------------
# Résumé: 
-------------------


Cette commande est utilisée pour préparer l'annuaire Active Directory avant l'installation d'Exchange Server, en spécifiant le nom de l'organisation et en acceptant les termes de la licence.


```cmd
Setup.exe /IAcceptExchangeServerLicenseTerms_DiagnosticDataON /PrepareAD /OrganizationName NS
```

### Description :
- **`Setup.exe`** : Lancement de l'installation ou configuration pour Exchange Server.
- **`/IAcceptExchangeServerLicenseTerms_DiagnosticDataON`** : Accepte automatiquement les termes de la licence pour Exchange Server et active l'envoi de données de diagnostic.
- **`/PrepareAD`** : Prépare l'Active Directory pour accueillir Exchange Server (par exemple, en créant des groupes et en configurant les permissions nécessaires).
- **`/OrganizationName NS`** : Spécifie le nom de l'organisation Exchange Server, ici "NS".

### Contexte :
Le message "Microsoft Exchange Server 2019 Cumulative Update 13 Unattended Setup" indique que cette commande configure ou met à jour Exchange Server 2019 avec le correctif cumulatif 13 (CU13) de manière non interactive.
