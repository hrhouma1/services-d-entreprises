### **Scénario d'évaluation : Installation de Microsoft Exchange et création de cinq utilisateurs**

#### **Contexte** :
Vous êtes administrateur système dans une entreprise fictive, **TechNova**, et votre mission est de déployer une solution de messagerie basée sur **Microsoft Exchange Server**. Après l'installation, vous devez configurer cinq comptes utilisateurs pour les employés suivants :

1. **John Smith**  
2. **Emily Davis**  
3. **Michael Johnson**  
4. **Sophia Brown**  
5. **William Wilson**

Votre objectif est de fournir un guide clair et structuré des étapes nécessaires pour installer Microsoft Exchange Server et créer les comptes utilisateurs via PowerShell. Aucune capture d'écran ou preuve n'est requise.

---

### **Étapes pour l'installation de Microsoft Exchange Server et création d’utilisateurs**

#### **1. Prérequis pour l’installation**

1. **Système d'exploitation** :  
   Installez un serveur Windows Server compatible avec Exchange (ex. : Windows Server 2019 ou 2022).

2. **Préparation des rôles et fonctionnalités Windows** :  
   Exécutez les commandes suivantes dans PowerShell en mode Administrateur pour installer les rôles nécessaires :
   ```powershell
   Install-WindowsFeature AD-Domain-Services, RSAT-ADDS, Web-Server, Web-Mgmt-Tools, WAS-Process-Model, Web-Asp-Net45, Web-Dyn-Compression, RSAT-Web-Server, Desktop-Experience
   ```

3. **Configuration d'Active Directory** :  
   - Installez et configurez Active Directory.  
   - Promouvez le serveur en tant que contrôleur de domaine avec une zone DNS.

4. **Installation de Microsoft .NET Framework** :  
   Téléchargez et installez la version requise (v4.8 minimum pour Exchange Server 2019).

5. **Préparation du schéma Active Directory pour Exchange** :  
   Utilisez la commande suivante après avoir extrait les fichiers d'installation Exchange :  
   ```powershell
   .\Setup.exe /PrepareSchema /IAcceptExchangeServerLicenseTerms
   ```

6. **Préparation du domaine pour Exchange** :  
   Exécutez :  
   ```powershell
   .\Setup.exe /PrepareAD /OrganizationName:"TechNova" /IAcceptExchangeServerLicenseTerms
   ```

---

#### **2. Installation de Microsoft Exchange Server**

1. **Téléchargez le fichier d’installation Exchange Server 2019.**

2. **Lancez l’installation** :  
   Exécutez la commande suivante pour installer Exchange en mode GUI :  
   ```powershell
   .\Setup.exe /Mode:Install /Roles:Mailbox /IAcceptExchangeServerLicenseTerms
   ```

3. **Configuration post-installation** :  
   Une fois l’installation terminée, ouvrez le **Centre d’administration Exchange (EAC)** pour vérifier le bon fonctionnement.

---

#### **3. Création des utilisateurs via PowerShell**

1. **Ouvrez Exchange Management Shell (EMS)**.  
   Cela vous permet d’exécuter des commandes PowerShell spécifiques à Exchange.

2. **Créer cinq utilisateurs Active Directory avec boîte mail** :  
   Exécutez les commandes suivantes pour chaque utilisateur :

   **John Smith** :
   ```powershell
   New-Mailbox -Name "John Smith" -Alias "johnsmith" -UserPrincipalName "john.smith@technova.local" -FirstName "John" -LastName "Smith" -Password (ConvertTo-SecureString -String "P@ssword123" -AsPlainText -Force)
   ```

   **Emily Davis** :
   ```powershell
   New-Mailbox -Name "Emily Davis" -Alias "emilydavis" -UserPrincipalName "emily.davis@technova.local" -FirstName "Emily" -LastName "Davis" -Password (ConvertTo-SecureString -String "P@ssword123" -AsPlainText -Force)
   ```

   **Michael Johnson** :
   ```powershell
   New-Mailbox -Name "Michael Johnson" -Alias "michaeljohnson" -UserPrincipalName "michael.johnson@technova.local" -FirstName "Michael" -LastName "Johnson" -Password (ConvertTo-SecureString -String "P@ssword123" -AsPlainText -Force)
   ```

   **Sophia Brown** :
   ```powershell
   New-Mailbox -Name "Sophia Brown" -Alias "sophiabrown" -UserPrincipalName "sophia.brown@technova.local" -FirstName "Sophia" -LastName "Brown" -Password (ConvertTo-SecureString -String "P@ssword123" -AsPlainText -Force)
   ```

   **William Wilson** :
   ```powershell
   New-Mailbox -Name "William Wilson" -Alias "williamwilson" -UserPrincipalName "william.wilson@technova.local" -FirstName "William" -LastName "Wilson" -Password (ConvertTo-SecureString -String "P@ssword123" -AsPlainText -Force)
   ```

