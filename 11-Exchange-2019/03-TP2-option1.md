
### **Mise à jour : Travail pratique 2 - Instructions supplémentaires**

#### **Topologie réseau et flexibilité**
1. **Adresse IP et réseau** : Vous devez utiliser un réseau NAT (172.16.1.0/24 comme indiqué) pour connecter le serveur SRV05 et le poste client PC5. 
   - Adresse IP pour SRV05 : `172.16.1.10/24`
   - Adresse IP pour PC5 : Choisissez une adresse valide dans le même réseau (par exemple, `172.16.1.101/24`).

2. **Ajout d’un composant réseau optionnel** :
   - Vous êtes libres d’ajouter un pare-feu ou un routeur virtuel comme **pfSense** pour gérer les sous-réseaux ou contrôler les flux réseau.
   - Documentez l’ajout de ce composant, incluant les configurations essentielles comme :
     - Interfaces réseau.
     - Règles de pare-feu appliquées.
     - Routes ou VLAN créés.
   - Vous pouvez également configurer le pare-feu de Windows sur SRV05 pour gérer les connexions réseau.

3. **Alternative sans NAT** :
   - Si vous ne souhaitez pas utiliser le mode NAT, expliquez comment vous configurez un autre type de réseau (ex. : bridge ou réseau local isolé) et justifiez votre choix.

#### **Ajouts d’éléments au travail pratique :**
1. **Tests réseau** :
   - Testez la connectivité entre SRV05 et PC5 (via `ping` ou `Test-Connection` en PowerShell) et capturez les résultats.
   - Vérifiez que PC5 peut résoudre le nom de domaine créé sur SRV05 (`votre_nom.local`).

2. **Documentation complète requise** :
   - Pour toute modification de la topologie (ex. : ajout de pfSense), fournissez un schéma mis à jour montrant les connexions entre les composants (comme dans votre capture d’écran).
   - Expliquez les étapes nécessaires pour intégrer ce composant dans le réseau et justifiez les choix réalisés.

3. **Note supplémentaire** : 
   - Des points supplémentaires peuvent être attribués pour une documentation soignée, des configurations avancées ou l’ajout d’un composant réseau pertinent (pare-feu, DNS secondaire, etc.).

#### **Parties du TP inchangées :**
Les consignes des parties 1 à 3 restent valables avec les ajouts suivants pour mettre en œuvre une solution réseau cohérente :

**Validation non requise** : 
Fournissez des captures d’écran détaillées de votre topologie réseau accompagnées de commentaires explicatifs pour chaque image. Ces éléments sont obligatoires avant de passer à la partie 2, mais une validation préalable de l’enseignant n’est pas nécessaire.



### **Ressources utiles :**
- vos notes de cours


