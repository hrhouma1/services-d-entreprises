# Parcourt tous les fichiers dans le dossier courant et les sous-dossiers
Get-ChildItem -Recurse -File | ForEach-Object {
    $fichier = $_

    # Vérifie si le nom du fichier commence par 'FR_890_'
    if ($fichier.Name -like 'FR_890_*') {
        # Supprime le préfixe 'FR_890_' du nom du fichier
        $nouveauNom = $fichier.Name -replace '^FR_890_', ''
        
        # Renomme le fichier avec le nouveau nom
        Rename-Item -Path $fichier.FullName -NewName $nouveauNom -Force
    }
}