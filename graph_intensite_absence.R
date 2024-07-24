#Graph intensité d'absence 

# Chargement des packages nécessaires
library(ggplot2)

base_intensite$jours_abs_simplifie<-NA
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==0.5]<-0.5
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==1]<-1
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==1.5]<-1.5
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==2]<-2
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==2.5]<-2.5
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==3]<-3
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==3.5]<-3.5
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==4]<-4
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==4.5]<-4.5
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==5]<-"5 jours ou plus"
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==5.5]<-"5 jours ou plus"
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==6]<-"5 jours ou plus"
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==6.5]<-"5 jours ou plus"
base_intensite$jours_abs_simplifie[base_intensite$jours_abs_maladie==7]<-"5 jours ou plus"

# Supposons que votre base de données s'appelle "data" et contient une colonne "jours_abs_maladie" et une colonne "annee" pour l'année de l'observation

# Filtrer les données pour inclure uniquement les années spécifiées
# Chargement des packages nécessaires
library(ggplot2)

# Supposons que votre base de données s'appelle "data" et contient une colonne "jours_abs_maladie" et une colonne "annee" pour l'année de l'observation

# Filtrer les données pour inclure uniquement les années spécifiées
annees <- c(2003, 2008, 2013, 2018, 2022)
data_filtree <- subset(base_intensite, !is.na(jours_abs_simplifie) &annee %in% annees)

# Créer un graphique à barres pondéré des valeurs de "jours_abs_maladie" avec facet_grid
ggplot(data_filtree, aes(x = jours_abs_simplifie, weight = pond)) +
  geom_bar(fill = "skyblue", color = "black") +
  facet_grid(~annee) +
  labs(title = "Distribution des jours d'absence maladie par année",
       x = "Nombre de jours d'absence maladie",
       y = "Nombre d'individus") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#Pour passer en fréquence relative 

# Supposons que votre base de données s'appelle "data" et contient une colonne "jours_abs_simplifie" et une colonne "annee" pour l'année de l'observation

# Filtrer les données pour inclure uniquement les années spécifiées et exclure les NA
annees <- c(2003, 2008, 2013, 2018, 2022)
data_filtree <- subset(base_intensite, !is.na(jours_abs_simplifie) & !is.na(pond) & annee %in% annees)

# Calculer les fréquences relatives pour chaque modalité de "jours_abs_simplifie" pour chaque année
annees <- c(2003, 2008, 2013, 2018, 2022)
base_intensite$jours_abs_binaire<-"plus de la moitié de la semaine"
base_intensite$jours_abs_binaire[base_intensite$jours_abs_maladie<=3]<-"moins de la moitié de la semaine"
data_filtree <- subset(base_intensite, !is.na(jours_abs_maladie) & !is.na(pond) & annee %in% annees)
freq <- aggregate(pond ~ annee + jours_abs_binaire, data = data_filtree, FUN = sum)
denom<-aggregate(pond ~ annee, data = data_filtree, FUN = sum)
freq<-as.data.frame(freq)
denom<-as.data.frame(denom)
freq <- freq %>% 
  dplyr::rename("pond_jours_abs" = "pond")

freq_relative<-right_join(freq, denom, by="annee")
freq_relative$freq_relative<-(freq_relative$pond_jours_abs/freq_relative$pond)*100

# Créer un graphique à barres pondéré des fréquences relatives de chaque modalité pour chaque année
ggplot(freq_relative, aes(x = jours_abs_simplifie, y = pourcentage, fill = jours_abs_simplifie)) +
  geom_bar(stat = "identity") +
  facet_wrap(~annee) +
  labs(title = "Distribution des fréquences relatives de chaque modalité par année",
       x = "Nombre de jours d'absence maladie",
       y = "Pourcentage d'individus") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


