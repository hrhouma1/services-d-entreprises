# Projet Pratique : Création et Gestion des GPO en PowerShell

En vous basant sur les commandes étudiées dans les sections précédentes, créez une application pratique en PowerShell qui permet de gérer et automatiser les tâches suivantes pour des stratégies de groupe (GPO) dans un environnement Active Directory. Ce projet mettra en application la création, la gestion, et l’organisation de GPO de manière autonome.

## Objectifs de l'Application

L’application devra permettre d’effectuer les actions suivantes de manière automatisée et en suivant une séquence logique, tout en fournissant un retour clair sur les opérations effectuées :

1. **Créer une GPO et la Lier à une OU**
   - Créez une nouvelle GPO avec un nom et un commentaire spécifique.
   - Associez cette GPO à une unité organisationnelle (OU) de votre choix.

2. **Sauvegarder et Restaurer la GPO**
   - Sauvegardez la GPO nouvellement créée dans un répertoire dédié.
   - Effectuez une restauration à partir de cette sauvegarde pour tester le bon fonctionnement de l’opération.

3. **Modifier et Supprimer le Lien de la GPO**
   - Appliquez la GPO de manière forcée à l’OU cible.
   - Désactivez ensuite son lien pour tester la gestion des liens.
   - Supprimez le lien de la GPO avec l’OU cible pour finaliser cette partie.

4. **Gérer les Permissions de la GPO**
   - Accordez un accès en lecture seule à un groupe spécifique.
   - Modifiez les permissions pour accorder les droits de modification.
   - Retirez les permissions complètement pour un groupe afin de tester la gestion des droits d'accès.
   - Vérifiez les permissions d'un groupe sur la GPO.

5. **Copier, Renommer et Supprimer une GPO**
   - Créez une copie de la GPO avec un nom distinct.
   - Modifiez le nom de cette copie pour tester la fonctionnalité de renommage.
   - Supprimez ensuite la copie pour valider la suppression d’une GPO.

6. **Application des Permissions à un Groupe d'Utilisateurs Sélectionné**
   - Utilisez un filtre pour accorder les permissions de modification à tous les utilisateurs portant un titre spécifique, comme **Ingénieur**.
   
## Livrables

### 1. Script PowerShell Automatisé
   - Rédigez un script PowerShell qui exécute chaque étape de manière séquentielle.
   - Le script doit inclure des messages d’information (feedback) pour confirmer chaque action (ex : "La GPO X a été créée", "Les permissions ont été modifiées", etc.).
   
### 2. Documentation des Étapes
   - Fournissez une documentation expliquant chaque étape de votre script, en précisant quelles commandes PowerShell sont utilisées et pour quelles raisons.
   - Cette documentation peut inclure des captures d’écran montrant les résultats dans l’environnement Active Directory.

### 3. Analyse des Résultats
   - Effectuez une analyse des résultats pour chaque commande exécutée (succès, échec, permissions appliquées, etc.) et incluez cette analyse dans le rapport final.

Ce projet vous aidera à maîtriser les opérations courantes de gestion de GPO dans un domaine Active Directory et à comprendre comment automatiser ces tâches.
