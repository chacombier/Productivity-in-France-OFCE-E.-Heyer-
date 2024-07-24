############### 06_jointures_base_finale ##############

#L'idée est de joindre les bases trouvées pour avoir une base finale sur laquelle faire marcher l'ECM
#La jointure se fait par la variable annee_trimestre 

table_finale<-inner_join(emploi_total_CN, emploi_salarie_CN, by=c("annee_trimestre", "Grand_secteur"))
table_finale<-inner_join(table_finale, emploi_non_salarie_CN, by=c("annee_trimestre", "Grand_secteur"))
table_finale<-inner_join(table_finale, table_emplois_non_salarie_g_s_ds, by=c("annee_trimestre", "Grand_secteur"))
table_finale<-inner_join(table_finale, table_emplois_salarie_g_s_ds, by=c("annee_trimestre", "Grand_secteur"))
table_finale<-inner_join(table_finale, table_emplois_g_s_ds, by=c("annee_trimestre", "Grand_secteur"))
table_finale<-inner_join(table_finale, table_apprenti_g_s_ds, by=c("annee_trimestre", "Grand_secteur"))

#Jointures non sectorisees

table_finale_simplifiee<-inner_join(emploi_salarie_CN_simplifie, emploi_total_CN_simplifie, by=c("annee_trimestre"))
table_finale_simplifiee<-inner_join(table_finale_simplifiee, emploi_non_salarie_CN_simplifie, by=c("annee_trimestre"))
table_finale_simplifiee<-inner_join(table_finale_simplifiee, table_apprenti_simplifiee, by=c("annee_trimestre"))
table_finale_simplifiee<-inner_join(table_finale_simplifiee, table_emplois_salarie_simplifiee, by=c("annee_trimestre"))
table_finale_simplifiee<-inner_join(table_finale_simplifiee, table_emplois_simplifiee, by=c("annee_trimestre"))
table_finale_simplifiee<-inner_join(table_finale_simplifiee, table_emplois_non_salarie_simplifiee, by=c("annee_trimestre"))
table_finale_simplifiee<-inner_join(table_finale_simplifiee, serie_trim_ap_dares, by=c("annee_trimestre"))

#Creation variable différentielle pour chaque variable d'interet

#Base 100 EE

table_finale_simplifiee$ecart_absolu_ap <- abs(100 - ((table_finale_simplifiee$apprentissage_dares_ds * 100) / table_finale_simplifiee$apprenti_EE_ds))
table_finale_simplifiee$ecart_absolu_emploi_tot <- abs(100 - ((table_finale_simplifiee$emploi_total_CN * 100) / table_finale_simplifiee$emploi_total_EE_ds))
table_finale_simplifiee$ecart_absolu_salarie <- abs(100 - ((table_finale_simplifiee$emploi_salarie_CN * 100) / table_finale_simplifiee$emploi_salarie_EE_ds))
table_finale_simplifiee$ecart_absolu_non_salarie <- abs(100 - ((table_finale_simplifiee$emploi_non_salarie_CN * 100) / table_finale_simplifiee$emploi_non_salarie_EE_ds))

table_finale$ecart_absolu_emploi_tot <- abs(100 - ((table_finale$emploi_total_CN * 100) / table_finale$emploi_total_EE_ds))
table_finale$ecart_absolu_salarie <- abs(100 - ((table_finale$emploi_salarie_CN * 100) / table_finale$emploi_salarie_EE_ds))
table_finale$ecart_absolu_non_salarie <- abs(100 - ((table_finale$emploi_non_salarie_CN * 100) / table_finale$emploi_non_salarie_EE_ds))

openxlsx::write.xlsx(table_finale, file  = "~/Desktop/OFCE/Output GS/table_finale.xlsx")
openxlsx::write.xlsx(table_finale_simplifiee, file  = "~/Desktop/OFCE/Output GS/table_finale_simplifiee.xlsx")

##Table finale ecm 

data_cn_2<-data_cn_2[data_cn_2$TITLE_FR2=="Total branches",]

