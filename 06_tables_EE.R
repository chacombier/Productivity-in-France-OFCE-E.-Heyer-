######### Calcul de tables à partir des données Enquete Emploi ############

#Rename des modalités de grands secteurs

donnees_emploi$annee_trimestre <- paste(donnees_emploi$annee, "-T", donnees_emploi$trimestre, sep = "")
#donnees_apprenti$annee_trimestre <- paste(donnees_apprenti$annee, "-T", donnees_apprenti$trimestre, sep = "")

######I. Analyse simple et par A17 ##########

# table_emplois <- aggregate(pond ~ annee_trimestre + A17, donnees_emploi, sum)
table_emplois_simplifiee <- aggregate(pond ~ annee_trimestre, donnees_emploi, sum)

#Tables emploi total EE

# openxlsx::write.xlsx(table_emplois, file  = "~/Desktop/OFCE/table_emplois.xlsx")
openxlsx::write.xlsx(table_emplois_simplifiee, file  = "~/Desktop/OFCE/Output GS/table_emplois_simplifiee.xlsx")

#Emploi salarie par trimestre par branche

donnees_salarie<-donnees_emploi[donnees_emploi$employe==2,]

# table_emplois_salarie <- aggregate(pond ~ annee_trimestre + A17, donnees_salarie, sum)
table_emplois_salarie_simplifiee <- aggregate(pond ~ annee_trimestre, donnees_salarie, sum)


# openxlsx::write.xlsx(table_emplois_salarie, file  = "~/Desktop/OFCE/table_emplois_salarie.xlsx")
openxlsx::write.xlsx(table_emplois_salarie_simplifiee, file  = "~/Desktop/OFCE/table_emplois_salarie_simplifiee.xlsx")

#resultat_2 <- donnees_non_salarie %>%
#group_by(annee, trimestre, A17) %>%
#summarise(SommePoids = sum(pond[statut_bit == 1], na.rm = TRUE))



#Emploi non salarie par trimestre par branche


donnees_non_salarie<-donnees_emploi[donnees_emploi$employe==1,]
# table_emplois_non_salarie <- aggregate(pond ~ annee_trimestre + A17, donnees_non_salarie, sum)
table_emplois_non_salarie_simplifiee <- aggregate(pond ~ annee_trimestre, donnees_non_salarie, sum)

# openxlsx::write.xlsx(table_emplois_salarie, file  = "~/Desktop/OFCE/table_emplois_non_salarie.xlsx")
openxlsx::write.xlsx(table_emplois_non_salarie_simplifiee, file  = "~/Desktop/OFCE/table_emplois_non_salarie_simplifiee.xlsx")


#resultat_3 <- donnees_salarie %>%
#group_by(annee, trimestre, A17) %>%
#summarise(SommePoids = sum(pond[statut_bit == 1], na.rm = TRUE))

#Apprenti par trimestre par branche
donnees_apprenti<-concat_1_2_3_4[concat_1_2_3_4$apprenti==1,]
donnees_apprenti$annee_trimestre <- paste(donnees_apprenti$annee, "-T", donnees_apprenti$trimestre, sep = "")
# table_apprenti_branche_trimestre <- aggregate(pond ~ annee_trimestre + A17, donnees_apprenti, sum)
table_apprenti_simplifiee <- aggregate(pond ~ annee_trimestre , donnees_apprenti, sum)
# openxlsx::write.xlsx(table_apprenti_branche_trimestre, file  = "~/Desktop/OFCE/table_apprenti_branche_trimestre.xlsx")
openxlsx::write.xlsx(table_apprenti_simplifiee, file  = "~/Desktop/OFCE/table_apprenti_simplifiee.xlsx")


table_emplois_simplifiee <- table_emplois_simplifiee %>% 
  dplyr::rename("emploi_total_EE" = "pond")

table_emplois_salarie_simplifiee <- table_emplois_salarie_simplifiee %>% 
  dplyr::rename("emploi_salarie_EE" = "pond")

table_emplois_non_salarie_simplifiee <- table_emplois_non_salarie_simplifiee %>% 
  dplyr::rename("emploi_non_salarie_EE" = "pond")

table_apprenti_simplifiee <- table_apprenti_simplifiee %>% 
  dplyr::rename("apprenti_EE" = "pond")

#resultat_4 <- donnees_totale_bit %>%
#group_by(annee, trimestre, A17) %>%
#summarise(SommePoids = sum(pond[apprenti == 1], na.rm = TRUE))
#Apprenti par trimestre

#resultat_5 <- donnees_totale_bit %>%
#group_by(annee, trimestre) %>%
#summarise(SommePoids = sum(pond[apprenti == 1], na.rm = TRUE))


#rm(donnees_concat_1, donnees_concat_2, donnees_concat_3, donnees_concat_4)
#rm (concat_1_2, concat_1_2_3, concat_1_2_3_4, donnees_emploi, donnees_non_salarie, donnees_salarie, donnees_totale_bit, donnees_apprenti)

