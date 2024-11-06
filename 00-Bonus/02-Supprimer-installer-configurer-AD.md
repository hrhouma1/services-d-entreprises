# Script : "Installation-et-Réinstallation-Complète-Active-Directory-pour-un-Collège.md"

```powershell
# ⚠️ Assurez-vous que ce script est exécuté avec les droits d'administrateur ⚠️

# Variables de configuration
$DomainName = "cmaisonneuve.qc.ca"
$NetBIOSName = "CMAISONNEUVE"
$ForestName = "cmaisonneuve.qc.ca"
$OU_Enseignants = "OU=Enseignants,DC=cmaisonneuve,DC=qc,DC=ca"
$OU_Etudiants = "OU=Etudiants,DC=cmaisonneuve,DC=qc,DC=ca"
$OU_RH = "OU=RH,DC=cmaisonneuve,DC=qc,DC=ca"
$Password = "P@ssw0rd!" # Remplacez par un mot de passe sécurisé

# 🚫 Étape 0 : Désinstallation des fonctionnalités et suppression des objets existants

# Désinstaller Active Directory Domain Services si déjà installé
if (Get-WindowsFeature AD-Domain-Services) {
    Uninstall-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -Force
}

# Désinstaller DHCP si déjà installé
if (Get-WindowsFeature DHCP) {
    Uninstall-WindowsFeature -Name DHCP -IncludeManagementTools -Force
}

# Redémarrage pour appliquer la désinstallation propre
Write-Output "Redémarrage du système pour finaliser la désinstallation."
Restart-Computer -Force
Start-Sleep -Seconds 60

# ⚙️ Étape 1 : Réinstallation des fonctionnalités nécessaires
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
Install-WindowsFeature -Name DHCP -IncludeManagementTools

# ⚙️ Étape 2 : Promotion en contrôleur de domaine avec une nouvelle forêt
Install-ADDSForest -DomainName $DomainName -DomainNetBIOSName $NetBIOSName -ForestMode "WinThreshold" -DomainMode "WinThreshold" -InstallDns -SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText $Password -Force) -Force

# ⚙️ Étape 3 : Configuration du DHCP pour le domaine
Import-Module DHCPServer

# Configuration de la portée DHCP (adapter les adresses IP selon votre réseau)
$ScopeID = "192.168.1.0"
$StartRange = "192.168.1.100"
$EndRange = "192.168.1.200"
$SubnetMask = "255.255.255.0"
$LeaseDuration = "8.00:00:00"

Add-DhcpServerv4Scope -Name "Scope $DomainName" -StartRange $StartRange -EndRange $EndRange -SubnetMask $SubnetMask -LeaseDuration $LeaseDuration -State Active

# ⚙️ Étape 4 : Création des Unités d'Organisation (OU)
New-ADOrganizationalUnit -Name "Enseignants" -Path "DC=cmaisonneuve,DC=qc,DC=ca"
New-ADOrganizationalUnit -Name "Etudiants" -Path "DC=cmaisonneuve,DC=qc,DC=ca"
New-ADOrganizationalUnit -Name "Ressources Humaines" -Path "DC=cmaisonneuve,DC=qc,DC=ca"

# ⚙️ Étape 5 : Création de groupes pour chaque OU
New-ADGroup -Name "GroupeEnseignants" -GroupScope Global -GroupCategory Security -Path $OU_Enseignants
New-ADGroup -Name "GroupeEtudiants" -GroupScope Global -GroupCategory Security -Path $OU_Etudiants
New-ADGroup -Name "GroupeRH" -GroupScope Global -GroupCategory Security -Path $OU_RH

# ⚙️ Étape 6 : Ajout d'utilisateurs enseignants avec adresses e-mail
$Enseignants = @(
    @{FirstName="Haythem"; LastName="Rehouma"; Email="hrehouma@$DomainName"}
    # Ajoutez d'autres enseignants ici
)

foreach ($Enseignant in $Enseignants) {
    $Username = $Enseignant.FirstName.Substring(0,1) + $Enseignant.LastName
    $UserPrincipalName = "$Username@$DomainName"
    New-ADUser -Name "$($Enseignant.FirstName) $($Enseignant.LastName)" `
               -GivenName $Enseignant.FirstName `
               -Surname $Enseignant.LastName `
               -UserPrincipalName $UserPrincipalName `
               -SamAccountName $Username `
               -EmailAddress $Enseignant.Email `
               -Path $OU_Enseignants `
               -AccountPassword (ConvertTo-SecureString -AsPlainText $Password -Force) `
               -Enabled $true
    Add-ADGroupMember -Identity "GroupeEnseignants" -Members $Username
}

# ⚙️ Étape 7 : Ajout massif d'étudiants avec adresses e-mail
$Etudiants = @(
    @{Username="e123456"; Email="e123456@$DomainName"}
    @{Username="e123457"; Email="e123457@$DomainName"}
    # Ajoutez d'autres étudiants ici
)

foreach ($Etudiant in $Etudiants) {
    New-ADUser -Name $Etudiant.Username `
               -SamAccountName $Etudiant.Username `
               -UserPrincipalName "$($Etudiant.Username)@$DomainName" `
               -EmailAddress $Etudiant.Email `
               -Path $OU_Etudiants `
               -AccountPassword (ConvertTo-SecureString -AsPlainText $Password -Force) `
               -Enabled $true
    Add-ADGroupMember -Identity "GroupeEtudiants" -Members $Etudiant.Username
}

# ⚙️ Étape 8 : Configuration des GPO (exemple)
# Exemple de GPO : interdire l'accès au Panneau de configuration pour les étudiants
$GPOName = "GPO-Etudiants"
New-GPO -Name $GPOName | New-GPLink -Target $OU_Etudiants -LinkEnabled Yes
Set-GPRegistryValue -Name $GPOName -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName "NoControlPanel" -Type DWord -Value 1

# 🔄 Vérification et affichage des informations d'installation
Write-Output "Active Directory et les composants associés ont été installés et configurés avec succès."
Write-Output "Forêt Active Directory : $ForestName"
Write-Output "Domaine : $DomainName"
Write-Output "OU Enseignants : $OU_Enseignants"
Write-Output "OU Etudiants : $OU_Etudiants"
Write-Output "OU Ressources Humaines : $OU_RH"
Write-Output "Les utilisateurs enseignants et étudiants ont été créés avec leurs adresses e-mail."
Write-Output "GPO appliqué : $GPOName pour les étudiants."
```

### Explications supplémentaires :
1. **Désinstallation des fonctionnalités AD DS et DHCP** : La première partie du script désinstalle les rôles Active Directory Domain Services et DHCP si présents, puis redémarre le système pour garantir une installation propre.
2. **Installation et configuration propre** : Après le redémarrage, le script installe AD DS, crée la forêt et le domaine, et configure DHCP ainsi que les OUs et les utilisateurs.
3. **Configuration des GPO** : Un exemple de GPO est appliqué pour restreindre l'accès au panneau de configuration pour les étudiants, illustrant comment les GPO peuvent être configurées de manière automatique.

### Remarques :
- **Redémarrage** : Un redémarrage est nécessaire après la désinstallation pour éviter des conflits de dépendances.
- **Personnalisation** : Vous pouvez ajuster les variables `$Enseignants` et `$Etudiants` pour ajouter plus d'utilisateurs.
- **Exécution du script** : Exécutez ce script en tant qu'administrateur pour garantir son bon fonctionnement.

Ce script assure une configuration propre sans conflit pour une installation d’Active Directory dans un environnement scolaire.