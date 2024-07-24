######## Script desaisonnalisation series enquete emploi #######

#1. Base emploi total

# Chargement des packages
library(dplyr)
library(stringr)

# Supposons que table_emplois_g_s soit un dataframe dans R
# Utilisons mutate pour ajouter les colonnes d'année et de trimestre
table_emplois_g_s <- table_emplois_g_s %>%
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
head(table_emplois_g_s)

# Charger le package seasonal
library(seasonal)

# Convertir les variables "annee" et "trimestre" en une seule variable de date
table_emplois_g_s$date <- as.Date(paste(table_emplois_g_s$annee, table_emplois_g_s$trimestre * 3 - 2, "01", sep = "-"))

donnees_agri<-table_emplois_g_s[table_emplois_g_s$Grand_secteur=="Agriculture",]
donnees_indus<-table_emplois_g_s[table_emplois_g_s$Grand_secteur=="Industrie",]
donnees_constru<-table_emplois_g_s[table_emplois_g_s$Grand_secteur=="Construction",]
donnees_marchand<-table_emplois_g_s[table_emplois_g_s$Grand_secteur=="Tertiaire marchand",]
donnees_non_marchand<-table_emplois_g_s[table_emplois_g_s$Grand_secteur=="Tertiaire non marchand",]

seasonally_adjusted <- seas(ts(donnees_agri$emploi_total_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_agri$emploi_total_EE_ds <- seasonally_adjusted$series$d11

seasonally_adjusted_1 <- seas(ts(donnees_indus$emploi_total_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_indus$emploi_total_EE_ds <- seasonally_adjusted_1$series$d11

seasonally_adjusted_2 <- seas(ts(donnees_constru$emploi_total_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_constru$emploi_total_EE_ds <- seasonally_adjusted_2$series$d11

seasonally_adjusted_3 <- seas(ts(donnees_marchand$emploi_total_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_marchand$emploi_total_EE_ds <- seasonally_adjusted_3$series$d11

seasonally_adjusted_4 <- seas(ts(donnees_non_marchand$emploi_total_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_non_marchand$emploi_total_EE_ds <- seasonally_adjusted_4$series$d11

donnees_non_marchand$emploi_total_EE_ds <- as.numeric(donnees_non_marchand$emploi_total_EE_ds)
donnees_marchand$emploi_total_EE_ds <- as.numeric(donnees_marchand$emploi_total_EE_ds)
donnees_agri$emploi_total_EE_ds <- as.numeric(donnees_agri$emploi_total_EE_ds)
donnees_constru$emploi_total_EE_ds <- as.numeric(donnees_constru$emploi_total_EE_ds)
donnees_indus$emploi_total_EE_ds <- as.numeric(donnees_indus$emploi_total_EE_ds)

table_emplois_g_s_ds<-rbind(donnees_agri, donnees_indus, donnees_constru, donnees_marchand, donnees_non_marchand)

#2. Base emploi salarie 

# Supposons que table_emplois_g_s soit un dataframe dans R
# Utilisons mutate pour ajouter les colonnes d'année et de trimestre
table_emplois_salarie_g_s <- table_emplois_salarie_g_s %>%
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
head(table_emplois_salarie_g_s)

# Charger le package seasonal
library(seasonal)

# Convertir les variables "annee" et "trimestre" en une seule variable de date
table_emplois_salarie_g_s$date <- as.Date(paste(table_emplois_salarie_g_s$annee, table_emplois_salarie_g_s$trimestre * 3 - 2, "01", sep = "-"))

donnees_agri_1<-table_emplois_salarie_g_s[table_emplois_salarie_g_s$Grand_secteur=="Agriculture",]
donnees_indus_1<-table_emplois_salarie_g_s[table_emplois_salarie_g_s$Grand_secteur=="Industrie",]
donnees_constru_1<-table_emplois_salarie_g_s[table_emplois_salarie_g_s$Grand_secteur=="Construction",]
donnees_marchand_1<-table_emplois_salarie_g_s[table_emplois_salarie_g_s$Grand_secteur=="Tertiaire marchand",]
donnees_non_marchand_1<-table_emplois_salarie_g_s[table_emplois_salarie_g_s$Grand_secteur=="Tertiaire non marchand",]

seasonally_adjusted_s <- seas(ts(donnees_agri_1$emploi_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_agri_1$emploi_salarie_EE_ds <- seasonally_adjusted_s$series$d11

seasonally_adjusted_1_s <- seas(ts(donnees_indus_1$emploi_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_indus_1$emploi_salarie_EE_ds <- seasonally_adjusted_1_s$series$d11

seasonally_adjusted_2_s <- seas(ts(donnees_constru_1$emploi_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_constru_1$emploi_salarie_EE_ds <- seasonally_adjusted_2_s$series$d11

seasonally_adjusted_3_s <- seas(ts(donnees_marchand_1$emploi_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_marchand_1$emploi_salarie_EE_ds <- seasonally_adjusted_3_s$series$d11

seasonally_adjusted_4_s <- seas(ts(donnees_non_marchand_1$emploi_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_non_marchand_1$emploi_salarie_EE_ds <- seasonally_adjusted_4_s$series$d11

donnees_non_marchand_1$emploi_salarie_EE_ds <- as.numeric(donnees_non_marchand_1$emploi_salarie_EE_ds)
donnees_marchand_1$emploi_salarie_EE_ds <- as.numeric(donnees_marchand_1$emploi_salarie_EE_ds)
donnees_agri_1$emploi_salarie_EE_ds <- as.numeric(donnees_agri_1$emploi_salarie_EE_ds)
donnees_indus_1$emploi_salarie_EE_ds <- as.numeric(donnees_indus_1$emploi_salarie_EE_ds)
donnees_constru_1$emploi_salarie_EE_ds <- as.numeric(donnees_constru_1$emploi_salarie_EE_ds)

table_emplois_salarie_g_s_ds<-rbind(donnees_agri_1, donnees_indus_1, donnees_constru_1, donnees_marchand_1, donnees_non_marchand_1)

#3. Base emploi non salarie 

table_emplois_non_salarie_g_s <- table_emplois_non_salarie_g_s %>%
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
head(table_emplois_non_salarie_g_s)

# Charger le package seasonal
library(seasonal)

# Convertir les variables "annee" et "trimestre" en une seule variable de date
table_emplois_non_salarie_g_s$date <- as.Date(paste(table_emplois_non_salarie_g_s$annee, table_emplois_non_salarie_g_s$trimestre * 3 - 2, "01", sep = "-"))

donnees_agri_ns<-table_emplois_non_salarie_g_s[table_emplois_non_salarie_g_s$Grand_secteur=="Agriculture",]
donnees_indus_ns<-table_emplois_non_salarie_g_s[table_emplois_non_salarie_g_s$Grand_secteur=="Industrie",]
donnees_constru_ns<-table_emplois_non_salarie_g_s[table_emplois_non_salarie_g_s$Grand_secteur=="Construction",]
donnees_marchand_ns<-table_emplois_non_salarie_g_s[table_emplois_non_salarie_g_s$Grand_secteur=="Tertiaire marchand",]
donnees_non_marchand_ns<-table_emplois_non_salarie_g_s[table_emplois_non_salarie_g_s$Grand_secteur=="Tertiaire non marchand",]

seasonally_adjusted_ns <- seas(ts(donnees_agri_ns$emploi_non_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_agri_ns$emploi_non_salarie_EE_ds <- seasonally_adjusted_ns$series$d11

seasonally_adjusted_1_ns <- seas(ts(donnees_indus_ns$emploi_non_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_indus_ns$emploi_non_salarie_EE_ds <- seasonally_adjusted_1_ns$series$d11

seasonally_adjusted_2_ns <- seas(ts(donnees_constru_ns$emploi_non_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_constru_ns$emploi_non_salarie_EE_ds <- seasonally_adjusted_2_ns$series$d11

seasonally_adjusted_3_ns <- seas(ts(donnees_marchand_ns$emploi_non_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_marchand_ns$emploi_non_salarie_EE_ds <- seasonally_adjusted_3_ns$series$d11

seasonally_adjusted_4_ns <- seas(ts(donnees_non_marchand_ns$emploi_non_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_non_marchand_ns$emploi_non_salarie_EE_ds <- seasonally_adjusted_4_ns$series$d11

donnees_non_marchand_ns$emploi_non_salarie_EE_ds <-as.numeric(donnees_non_marchand_ns$emploi_non_salarie_EE_ds)
donnees_marchand_ns$emploi_non_salarie_EE_ds <-as.numeric(donnees_marchand_ns$emploi_non_salarie_EE_ds)
donnees_agri_ns$emploi_non_salarie_EE_ds <-as.numeric(donnees_agri_ns$emploi_non_salarie_EE_ds)
donnees_indus_ns$emploi_non_salarie_EE_ds <-as.numeric(donnees_indus_ns$emploi_non_salarie_EE_ds)
donnees_constru_ns$emploi_non_salarie_EE_ds <-as.numeric(donnees_constru_ns$emploi_non_salarie_EE_ds)

table_emplois_non_salarie_g_s_ds<-rbind(donnees_agri_ns, donnees_indus_ns, donnees_constru_ns, donnees_marchand_ns, donnees_non_marchand_ns)

table_emplois_non_salarie_g_s_ds<-subset(table_emplois_non_salarie_g_s_ds, select=-c(date, trimestre, annee))
table_emplois_salarie_g_s_ds<-subset(table_emplois_salarie_g_s_ds, select=-c(date, trimestre, annee))
table_emplois_g_s_ds<-subset(table_emplois_g_s_ds, select=-c(date, trimestre, annee))

#4. table apprenti

table_apprenti_g_s <- table_apprenti_g_s %>%
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
head(table_apprenti_g_s)

# Charger le package seasonal
library(seasonal)

# Convertir les variables "annee" et "trimestre" en une seule variable de date
table_apprenti_g_s$date <- as.Date(paste(table_apprenti_g_s$annee, table_apprenti_g_s$trimestre * 3 - 2, "01", sep = "-"))

donnees_agri_ap<-table_apprenti_g_s[table_apprenti_g_s$Grand_secteur=="Agriculture",]
donnees_indus_ap<-table_apprenti_g_s[table_apprenti_g_s$Grand_secteur=="Industrie",]
donnees_constru_ap<-table_apprenti_g_s[table_apprenti_g_s$Grand_secteur=="Construction",]
donnees_marchand_ap<-table_apprenti_g_s[table_apprenti_g_s$Grand_secteur=="Tertiaire marchand",]
donnees_non_marchand_ap<-table_apprenti_g_s[table_apprenti_g_s$Grand_secteur=="Tertiaire non marchand",]

seasonally_adjusted_ap <- seas(ts(donnees_agri_ap$apprenti_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_agri_ap$apprenti_EE_ds <- seasonally_adjusted_ap$series$d11

seasonally_adjusted_1_ap <- seas(ts(donnees_indus_ap$apprenti_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_indus_ap$apprenti_EE_ds <- seasonally_adjusted_1_ap$series$d11

seasonally_adjusted_2_ap <- seas(ts(donnees_constru_ap$apprenti_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_constru_ap$apprenti_EE_ds <- seasonally_adjusted_2_ap$series$d11

seasonally_adjusted_3_ap <- seas(ts(donnees_marchand_ap$apprenti_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_marchand_ap$apprenti_EE_ds <- seasonally_adjusted_3_ap$series$d11

seasonally_adjusted_4_ap <- seas(ts(donnees_non_marchand_ap$apprenti_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
donnees_non_marchand_ap$apprenti_EE_ds <- seasonally_adjusted_4_ap$series$d11

donnees_non_marchand_ap$apprenti_EE_ds <-as.numeric(donnees_non_marchand_ap$apprenti_EE_ds)
donnees_marchand_ap$apprenti_EE_ds <-as.numeric(donnees_marchand_ap$apprenti_EE_ds)
donnees_agri_ap$apprenti_EE_ds <-as.numeric(donnees_agri_ap$apprenti_EE_ds)
donnees_indus_ap$apprenti_EE_ds <-as.numeric(donnees_indus_ap$apprenti_EE_ds)
donnees_constru_ap$apprenti_EE_ds <-as.numeric(donnees_constru_ap$apprenti_EE_ds)

table_apprenti_g_s_ds<-rbind(donnees_agri_ap, donnees_indus_ap, donnees_constru_ap, donnees_marchand_ap, donnees_non_marchand_ap)

table_apprenti_g_s_ds<-subset(table_apprenti_g_s_ds, select=-c(date, trimestre, annee))


#Desaisonnalisation hors secteur 

#1.apprentissage

table_apprenti_simplifiee <- table_apprenti_simplifiee %>%
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
head(table_apprenti_simplifiee)

# Charger le package seasonal
library(seasonal)

# Convertir les variables "annee" et "trimestre" en une seule variable de date
table_apprenti_simplifiee$date <- as.Date(paste(table_apprenti_simplifiee$annee, table_apprenti_simplifiee$trimestre * 3 - 2, "01", sep = "-"))
seasonally_adjusted_ap_s <- seas(ts(table_apprenti_simplifiee$apprenti_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
table_apprenti_simplifiee$apprenti_EE_ds <- seasonally_adjusted_ap_s$series$d11
table_apprenti_simplifiee$apprenti_EE_ds <-as.numeric(table_apprenti_simplifiee$apprenti_EE_ds)

#2.salarie

table_emplois_salarie_simplifiee <- table_emplois_salarie_simplifiee %>%
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
head(table_emplois_salarie_simplifiee)

# Charger le package seasonal
library(seasonal)

# Convertir les variables "annee" et "trimestre" en une seule variable de date
table_emplois_salarie_simplifiee$date <- as.Date(paste(table_emplois_salarie_simplifiee$annee, table_emplois_salarie_simplifiee$trimestre * 3 - 2, "01", sep = "-"))
seasonally_adjusted_salarie_s <- seas(ts(table_emplois_salarie_simplifiee$emploi_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
table_emplois_salarie_simplifiee$emploi_salarie_EE_ds <- seasonally_adjusted_salarie_s$series$d11
table_emplois_salarie_simplifiee$emploi_salarie_EE_ds <-as.numeric(table_emplois_salarie_simplifiee$emploi_salarie_EE_ds)

#3. non salarie

table_emplois_non_salarie_simplifiee <- table_emplois_non_salarie_simplifiee %>%
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
head(table_emplois_non_salarie_simplifiee)

# Charger le package seasonal
library(seasonal)

# Convertir les variables "annee" et "trimestre" en une seule variable de date
table_emplois_non_salarie_simplifiee$date <- as.Date(paste(table_emplois_non_salarie_simplifiee$annee, table_emplois_non_salarie_simplifiee$trimestre * 3 - 2, "01", sep = "-"))
seasonally_adjusted_non_salarie_s <- seas(ts(table_emplois_non_salarie_simplifiee$emploi_non_salarie_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
table_emplois_non_salarie_simplifiee$emploi_non_salarie_EE_ds <- seasonally_adjusted_non_salarie_s$series$d11
table_emplois_non_salarie_simplifiee$emploi_non_salarie_EE_ds <-as.numeric(table_emplois_non_salarie_simplifiee$emploi_non_salarie_EE_ds)

#4. non salarie

table_emplois_simplifiee <- table_emplois_simplifiee %>%
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
head(table_emplois_simplifiee)

# Charger le package seasonal
library(seasonal)

# Convertir les variables "annee" et "trimestre" en une seule variable de date
table_emplois_simplifiee$date <- as.Date(paste(table_emplois_simplifiee$annee, table_emplois_simplifiee$trimestre * 3 - 2, "01", sep = "-"))
seasonally_adjusted_total_s <- seas(ts(table_emplois_simplifiee$emploi_total_EE, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
table_emplois_simplifiee$emploi_total_EE_ds <- seasonally_adjusted_total_s$series$d11
table_emplois_simplifiee$emploi_total_EE_ds <-as.numeric(table_emplois_simplifiee$emploi_total_EE_ds)


#On retire les variables inutiles pour la table finale simplifee

table_emplois_simplifiee<-subset(table_emplois_simplifiee, select=-c(date, trimestre, annee))
table_emplois_non_salarie_simplifiee<-subset(table_emplois_non_salarie_simplifiee, select=-c(date, trimestre, annee))
table_emplois_salarie_simplifiee<-subset(table_emplois_salarie_simplifiee, select=-c(date, trimestre, annee))
table_apprenti_simplifiee<-subset(table_apprenti_simplifiee, select=-c(date, trimestre, annee))