#test<-as.data.frame(concat_1_2_3_4)
#grand_sec<-read_excel("~/Desktop/OFCE/passage_secteurs_A17.xlsx")
#test<-right_join(grand_sec, test, by="A17")

######II. Analyse par grands secteurs ##########

table_emplois_g_s <- aggregate(pond ~ annee_trimestre + Grand_secteur, donnees_emploi, sum)
table_emplois_salarie_g_s <- aggregate(pond ~ annee_trimestre + Grand_secteur, donnees_salarie, sum)
table_emplois_non_salarie_g_s <- aggregate(pond ~ annee_trimestre + Grand_secteur, donnees_non_salarie, sum)
table_apprenti_g_s <- aggregate(pond ~ annee_trimestre + Grand_secteur, donnees_apprenti, sum)

#Nettoyage des noms de variables des tables en vue de l'appariement dans les script 06

table_emplois_g_s <- table_emplois_g_s %>% 
  dplyr::rename("emploi_total_EE" = "pond")

table_emplois_salarie_g_s <- table_emplois_salarie_g_s %>% 
  dplyr::rename("emploi_salarie_EE" = "pond")

table_emplois_non_salarie_g_s <- table_emplois_non_salarie_g_s %>% 
  dplyr::rename("emploi_non_salarie_EE" = "pond")

table_apprenti_g_s <- table_apprenti_g_s %>% 
  dplyr::rename("apprenti_EE" = "pond")

openxlsx::write.xlsx(table_emplois_g_s, file  = "~/Desktop/OFCE/table_emplois_g_s.xlsx")
openxlsx::write.xlsx(table_emplois_salarie_g_s, file  = "~/Desktop/OFCE/table_emplois_salarie_g_s.xlsx")
openxlsx::write.xlsx(table_emplois_non_salarie_g_s, file  = "~/Desktop/OFCE/table_emplois_non_salarie_g_s.xlsx")
openxlsx::write.xlsx(table_apprenti_g_s, file  = "~/Desktop/OFCE/table_apprenti_g_s.xlsx")

#Etude des NA par grands secteurs


table_EEC_SMNA<-table_emplois_salarie_g_s[table_emplois_salarie_g_s$Grand_secteur=="Industrie"  | table_emplois_salarie_g_s$Grand_secteur=="Construction" | table_emplois_salarie_g_s$Grand_secteur=="Tertiaire marchand", ]
table_EEC_SMNA_sum<- aggregate(emploi_salarie_EE ~ annee_trimestre , table_EEC_SMNA, sum)

table_smna<-inner_join(table_EEC_SMNA_sum, table_smna, by="annee_trimestre")

table_smna$emploi_salarie_EE_redresse<-table_smna$emploi_salarie_EE*1.1162837

table_smna$productivite_tete_EEC<-table_smna$va_volume/table_smna$emploi_salarie_EE_redresse


#calcul du taux de contrats courts 

#on retire les NA et on cree 2 bases: 1 des salaries avec info sur le contrat et une des salaries avec contrat court
donnees_salarie_contrat_court <- donnees_salarie[!is.na(donnees_salarie$contrat_court), ]
ag_sal_cc<-aggregate(pond ~ annee_trimestre, donnees_salarie_contrat_court, sum)
#on reduire ses bases par annee_trimestre
data_sal_contrat_court <- donnees_salarie_contrat_court[donnees_salarie_contrat_court$contrat_court==1, ]
ag_sal_avec_cc<-aggregate(pond ~ annee_trimestre,data_sal_contrat_court, sum)
#on change le nom des variables

ag_sal_cc <- ag_sal_cc %>% 
  dplyr::rename("salarie" = "pond")

ag_sal_avec_cc <- ag_sal_avec_cc %>% 
  dplyr::rename("salarie_contrat_court" = "pond")

#on joint ces deux bases agrégés et on calcule par numérateur/dénominateur la part de contrats courts

base_contrat_court<-inner_join(ag_sal_avec_cc, ag_sal_cc, by="annee_trimestre")
base_contrat_court$part_contrats_courts<-base_contrat_court$salarie_contrat_court/base_contrat_court$salarie
base_contrat_court$part_contrats_courts<-base_contrat_court$part_contrats_courts*100
#on reduit la base au taux
base_contrat_court<-subset(base_contrat_court, select=c(annee_trimestre,part_contrats_courts ))


table_smna$num<-1:length(table_smna$annee_trimestre)

for(i in 1:length(table_smna$num)) 
  table_smna$tx_pt_cr_CN[i] <- (table_smna$productivite_tete[i]-table_smna$productivite_tete[i-1])/table_smna$productivite_tete[i-1]

for(i in 1:length(table_smna$num)) 
  table_smna$tx_pt_cr_CN[i] <- (table_smna$productivite_tete_EEC[i]-table_smna$productivite_tete_EEC[i-1])/table_smna$productivite_tete_EEC[i-1]


openxlsx::write.xlsx(table_smna, file  = "~/Desktop/OFCE/Output GS/table_totale_smna.xlsx")