---

#### **4. Vérification des utilisateurs créés**

1. Listez tous les utilisateurs avec boîte mail pour confirmer leur création :  
   ```powershell
   Get-Mailbox | Select-Object Name, Alias, PrimarySmtpAddress
   ```

2. Vérifiez les propriétés spécifiques d'un utilisateur (exemple : John Smith) :  
   ```powershell
   Get-Mailbox -Identity "John Smith" | Format-List
   ```


### **5. Scénarios de test d’envoi de courriers électroniques**

Une fois les utilisateurs créés et les boîtes mail configurées, vous devez tester l’envoi et la réception de courriels entre eux. Voici les étapes pour chaque scénario :

#### **Étapes pour tester l’envoi de courriels via PowerShell**

1. **Connectez-vous à Exchange Management Shell (EMS)**.

2. **Utilisez la commande suivante pour envoyer un e-mail** depuis un utilisateur à un autre :  
   - Exemple : John Smith envoie un e-mail à Emily Davis.
   ```powershell
   Send-MailMessage -From "john.smith@technova.local" -To "emily.davis@technova.local" -Subject "Test Email from John" -Body "Hello Emily, this is a test email from John." -SmtpServer "localhost"
   ```

3. Répétez l’opération pour chaque scénario d’envoi, en modifiant l’expéditeur, le destinataire, et le contenu. Voici les scénarios :

   - **Scénario 1** :  
     **Expéditeur** : John Smith  
     **Destinataire** : Emily Davis  
     **Sujet** : Collaboration Planning  
     **Contenu** : "Hi Emily, let's plan our collaboration on the new project."

   - **Scénario 2** :  
     **Expéditeur** : Emily Davis  
     **Destinataire** : Michael Johnson  
     **Sujet** : Budget Approval  
     **Contenu** : "Hello Michael, please review and approve the attached budget."

   - **Scénario 3** :  
     **Expéditeur** : Michael Johnson  
     **Destinataire** : Sophia Brown  
     **Sujet** : Security Policy Update  
     **Contenu** : "Hi Sophia, please make sure the team is updated on the new security policies."

   - **Scénario 4** :  
     **Expéditeur** : Sophia Brown  
     **Destinataire** : William Wilson  
     **Sujet** : Weekly Report Reminder  
     **Contenu** : "Hi William, this is a reminder to submit your weekly report by Friday."

   - **Scénario 5** :  
     **Expéditeur** : William Wilson  
     **Destinataire** : John Smith  
     **Sujet** : Meeting Confirmation  
     **Contenu** : "Hi John, just confirming our meeting scheduled for tomorrow at 10 AM."

#### **Vérification de la réception des e-mails**

1. Utilisez l’EAC (Exchange Admin Center) ou PowerShell pour vérifier la réception des courriels.  
   Exemple : Vérifiez les courriels de Michael Johnson :
   ```powershell
   Search-Mailbox -Identity "Michael Johnson" -SearchQuery "Subject:'Budget Approval'" -LogOnly -TargetMailbox "administrator@technova.local" -TargetFolder "Audit"
   ```

2. Assurez-vous que chaque utilisateur peut à la fois **envoyer** et **recevoir** des e-mails correctement.





### **6. Installation d’un client de messagerie et configuration pour tester les courriels**

Pour tester l’envoi et la réception des e-mails via une interface graphique, vous devez configurer un client de messagerie comme **Microsoft Outlook**, **Office 365**, ou utiliser l’interface web d’Exchange, appelée **Outlook Web App (OWA)**. Voici les étapes détaillées.

---

#### **6.1. Installation et configuration d’un client de messagerie**

1. **Installez un client de messagerie** sur une machine ou un poste de travail. Vous pouvez utiliser :
   - **Microsoft Outlook** (via une licence Office ou un abonnement Office 365).
   - **Thunderbird** (client gratuit).

