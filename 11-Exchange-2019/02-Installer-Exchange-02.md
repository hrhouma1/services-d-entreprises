
# Prérequis détaillés

Avant de commencer l'installation d'Exchange Server, assurez-vous d'avoir les éléments suivants :

1. **Système d'exploitation** : Windows Server 2019 ou Windows Server 2022 (dernière mise à jour recommandée)
2. **Matériel** :
   - Processeur : 2 cœurs minimum pour les serveurs de boîtes aux lettres
   - Mémoire : 128 Go minimum pour les serveurs de boîtes aux lettres
   - Espace disque : 200 Go minimum pour le lecteur d'installation
3. **Logiciels** :
   - .NET Framework 4.8
   - Windows Management Framework 5.1 ou ultérieur
4. **Réseau** :
   - Un domaine Active Directory fonctionnel
   - Un contrôleur de domaine exécutant Windows Server 2012 R2 ou version ultérieure
   - Le niveau fonctionnel de la forêt et du domaine doit être Windows Server 2012 R2 ou ultérieur
5. **Droits** :
   - Compte d'administrateur de domaine
   - Droits d'administrateur local sur le serveur d'installation

# Étapes d'installation détaillées

### 1. Préparation du serveur

1.1. **Mise à jour du système** :
```powershell
Install-WindowsFeature Update-Services
```
Redémarrez le serveur après l'installation des mises à jour.

1.2. **Installation des prérequis Windows** :
```powershell
Install-WindowsFeature RSAT-ADDS, Server-Media-Foundation, NET-Framework-45-Core, NET-Framework-45-ASPNET, NET-WCF-HTTP-Activation45, NET-WCF-Pipe-Activation45, NET-WCF-TCP-Activation45, NET-WCF-TCP-PortSharing45, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation
```

1.3. **Installation de Visual C++ Redistributable Packages pour Visual Studio 2013** :
Téléchargez et installez à partir du site officiel de Microsoft.

1.4. **Installation de .NET Framework 4.8** (si ce n'est pas déjà fait) :
Téléchargez et installez à partir du site officiel de Microsoft.

### 2. Préparation d'Active Directory

2.1. **Extension du schéma AD** :
```cmd
Setup.exe /IAcceptExchangeServerLicenseTerms_DiagnosticDataON /PrepareSchema
```

2.2. **Préparation d'AD** :
```cmd
Setup.exe /IAcceptExchangeServerLicenseTerms_DiagnosticDataON /PrepareAD /OrganizationName:"VotreOrganisation"
```

2.3. **Préparation des domaines** :
```cmd
Setup.exe /IAcceptExchangeServerLicenseTerms_DiagnosticDataON /PrepareDomain
```

### 3. Installation d'Exchange Server

3.1. **Téléchargement d'Exchange Server** :
Téléchargez la dernière version d'Exchange Server depuis le Centre de téléchargement Volume Licensing Service Center (VLSC) de Microsoft.

3.2. **Montage de l'image ISO** :
Clic droit sur le fichier ISO > "Monter"

3.3. **Lancement de l'installation** :
Exécutez Setup.exe en tant qu'administrateur.

3.4. **Assistant d'installation** :
- Cliquez sur "Suivant" à l'écran d'accueil
- Acceptez les termes du contrat de licence
- Choisissez si vous voulez utiliser les paramètres recommandés
- Sélectionnez le rôle du serveur (généralement "Boîte aux lettres")
- Choisissez l'emplacement d'installation (par défaut : C:\Program Files\Microsoft\Exchange Server\V15)
- Nommez l'organisation Exchange (si ce n'est pas déjà fait)
- Configurez la protection contre les programmes malveillants
- Cliquez sur "Installer" et attendez que l'installation se termine

### 4. Configuration post-installation

4.1. **Configuration des certificats SSL** :
```powershell
New-ExchangeCertificate -GenerateRequest -SubjectName "cn=mail.votredomaine.com" -DomainName "mail.votredomaine.com","autodiscover.votredomaine.com" -PrivateKeyExportable $true
```

4.2. **Création d'une base de données de boîtes aux lettres** :
```powershell
New-MailboxDatabase -Name "Base1" -Server "NomDuServeur" -EdbFilePath "D:\Exchange\Base1\Base1.edb" -LogFolderPath "E:\Exchange\Base1"
```

4.3. **Création d'une boîte aux lettres test** :
```powershell
New-Mailbox -Name "Utilisateur Test" -Alias "utilisateur.test" -UserPrincipalName "utilisateur.test@votredomaine.com" -Password (ConvertTo-SecureString -String 'P@ssw0rd' -AsPlainText -Force) -Database "Base1"
```

4.4. **Configuration du serveur SMTP** :
```powershell
Set-TransportConfig -InternalSMTPServers @{Add="192.168.1.100"}
```

4.5. **Configuration des stratégies de rétention** :
```powershell
New-RetentionPolicy "Politique Standard" -RetentionPolicyTagLinks "1 Year Delete", "1 Week Delete"
```

4.6. **Configuration de l'accès client** :
```powershell
Set-ClientAccessServer -Identity NomDuServeur -AutoDiscoverServiceInternalUri https://autodiscover.votredomaine.com/autodiscover/autodiscover.xml
```

### 5. Tests et vérifications

5.1. **Test de flux de messagerie interne** :
Envoyez un e-mail entre deux boîtes aux lettres internes.

5.2. **Test de connectivité Outlook** :
Configurez un client Outlook et vérifiez la connexion.

5.3. **Test d'Outlook Web App (OWA)** :
Accédez à https://mail.votredomaine.com/owa et connectez-vous.

5.4. **Vérification des journaux** :
Examinez les journaux d'événements Windows pour détecter d'éventuelles erreurs.

# Conclusion

- Ce tutoriel détaillé couvre les principales étapes de l'installation et de la configuration initiale d'Exchange Server. 
- N'oubliez pas que chaque environnement est unique et peut nécessiter des ajustements spécifiques. 
- Il est crucial de bien planifier l'installation, de sauvegarder vos données importantes et de tester rigoureusement chaque étape du processus. 
