########## Script données mensuelles #########

#Import data

apprentissage_dares <- read_excel("Desktop/OFCE/apprentissage_dares.xlsx")

# Convertir la variable "date" en format date
apprentissage_dares$date <- as.Date(paste0(apprentissage_dares$date, "-01"), format = "%Y-%m-%d")

# Créer une variable "trimestre" et une variable "année"
apprentissage_dares$trimestre <- quarters(apprentissage_dares$date)
apprentissage_dares$annee <- format(apprentissage_dares$date, "%Y")

# Créer une variable "annee_trimestre"
apprentissage_dares$annee_trimestre <- paste0(apprentissage_dares$annee, "-T", apprentissage_dares$trimestre)

apprentissage_dares$annee_trimestre <- paste0(apprentissage_dares$annee, "-T",
                                              substr(apprentissage_dares$trimestre, 2, 2))

# Calcul de la moyenne trimestrielle
serie_trim_ap_dares <- aggregate(apprentissage_dares ~ annee_trimestre, data = apprentissage_dares, mean)

serie_trim_ap_dares <- serie_trim_ap_dares %>%
  mutate(annee = as.integer(str_sub(annee_trimestre, 1, 4)),
         trimestre_str = str_sub(annee_trimestre, 6),
         trimestre = case_when(
           trimestre_str == "T1" ~ 1,
           trimestre_str == "T2" ~ 2,
           trimestre_str == "T3" ~ 3,
           trimestre_str == "T4" ~ 4
         )) %>%
  select(-trimestre_str)  # Supprimer la colonne temporaire trimestre_str

# Affichage des premières lignes du dataframe avec les nouvelles colonnes
head(serie_trim_ap_dares)

# Charger le package seasonal
library(seasonal)

# Convertir les variables "annee" et "trimestre" en une seule variable de date
serie_trim_ap_dares$date <- as.Date(paste(serie_trim_ap_dares$annee, serie_trim_ap_dares$trimestre * 3 - 2, "01", sep = "-"))
seasonally_adjusted_ap_dares <- seas(ts(serie_trim_ap_dares$apprentissage_dares, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
serie_trim_ap_dares$apprentissage_dares_ds <- seasonally_adjusted_ap_dares$series$d11
serie_trim_ap_dares$apprentissage_dares_ds <-as.numeric(serie_trim_ap_dares$apprentissage_dares_ds)


#On retire les variables inutiles pour la table finale simplifee

serie_trim_ap_dares<-subset(serie_trim_ap_dares, select=-c(date, trimestre, annee))