2. **Configuration d’un compte Exchange dans le client de messagerie** :
   - Ouvrez le client installé (ex. : Microsoft Outlook).
   - Ajoutez un nouveau compte en utilisant l’adresse e-mail et les informations de connexion d’un des utilisateurs créés.  
     Exemple pour John Smith :  
     - **Adresse e-mail** : `john.smith@technova.local`  
     - **Mot de passe** : `P@ssword123`  
     - **Serveur Exchange** : URL de votre serveur Exchange, par exemple, `mail.technova.local`.

3. **Testez l’envoi et la réception de courriels** :
   - Utilisez le client de messagerie pour envoyer un e-mail depuis John Smith à un autre utilisateur, par exemple, Emily Davis.
   - Assurez-vous que l’e-mail est bien reçu et peut être lu depuis le client de messagerie d’Emily.

---

#### **6.2. Installation et utilisation d’Outlook Web App (OWA)**

**Qu’est-ce qu’Outlook Web App (OWA)** ?  
Outlook Web App est une interface web qui permet aux utilisateurs de gérer leurs courriels directement depuis un navigateur. Elle est intégrée dans Microsoft Exchange Server et offre une alternative aux clients de messagerie locaux.

**Étapes pour configurer OWA** :

1. **Installation d’OWA** :  
   OWA est généralement inclus avec Exchange Server. Pendant l'installation d'Exchange, OWA est automatiquement configuré sur votre serveur.

2. **URL pour accéder à OWA** :  
   L’URL par défaut pour OWA est similaire à :  
   ```
   https://mail.technova.local/owa
   ```
   Vous pouvez la tester en entrant cette adresse dans un navigateur web.

3. **Connexion des utilisateurs** :  
   - Fournissez aux utilisateurs leurs identifiants pour accéder à leurs boîtes mail via OWA.
     Exemple :  
     - Nom d’utilisateur : `john.smith@technova.local`  
     - Mot de passe : `P@ssword123`

4. **Testez l’envoi et la réception** via OWA :
   - Connectez-vous en tant que John Smith.
   - Envoyez un e-mail à Emily Davis et vérifiez si l’e-mail arrive dans la boîte de réception d’Emily sur OWA.

---

#### **6.3. Où se trouvent les bases de données d’Exchange ?**

Les bases de données d’Exchange contiennent toutes les informations des boîtes mail, y compris les messages, les calendriers et les contacts. Par défaut, elles sont stockées dans le répertoire suivant :

- **Chemin par défaut des bases de données Exchange** :  
  ```
  C:\Program Files\Microsoft\Exchange Server\V15\Mailbox\<Nom_Base>
  ```

- **Commandes pour gérer et vérifier les bases de données** :
  1. Listez les bases de données disponibles :
     ```powershell
     Get-MailboxDatabase
     ```

  2. Vérifiez l’état d’une base de données spécifique :
     ```powershell
     Get-MailboxDatabase -Identity "MailboxDatabase01" | Format-List
     ```

  3. Déplacez les fichiers d’une base de données vers un autre emplacement (si nécessaire) :
     ```powershell
     Move-DatabasePath -Identity "MailboxDatabase01" -EdbFilePath "D:\ExchangeDatabases\MailboxDatabase01.edb" -LogFolderPath "D:\ExchangeLogs"
     ```

  > **Note** : Toute modification des bases de données doit être effectuée avec précaution, car cela peut affecter la disponibilité des boîtes mail.



















---



### **Consignes finales**

1. Documentez les commandes PowerShell utilisées pour chaque scénario d’envoi d’e-mails.  
2. Décrivez les étapes suivies pour vérifier que les e-mails ont été envoyés et reçus avec succès.  
3. Structurez votre travail proprement, avec une section dédiée à chaque scénario.  
4. Aucune preuve technique ou capture d’écran n’est requise. Envoyez uniquement un **document texte propre** comprenant :
   - Les étapes suivies pour chaque scénario.
   - Les commandes PowerShell utilisées.


### **Livrable attendu** :


- Un guide propre, rédigé étape par étape comme présenté ci-dessus. Aucune capture d’écran ou preuve technique n’est requise.


1. Décrivez les étapes suivies pour configurer un client de messagerie comme Outlook ou Thunderbird.  
2. Documentez les tests réalisés via OWA, avec les commandes utilisées pour vérifier les bases de données.  
3. Mentionnez l’URL OWA et expliquez brièvement son rôle pour une interface web conviviale.  
4. Structurez vos explications proprement pour refléter les tests et vérifications effectués.
