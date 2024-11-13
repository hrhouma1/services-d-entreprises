# 🛠️ Guide de Configuration des Stratégies de Groupe (GPO) 🛡️

## 5. 🎛️ Exemples de paramètres dans GPOs

### a. 🚫 Restreindre l'accès au panneau de configuration

**🖥️ Interface graphique :**
Configuration Utilisateur → Modèles d'administration → Panneau de configuration → Interdire l'accès au Panneau de configuration et à l'application Paramètres du PC → Activé

**💻 PowerShell :**
```powershell
Set-GPRegistryValue -Name "Nom_de_votre_GPO" -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName "NoControlPanel" -Type DWord -Value 1
```

### b. 🔌 Restreindre l'accès aux appareils amovibles (clé USB...)

**🖥️ Interface graphique :**
Configuration Utilisateur → Modèles d'administration → Système → Accès au stockage amovible → Toutes les classes de stockage amovible: refuser tous les accès → Activé

**💻 PowerShell :**
```powershell
Set-GPRegistryValue -Name "Nom_de_votre_GPO" -Key "HKCU\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -ValueName "Deny_All" -Type DWord -Value 1
```

### c. 🚫 Désactiver l'installation de logiciels par les utilisateurs

**🖥️ Interface graphique :**
Configuration ordinateur → Modèles d'administration → Composants Windows → Windows Installer → Interdire les installations par les utilisateurs → Activé

**💻 PowerShell :**
```powershell
Set-GPRegistryValue -Name "Nom_de_votre_GPO" -Key "HKLM\Software\Policies\Microsoft\Windows\Installer" -ValueName "DisableMSI" -Type DWord -Value 1
```

### d. 🧱 Ajouter des règles au pare-feu

**🖥️ Interface graphique :**
Configuration ordinateur → Paramètres Windows → Paramètres de sécurité → Pare-feu Windows avec sécurité avancée → Règles de trafic entrant → ajouter le port à ouvrir (80 dans cet exemple)

**💻 PowerShell :**
```powershell
New-NetFirewallRule -DisplayName "Allow Inbound Port 80" -Direction Inbound -LocalPort 80 -Protocol TCP -Action Allow
```

### e. 👥 Choisir quels comptes peuvent se connecter sur une machine

**🖥️ Interface graphique :**
Configuration ordinateur → Paramètres Windows → Paramètres de sécurité → Stratégies locales → Attribution des droits d'utilisateur → Accéder à cet ordinateur à partir du réseau

**💻 PowerShell :**
```powershell
$sid = (New-Object System.Security.Principal.NTAccount("DOMAIN\GroupName")).Translate([System.Security.Principal.SecurityIdentifier]).Value
Set-GPRegistryValue -Name "Nom_de_votre_GPO" -Key "HKLM\System\CurrentControlSet\Control\Lsa" -ValueName "SeDenyNetworkLogonRight" -Type MultiString -Value $sid
```

### f. ⏲️ Configurer l'arrêt du disque dur après une heure d'inactivité

**🖥️ Interface graphique :**
Configuration ordinateur → Modèles d'administration → Système → Gestion de l'alimentation → Paramètres de disque dur (sur secteur) → Arrêter le disque dur (sur secteur) → activer avec valeur 3600 secondes (=1heure)

**💻 PowerShell :**
```powershell
Set-GPRegistryValue -Name "Nom_de_votre_GPO" -Key "HKLM\Software\Policies\Microsoft\Power\PowerSettings\6738E2C4-E8A5-4A42-B16A-E040E769756E" -ValueName "ACSettingIndex" -Type DWord -Value 3600
```

### g. 🖼️ Changer l'arrière-plan des ordinateurs

**🖥️ Manipulation préalable :**
1. Créer un répertoire "images" dans le dossier réseau : \\SRV01\sysvol\test.local
2. Placer le fichier maisonneuve.jpg dans ce répertoire.

**🖥️ Interface graphique :**
Configuration utilisateur → Modèles d'administration → Bureau → Bureau → Papier Peint du Bureau → activer avec chemin d'accès de l'image "\\SRV01\sysvol\test.local\images\maisonneuve.jpg"

**💻 PowerShell :**
```powershell
Set-GPRegistryValue -Name "Nom_de_votre_GPO" -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName "Wallpaper" -Type String -Value "\\SRV01\sysvol\test.local\images\maisonneuve.jpg"
Set-GPRegistryValue -Name "Nom_de_votre_GPO" -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName "WallpaperStyle" -Type String -Value "2"
```

### h. 🔑 Changer la taille minimale des mots de passe AD

**🖥️ Interface graphique :**
Configuration ordinateur → Stratégies → Paramètres Windows → Paramètres de sécurité → Stratégies de comptes → Stratégies de mots de passe → Longueur minimale du mot de passe → activer avec valeur 7 caractères (ou plus)

**💻 PowerShell :**
```powershell
Set-ADDefaultDomainPasswordPolicy -Identity yourdomain.com -MinPasswordLength 7
```

---

🔑 **Points importants :**
- Assurez-vous d'avoir les droits d'administration 👑 nécessaires.
- Le module GroupPolicy doit être disponible sur votre système 🖥️.
- Remplacez "Nom_de_votre_GPO" par le nom réel de votre GPO dans chaque commande.
- Après l'exécution des commandes, utilisez `gpupdate /force` sur les machines cibles pour appliquer immédiatement les changements 🔄.

Ces stratégies permettent de configurer divers aspects de la sécurité 🛡️, de la performance ⚡, et de l'apparence 🎨 des postes de travail dans votre environnement Windows.

⚠️ **Attention :** Testez toujours les GPO dans un environnement de test avant de les déployer en production pour éviter tout impact indésirable sur vos utilisateurs.
