# Spécifier le chemin local où vos fichiers CSV sont enregistrés
base_path <- "Desktop/OFCE/Productivite/FR_QUAR/"
# Initialiser une liste pour stocker les dataframes
all_data <- list()

# Boucle pour traiter les fichiers CSV de 2003Q1 à 2018Q4
for (year in 2003:2018) {
  for (quarter in 1:4) {
    # Formatage de la chaîne du trimestre
    quarter_str <- paste0("Q", quarter)
    
    # Formatage de la chaîne complète pour l'année et le trimestre
    data_format <- paste0("FR", year, quarter_str)
    
    # Construire le chemin complet vers le fichier CSV
    file_path <- paste0(base_path, data_format, ".csv")
    
    # Vérifier si le fichier existe avant de le lire
    if (file.exists(file_path)) {
      # Lire le fichier CSV
      data <- read.csv(file_path)
      
      # Ajouter le dataframe à la liste
      all_data[[length(all_data) + 1]] <- data
      
      # Traitement des données (remplacez cela par le traitement spécifique à vos données)
      print(paste("Base", data_format))
      # ... votre code de traitement ici ...
    } else {
      cat("Le fichier", file_path, "n'existe pas.\n")
    }
  }
}

# Concaténer tous les dataframes dans la liste
if (length(all_data) > 0) {
  concatenated_data <- do.call(rbind, all_data)
  
  # Afficher les premières lignes du dataframe concaténé
  print(head(concatenated_data))
} else {
  cat("Aucun fichier CSV trouvé.\n")
}
print(head(concatenated_data))

summary(concatenated_data$QUARTER)