data_cn_heures<-data_cn_2[data_cn_2$TITLE_FR1=="Durée de travail effective des salariés",]
data_cn_cout<-data_cn_2[data_cn_2$TITLE_FR1=="Rémunération salariale versée",]
data_cn_va_volume<-data_cn_2[data_cn_2$TITLE_FR1=="Valeur ajoutée des branches" & data_cn_2$TITLE_FR3=="Volume aux prix de l'année précédente chaînés" ,]
data_cn_va_valeur<-data_cn_2[data_cn_2$TITLE_FR1=="Valeur ajoutée des branches" & data_cn_2$TITLE_FR3=="Valeur aux prix courants",]

data_cn_heures_ag<-aggregate(OBS_VALUE ~ DATE, data_cn_heures, mean)
data_cn_cout_ag<-aggregate(OBS_VALUE ~ DATE, data_cn_cout, mean)
data_cn_va_volume_ag<-aggregate(OBS_VALUE ~ DATE, data_cn_va_volume, mean)
data_cn_va_valeur_ag<-aggregate(OBS_VALUE ~ DATE, data_cn_va_valeur, mean)

data_cn_heures_ag <- data_cn_heures_ag %>% 
  dplyr::rename("heures_travaillees"= "OBS_VALUE")

data_cn_cout_ag <- data_cn_cout_ag %>% 
  dplyr::rename("cout_salarial"= "OBS_VALUE")

data_cn_va_volume_ag <- data_cn_va_volume_ag %>% 
  dplyr::rename("va_volume"= "OBS_VALUE")

data_cn_va_valeur_ag <- data_cn_va_valeur_ag %>% 
  dplyr::rename("va_valeur"= "OBS_VALUE")

data_ecm<-inner_join(data_cn_heures_ag,data_cn_cout_ag,by="DATE")
data_ecm<-inner_join(data_ecm,data_cn_va_volume_ag,by="DATE")
data_ecm<-inner_join(data_ecm,data_cn_va_valeur_ag,by="DATE")

#Creation de la variable annee_trim

data_ecm <- data_ecm %>% 
  mutate(annee = as.numeric(substr(DATE,1,4))) %>% 
  mutate(trim = case_when(
    substr(DATE,6,7)=="01"~1,
    substr(DATE,6,7)=="04"~2,
    substr(DATE,6,7)=="07"~3,
    substr(DATE,6,7)=="10"~4
  ))

data_ecm$annee_trimestre <- paste(data_ecm$annee, "-T", data_ecm$trim, sep = "")

#retrecissement de la table EEC/CN déjà fusionnée pour l'ecm et fusion avec les données CN

table_ecm <- subset(table_finale_simplifiee, select= c(emploi_total_CN, emploi_salarie_CN, annee_trimestre, apprenti_EE, apprenti_EE_ds, emploi_total_EE, emploi_total_EE_ds, emploi_salarie_EE, emploi_salarie_EE_ds, apprentissage_dares_ds))
table_ecm<-inner_join(data_ecm,table_ecm,by="annee_trimestre")

#Creation de nouvelles variables 

table_ecm$emploi_total_strict<-table_ecm$emploi_total_CN/1000
table_ecm$emploi_salarie_strict<-table_ecm$emploi_salarie_CN/1000
table_ecm$prix_va<-table_ecm$va_valeur/table_ecm$va_volume
table_ecm$productivite_tete<-table_ecm$va_volume/table_ecm$emploi_total_strict
table_ecm$productivite_horaire<-table_ecm$va_volume/table_ecm$heures_travaillees
table_ecm$productivite_hor_ducoudre_1<-table_ecm$va_volume/(table_ecm$emploi_salarie_strict * table_ecm$heures_travaillees * 1000)
table_ecm$productivite_hor_ducoudre_2<-table_ecm$va_volume/(table_ecm$emploi_salarie_strict * table_ecm$heures_travaillees) * 1000


#On fusionne les tables pour l'ecm final 

# On ajoutte les tables complémentaires: taux d'absence, défaillances, créations d'entreprises 

#On importe les tables de défaillances et création d'entreprises + de taux d'absence 
#On y crée aussi des variables annee_trimestre

crea_entreprises <- read_excel("Desktop/OFCE/crea_entreprises.xlsx")
serie_defaillances_insee <- read_excel("Desktop/OFCE/serie_defaillances_insee.xlsx")
load("/Users/charlottecombier/Desktop/OFCE/ABS_trim.Rda")

absence_trim<-as.data.frame(absence_trim)

absence_trim <- absence_trim %>% 
  dplyr::rename("annee"= "Année")%>% 
  dplyr::rename("trimestre"= "Trimestre")

absence_trim$annee_trimestre <- paste(absence_trim$annee, "-T", absence_trim$trim, sep = "")

absence_trim<-subset(absence_trim, select=-c(annee, trimestre))

crea_entreprises<-as.data.frame(crea_entreprises)
serie_defaillances_insee<-as.data.frame(serie_defaillances_insee)

crea_entreprises$annee_trimestre <- paste(crea_entreprises$annee, "-T", crea_entreprises$trim, sep = "")

crea_entreprises<-subset(crea_entreprises, select=-c(annee, trimestre))


table_ecm<-inner_join(crea_entreprises,table_ecm,by="annee_trimestre")
table_ecm<-inner_join(serie_defaillances_insee,table_ecm,by="annee_trimestre")
table_ecm<-inner_join(absence_trim,table_ecm,by="annee_trimestre")

table_ecm$tx_abs_pt<-table_ecm$`Taux d'absence`*100

#On importe la série de kalman

#pt2_kalman <- read_excel("Desktop/OFCE/pt2_kalman.xls")
#pt2_kalman<-as.data.frame(pt2_kalman)
#setnames(pt2_kalman, c("annee_trimestre", "pt_2_kalman"))
#table_ecm<-inner_join(pt2_kalman,table_ecm,by="annee_trimestre")

kalman_eric <- read_excel("Desktop/OFCE/serie_kalman_eric.xlsx")

kalman_eric<-as.data.frame(kalman_eric)

# Ajuster un modèle de régression linéaire
# Ajuster un modèle de régression linéaire
modele <- lm(pt_eric ~ as.numeric(sub("-T.*", "", annee_trimestre)), data = kalman_eric)

# Prévoir les valeurs jusqu'en 2022-T4
annee_trimestre_prolongee <- c("2016-T1", "2016-T2", "2016-T3", "2016-T4", "2017-T1", "2017-T2", "2017-T3", "2017-T4", "2018-T1", "2018-T2", "2018-T3", "2018-T4", "2019-T1", "2019-T2", "2019-T3", "2019-T4", "2020-T1", "2020-T2", "2020-T3", "2020-T4", "2021-T1", "2021-T2", "2021-T3", "2021-T4", "2022-T1", "2022-T2", "2022-T3", "2022-T4")
valeurs_prolongees <- predict(modele, newdata = data.frame(annee_trimestre = as.numeric(sub("-T.*", "", annee_trimestre_prolongee))))

# Afficher les valeurs prolongées
print(valeurs_prolongees)
valeurs_prolongees<-as.data.frame(valeurs_prolongees)

annee_debut <- 2016
trimestre_debut <- 1
annee_fin <- 2022  # Ou l'année finale que vous souhaitez
trimestre_fin <- 4
trimestres <- expand.grid(annee = annee_debut:annee_fin, trimestre = trimestre_debut:trimestre_fin)


# Associer chaque valeur à un trimestre
valeurs_trimestres <- data.frame(annee_trimestre = paste(trimestres$annee, "-T", trimestres$trimestre, sep = ""), valeur = valeurs_prolongees)

#Renommer les colonnes

valeurs_trimestres <- valeurs_trimestres %>% 
  dplyr::rename("pt_eric"= "valeurs_prolongees")

kalman_eric<-rbind(kalman_eric, valeurs_trimestres)

table_ecm<-inner_join(kalman_eric,table_ecm,by="annee_trimestre")

#Ajout temps partiel

serie_temps_partiel <- read_excel("Desktop/OFCE/serie_temps_partiel.xlsx",sheet = "valeurs_trimestrielles")
serie_temps_partiel<-as.data.frame(serie_temps_partiel)
table_ecm<-inner_join(serie_temps_partiel,table_ecm,by="annee_trimestre")

#Ajout des contrats courts 

table_ecm<-inner_join(base_contrat_court,table_ecm,by="annee_trimestre")

#Ajout des données de trésorerie 

if (!require(dplyr)) install.packages("dplyr", dependencies = TRUE)
if (!require(zoo)) install.packages("zoo", dependencies = TRUE)
if (!require(seasonal)) install.packages("seasonal", dependencies = TRUE)

library(dplyr)
library(zoo)
library(seasonal)

Webstat_Export_20240627 <- read_delim("Downloads/Webstat_Export_20240627.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
data_bdf<-as.data.frame(Webstat_Export_20240627)

data_bdf<-data_bdf[data_bdf$`Titre :`!= "Code série :",]
data_bdf<-data_bdf[data_bdf$`Titre :`!= "Unité :",]
data_bdf<-data_bdf[data_bdf$`Titre :`!= "Magnitude :",]
data_bdf<-data_bdf[data_bdf$`Titre :`!= "Source :",]
data_bdf<-data_bdf[data_bdf$`Titre :`!= "Méthode d'observation :",]

data_bdf <- data_bdf %>% 
  dplyr::rename("date"= `Titre :`)%>% 
  dplyr::rename("tresorerie_smna"= "Services marchands, situation de la trésorerie en fin de mois (CVS)")%>%
  dplyr::rename("tresorerie_SNF_flux"= "Crédits de trésorerie accordés aux sociétés non financières résidentes, flux mensuels, CVS")%>%
  dplyr::rename("tresorerie_SNF_moving_average"= "Crédits de trésorerie des SNF (y compris autres crédits), variation de l'encours (moyenne mobile sur 3 mois)")%>%
  dplyr::rename("tresorerie_SNF_encours"= "Crédits de trésorerie accordés aux sociétés non financières résidentes, encours")

data_bdf<-subset(data_bdf, select = -c(`Trésorerie et dépôts`))

data_bdf$date <- as.Date(data_bdf$date, format = "%d/%m/%Y")

data_bdf <- data_bdf %>%
  mutate(trimestre = paste0(year(date), "-Q", quarter(date)))

# Calculer les moyennes trimestrielles
data_bdf$tresorerie_smna <- as.numeric(gsub(",", ".", data_bdf$tresorerie_smna))
data_bdf$tresorerie_SNF_encours <- as.numeric(gsub(",", ".", data_bdf$tresorerie_SNF_encours))
data_bdf$tresorerie_SNF_flux <- as.numeric(gsub(",", ".", data_bdf$tresorerie_SNF_flux))
data_bdf$tresorerie_SNF_moving_average <- as.numeric(gsub(",", ".", data_bdf$tresorerie_SNF_moving_average))


data_trimestrielle <- data_bdf %>%
  group_by(trimestre) %>%
  summarise(across(c(tresorerie_smna, tresorerie_SNF_encours, tresorerie_SNF_flux, tresorerie_SNF_moving_average),
                   ~ mean(., na.rm = TRUE)))

data_trimestrielle<-subset(data_trimestrielle, select = -c(tresorerie_smna, tresorerie_SNF_encours))

data_trimestrielle$trimestre <- gsub("Q", "T", data_trimestrielle$trimestre)

data_trimestrielle <- data_trimestrielle %>% 
  dplyr::rename("annee_trimestre"= "trimestre")

table_ecm<-inner_join(data_trimestrielle,table_ecm,by="annee_trimestre")

#Ajout des tensions de recrutement

serie_tensions_recrutement <- read_excel("Desktop/OFCE/serie_tensions_recrutement.xlsx")
serie_tensions_recrutement<-as.data.frame(serie_tensions_recrutement)

serie_tensions_recrutement <- serie_tensions_recrutement %>% 
  dplyr::rename("annee_trimestre"= "date")

serie_tensions_recrutement$tensions_recrutement<-as.numeric(serie_tensions_recrutement$tensions_recrutement)

table_ecm<-inner_join(serie_tensions_recrutement,table_ecm,by="annee_trimestre")

#Ajout des démissions 

demissions <- read_excel("Downloads/demissions.xls")
demissions<-as.data.frame(demissions)
demissions<-subset(demissions, select = -c(...1, FALSE...4))
demissions <- demissions %>% 
  dplyr::rename("annee_trimestre"= "Date")%>% 
  dplyr::rename("nombre_demissions"= "FALSE...3")
convert_to_numeric <- function(char_vector) {
  char_vector <- gsub(" ", "", char_vector)
  numeric_vector <- as.numeric(char_vector)
  return(numeric_vector)
}
demissions$nombre_demissions <- convert_to_numeric(demissions$nombre_demissions)

table_ecm<-inner_join(demissions,table_ecm,by="annee_trimestre")

#Ajout mouvements de main d'oeuvre

mmo <- read_excel("Downloads/mmo.xls")
mmo<-subset(mmo, select = -c(...1))
mmo <- mmo %>% 
  dplyr::rename("annee_trimestre"= "Date")%>% 
  dplyr::rename("mmo"= "FALSE")
convert_to_numeric <- function(char_vector) {
  char_vector <- gsub(" ", "", char_vector)
  numeric_vector <- as.numeric(char_vector)
  return(numeric_vector)
}
mmo$mmo <- convert_to_numeric(mmo$mmo)
table_ecm<-inner_join(mmo,table_ecm,by="annee_trimestre")


#Ajout de l'EBE et calcul du taux de marge et calcul des variations de taux de marge

table_ecm<-inner_join(ebe,table_ecm,by="annee_trimestre")

table_ecm$taux_marge<-table_ecm$ebe/table_ecm$va_valeur

table_smna$num<-1:length(table_smna$annee_trimestre)
table_ecm$num<-1:length(table_ecm$annee_trimestre)

for(i in 1:length(table_smna$num)) 
  table_smna$taux_pt[i] <- (table_smna$productivite_tete[i]-table_smna$productivite_tete[i-1])/table_smna$productivite_tete[i-1]

for(i in 1:length(table_smna$num)) 
  table_smna$taux_pt_EEC[i] <- (table_smna$productivite_tete_EEC[i]-table_smna$productivite_tete_EEC[i-1])/table_smna$productivite_tete_EEC[i-1]

for(i in 1:length(table_smna$num)) 
  table_smna$taux_ph[i] <- (table_smna$productivite_horaire[i]-table_smna$productivite_horaire[i-1])/table_smna$productivite_horaire[i-1]

table_ecm$taux_pt<-NA
table_ecm$taux_ph<-NA
table_ecm$croissance_taux_marge<-NA

for(i in 2:length(table_ecm$num)) 
  table_ecm$taux_pt[i] <- (table_ecm$productivite_tete[i]-table_ecm$productivite_tete[i-1])/table_ecm$productivite_tete[i-1]

for(i in 2:length(table_ecm$num)) 
  table_ecm$taux_ph[i] <- (table_ecm$productivite_horaire[i]-table_ecm$productivite_horaire[i-1])/table_ecm$productivite_horaire[i-1]

for(i in 2:length(table_ecm$num)) 
  table_ecm$croissance_taux_marge[i] <- (table_ecm$taux_marge[i]-table_ecm$taux_marge[i-1])/table_ecm$taux_marge[i-1]


openxlsx::write.xlsx(table_smna, file  = "~/Desktop/OFCE/Output GS/table_smna.xlsx")  

#Exportation de l'ECM final

openxlsx::write.xlsx(table_ecm, file  = "~/Desktop/OFCE/Output GS/table_ecm.xlsx")
