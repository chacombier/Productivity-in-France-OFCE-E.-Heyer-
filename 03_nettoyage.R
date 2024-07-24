#03_Nettoyage données

#Rename des variables pour pouvoir concaténer les 4 vagues 

setnames(donnees_concat_1,c("annee", "trimestre", "ident", "region", "age", "sec", "statut_bit", "employe", "statut_enrichi", "pond", "jours_abs_maladie", "indic_abs_maladie_ref", "une_h_trav", "emploi_sans_trav", "annee_etude_der", "nb_h_ref", "raison_abs", "duree_abs", "cadre", "temps_plein_partiel", "type_temps_partiel", "contrat"))
setnames(donnees_concat_2,c("annee", "trimestre", "ident", "region", "age", "sec", "statut_bit", "employe", "statut_enrichi", "pond", "jours_abs_maladie", "indic_abs_maladie_ref", "une_h_trav", "emploi_sans_trav", "annee_etude_der", "nb_h_ref", "raison_abs", "duree_abs", "cadre", "temps_plein_partiel", "type_temps_partiel", "contrat"))
setnames(donnees_concat_3,c("annee", "trimestre", "ident", "region", "age", "sec", "statut_bit", "employe", "statut_enrichi", "pond", "jours_abs_maladie", "indic_abs_maladie_ref", "une_h_trav", "emploi_sans_trav", "annee_etude_der", "nb_h_ref", "raison_abs", "duree_abs", "cadre", "temps_plein_partiel", "type_temps_partiel", "contrat"))
setnames(donnees_concat_4,c("annee", "trimestre", "ident", "region", "age", "sec", "statut_bit", "employe", "apprenti_brut","statut_enrichi", "pond", "jours_abs_maladie", "une_h_trav","emploi_sans_trav", "annee_etude_der", "nb_h_ref","raison_abs", "cadre", "temps_plein_partiel", "type_temps_partiel", "contrat"))


#Completer en fonction de la variable intensité d'absence 

#Creation variable quotité

#pour 2003
# 
# donnees_concat_1$quotite<-0
# donnees_concat_1$quotite[donnees_concat_1$temps_plein_partiel==1 & donnees_concat_1$annee==2003]<-1
# donnees_concat_1$quotite[ donnees_concat_1$type_temps_partiel==1 & donnees_concat_1$annee==2003]<-0.5
# donnees_concat_1$quotite[ donnees_concat_1$temps_plein_partiel==2 & donnees_concat_1$annee==2003]<-0.8
# donnees_concat_1$quotite[donnees_concat_1$quotite==0 ]<-NA
# 
# #Pour les autres années
# 
# donnees_concat_1$quotite[donnees_concat_1$temps_plein_partiel==1 & donnees_concat_1$annee!=2003]<-1
# donnees_concat_1$quotite[ donnees_concat_1$type_temps_partiel==1 & donnees_concat_1$annee!=2003]<-0.25
# donnees_concat_1$quotite[ donnees_concat_1$temps_plein_partiel==2 & donnees_concat_1$annee!=2003]<-0.5
# donnees_concat_1$quotite[ donnees_concat_1$temps_plein_partiel==3 & donnees_concat_1$annee!=2003]<-0.65
# donnees_concat_1$quotite[ donnees_concat_1$temps_plein_partiel==4 & donnees_concat_1$annee!=2003]<-0.8
# donnees_concat_1$quotite[ donnees_concat_1$temps_plein_partiel==5 & donnees_concat_1$annee!=2003]<-0.9


# donnees_concat_2$quotite<-0
# donnees_concat_2$quotite[donnees_concat_2$temps_plein_partiel==1 ]<-1
# donnees_concat_2$quotite[ donnees_concat_2$type_temps_partiel==1 ]<-0.25
# donnees_concat_2$quotite[ donnees_concat_2$temps_plein_partiel==2]<-0.5
# donnees_concat_2$quotite[ donnees_concat_2$temps_plein_partiel==3]<-0.65
# donnees_concat_2$quotite[ donnees_concat_2$temps_plein_partiel==4]<-0.8
# donnees_concat_2$quotite[ donnees_concat_2$temps_plein_partiel==5]<-0.9
# donnees_concat_2$quotite[donnees_concat_2$quotite==0 ]<-NA

# donnees_concat_3$quotite<-0
# donnees_concat_3$quotite[donnees_concat_3$temps_plein_partiel==1]<-1
# donnees_concat_3$quotite[ donnees_concat_3$type_temps_partiel==1]<-0.25
# donnees_concat_3$quotite[ donnees_concat_3$temps_plein_partiel==2 ]<-0.5
# donnees_concat_3$quotite[ donnees_concat_3$temps_plein_partiel==3 ]<-0.65
# donnees_concat_3$quotite[ donnees_concat_3$temps_plein_partiel==4]<-0.8
# donnees_concat_3$quotite[ donnees_concat_3$temps_plein_partiel==5]<-0.9
# donnees_concat_3$quotite[donnees_concat_3$quotite==0]<-NA
# 
# donnees_concat_4$quotite<-0
# donnees_concat_4$quotite[donnees_concat_4$temps_plein_partiel==1 ]<-1
# donnees_concat_4$quotite[ donnees_concat_4$type_temps_partiel==1 ]<-0.25
# donnees_concat_4$quotite[ donnees_concat_4$temps_plein_partiel==2]<-0.5
# donnees_concat_4$quotite[ donnees_concat_4$temps_plein_partiel==3 ]<-0.65
# donnees_concat_4$quotite[ donnees_concat_4$temps_plein_partiel==4]<-0.8
# donnees_concat_4$quotite[ donnees_concat_4$temps_plein_partiel==5 ]<-0.9
# donnees_concat_4$quotite[donnees_concat_4$quotite==0]<-NA
# 
# #Creation de la variable nombre de jours d'absences
# 
# #On regarde déjà avec la fonction table les valeurs pour chaque vagues (concat de 1 à 4)
# 
# table(donnees_concat_1$jours_abs_maladie)
# table(donnees_concat_2$jours_abs_maladie)
# table(donnees_concat_3$jours_abs_maladie)
# table(donnees_concat_4$jours_abs_maladie)
# 
# #Recodage en jours pour les vagues 1 et 2 exprimées soit en jours soit en heure et parfois avec bruit (ex 90J)
# 
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="10H"]<-1.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="10J"]<-7
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="11H"]<-1.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="12H"]<-1.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="13H"]<-2
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="14H"]<-2
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="15H"]<-2
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="15J"]<-7
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="16H"]<-2
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="17H"]<-2.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="18H"]<-2.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="19H"]<-3
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="1H"]<-0
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="1J"]<-1
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="20H"]<-3
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="20J"]<-7
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="21H"]<-3
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="22H"]<-3
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="23H"]<-3
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="24H"]<-3.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="25H"]<-3.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="26H"]<-4
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="27H"]<-4
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="28H"]<-4
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="29H"]<-4
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="2H"]<-0.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="2J"]<-2
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="30H"]<-4.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="31H"]<-4.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="32H"]<-4.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="33H"]<-4.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="34H"]<-5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="35H"]<-5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="36H"]<-5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="37H"]<-5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="38H"]<-5.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="39H"]<-5.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="3H"]<-0.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="3J"]<-3
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="40H"]<-5.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="42H"]<-6
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="44H"]<-6
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="45H"]<-6.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="48H"]<-7
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="4H"]<-0.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="4J"]<-4
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="50H"]<-7
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="55H"]<-7
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="5H"]<-0.5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="5J"]<-5
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="60H"]<-7
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="60J"]<-7
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="6H"]<-1
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="6J"]<-6
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="7H"]<-1
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="7J"]<-7
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="90J"]<-7
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="9H"]<-1
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="9J"]<-7
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="8H"]<-1
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$jours_abs_maladie=="8J"]<-7
# 
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="10H"]<-1.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="10J"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="11H"]<-1.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="12H"]<-1.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="13H"]<-2
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="14H"]<-2
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="15H"]<-2
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="15J"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="16H"]<-2
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="17H"]<-2.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="18H"]<-2.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="19H"]<-3
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="1H"]<-0
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="1J"]<-1
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="20H"]<-3
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="20J"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="21H"]<-3
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="22H"]<-3
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="23H"]<-3
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="24H"]<-3.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="25H"]<-3.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="26H"]<-4
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="27H"]<-4
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="28H"]<-4
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="29H"]<-4
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="2H"]<-0.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="2J"]<-2
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="30H"]<-4.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="31H"]<-4.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="32H"]<-4.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="33H"]<-4.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="34H"]<-5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="35H"]<-5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="36H"]<-5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="37H"]<-5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="38H"]<-5.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="39H"]<-5.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="3H"]<-0.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="3J"]<-3
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="40H"]<-5.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="42H"]<-6
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="44H"]<-6
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="45H"]<-6.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="48H"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="4H"]<-0.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="4J"]<-4
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="50H"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="55H"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="5H"]<-0.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="5J"]<-5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="60H"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="60J"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="6H"]<-1
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="6J"]<-6
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="7H"]<-1
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="7J"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="90J"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="9H"]<-1
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="9J"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="8H"]<-1
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="8J"]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="46H"]<-6.5
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$jours_abs_maladie=="54H"]<-7
# 
# #Intégration des gens absents toute la semaine de référence (7J) pour raison maladie alors qu'ils ont un emploi
# 
# donnees_concat_1$jours_abs_maladie[donnees_concat_1$"emploi_sans_trav"==1 & donnees_concat_1$raison_abs==2]<-7
# donnees_concat_2$jours_abs_maladie[donnees_concat_2$"emploi_sans_trav"==1 & donnees_concat_2$raison_abs==2]<-7
# donnees_concat_3$jours_abs_maladie[donnees_concat_3$"emploi_sans_trav"==1 & donnees_concat_3$raison_abs==2]<-7
# 
# table(donnees_concat_1$jours_abs_maladie)
# table(donnees_concat_2$jours_abs_maladie)
# table(donnees_concat_3$jours_abs_maladie)
# table(donnees_concat_4$jours_abs_maladie)

#Creation d'un indic apprenti

donnees_concat_1$apprenti<-0
donnees_concat_1$apprenti[donnees_concat_1$statut_enrichi==22]<-1

donnees_concat_2$apprenti<-0
donnees_concat_2$apprenti[donnees_concat_2$statut_enrichi==22]<-1

donnees_concat_3$apprenti<-0
donnees_concat_3$apprenti[donnees_concat_3$statut_enrichi==3]<-1

donnees_concat_4$apprenti<-0
donnees_concat_4$apprenti[donnees_concat_4$apprenti_brut==1]<-1

donnees_concat_4$indic_abs_maladie_ref<-0
donnees_concat_4$indic_abs_maladie_ref[donnees_concat_4$jours_abs_maladie>0]<-1

#creation d'une indic contrat court

donnees_concat_4$contrat_court<-1
donnees_concat_4$contrat_court[donnees_concat_4$contrat==99 | donnees_concat_4$contrat==10  |donnees_concat_4$contrat==80]<-0

donnees_concat_4 <- donnees_concat_4 %>%
  mutate(contrat_court = ifelse(is.na(contrat), NA, contrat_court))

donnees_concat_1$contrat_court<-0
donnees_concat_1$contrat_court[donnees_concat_1$contrat==2 | donnees_concat_1$contrat==3  |donnees_concat_1$contrat==4]<-1
donnees_concat_1$contrat_court[donnees_concat_1$contrat==NA]<-NA
donnees_concat_1 <- donnees_concat_1 %>%
  mutate(contrat_court = ifelse(is.na(contrat), NA, contrat_court))


donnees_concat_2$contrat_court<-0
donnees_concat_2$contrat_court[donnees_concat_2$contrat==2 | donnees_concat_2$contrat==3  |donnees_concat_2$contrat==4]<-1
donnees_concat_2$contrat_court[donnees_concat_2$contrat==NA]<-NA
donnees_concat_2 <- donnees_concat_2 %>%
  mutate(contrat_court = ifelse(is.na(contrat), NA, contrat_court))


donnees_concat_3$contrat_court<-0
donnees_concat_3$contrat_court[donnees_concat_3$contrat==2 | donnees_concat_3$contrat==3  |donnees_concat_3$contrat==4]<-1
donnees_concat_3$contrat_court[donnees_concat_3$contrat==NA]<-NA
donnees_concat_3 <- donnees_concat_3 %>%
  mutate(contrat_court = ifelse(is.na(contrat), NA, contrat_court))



#Harmonisation des NAF par révision (1/2) et passage par branche (A17)

classificationNAF1 <- read_excel("~/Desktop/OFCE/Productivite/EEC/classificationNAF.xlsx", sheet = "Rev1Naf")
classificationNAF2 <- read_excel("~/Desktop/OFCE/Productivite/EEC/classificationNAF.xlsx", sheet = "Rev2Naf")
setnames(classificationNAF1,c("sec", "A17", "Minimal"))
setnames(classificationNAF2,c("sec", "A17", "Minimal"))
grand_sec<-read_excel("~/Desktop/OFCE/passage_secteurs_A17.xlsx")

donnees_concat_1<-right_join(classificationNAF1, donnees_concat_1, by="sec")
donnees_concat_2<-right_join(classificationNAF2, donnees_concat_2, by="sec")
donnees_concat_3<-right_join(classificationNAF2, donnees_concat_3, by="sec")
donnees_concat_4<-right_join(classificationNAF2, donnees_concat_4, by="sec")

donnees_concat_1<-subset(donnees_concat_1, select= -c( Minimal))
donnees_concat_2<-subset(donnees_concat_2, select= -c(Minimal))
donnees_concat_3<-subset(donnees_concat_3, select= -c(Minimal))
donnees_concat_4<-subset(donnees_concat_4, select= -c(Minimal,apprenti_brut))

#Assemblage de toutes les bases 

concat_1_2<-rbind(donnees_concat_1, donnees_concat_2)
concat_1_2_3<-rbind(concat_1_2, donnees_concat_3)
#concat_1_2_3<-subset(concat_1_2_3, select= -c(indic_abs_maladie_ref))
concat_1_2_3<-subset(concat_1_2_3, select= -c(duree_abs)) # a potentiellement retirer 
concat_1_2_3$indic_abs_maladie_ref[concat_1_2_3$indic_abs_maladie_ref==2]<-0
concat_1_2_3_4<-rbind(concat_1_2_3, donnees_concat_4)

concat_1_2_3_4<-as.data.frame(concat_1_2_3_4)

concat_1_2_3_4$trimestre<-as.numeric(concat_1_2_3_4$trimestre)
concat_1_2_3_4$annee<-as.numeric(concat_1_2_3_4$annee)
concat_1_2_3_4$jours_abs_maladie<-as.numeric(concat_1_2_3_4$jours_abs_maladie)

summary(concat_1_2_3_4$annee)
summary(concat_1_2_3_4$trimestre)
summary(concat_1_2_3_4$jours_abs_maladie)

concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "AZ"] <- "Agriculture"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "FZ"] <- "Construction"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "HZ"] <- "Transports"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "IZ"] <- "Hébergement et restauration"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "GZ"] <- "Commerce"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "JZ"] <- "Information et communication"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "KZ"] <- "Services financiers"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "LZ"] <- "Services immobiliers"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "RU"] <- "Services aux ménages"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "OQ"] <- "Services non marchands"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "MN"] <- "Services aux entreprises"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "DE"] <- "Energie, eau, déchets"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "C1"] <- "Industrie agro alimentaire"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "C2"] <- "Cokéfaction, rafinage"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "C3"] <- "Biens d'équipement"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "C4"] <- "Matériels de transport"
concat_1_2_3_4$A17[concat_1_2_3_4$A17 == "C5"] <- "Autres branches industrielles"

#Travail sur les absences par grandes vagues de refonte : Creation d'un taux d'absence en "intensité" 

#concat_1_2_3_4$intensite_abs<-(concat_1_2_3_4$jours_abs_maladie/7)*100
#summary(concat_1_2_3_4$intensite_abs)
  

#Il faut garder pour grands secteurs : grosses interrogations

#agriculture
#industrie
#construction
#somme de commerce, info com, financières, services immos,  services ménages, service entreprises
# non marchands 
#suprr: cokéfaction, industrie agro, energie eau déchets, autres branches indus, biens d'équipement, biens manufs 

# Affichage des données concaténées
#print(concat_1_2_3_4)

#Creation d'une variable paste annee-trimestre

#concat_1_2_3_4$annee_trimestre <- paste(concat_1_2_3_4$annee, "-T", concat_1_2_3_4$trimestre, sep = "")

#Création d'une variable d'expérience/"usé" de la vie au travail

concat_1_2_3_4$annee_etude_der<-as.numeric(concat_1_2_3_4$annee_etude_der)
concat_1_2_3_4$annee<-as.numeric(concat_1_2_3_4$annee)
concat_1_2_3_4$fatigue<-concat_1_2_3_4$annee - concat_1_2_3_4$annee_etude_der 
concat_1_2_3_4$fatigue[concat_1_2_3_4$fatigue<0]<-NA

#concat_1_2_3_4$taux_absence<-(concat_1_2_3_4$jours_abs_maladie/7)*100
#summary(concat_1_2_3_4$taux_absence)

summary(concat_1_2_3_4$statut_bit)

#Concaténation pour avoir les grands secteurs 

concat_1_2_3_4<-right_join(grand_sec,concat_1_2_3_4, by="A17")

#On reduit la pop à la pop bit 15/64 ans 

#donnees_totale_bit<-concat_1_2_3_4[concat_1_2_3_4$age<65,]
#donnees_totale_bit

#On cree une base salarie, une base non salarie et une base emploi

concat_1_2_3_4$statut_bit<-as.numeric(concat_1_2_3_4$statut_bit)
donnees_emploi<-concat_1_2_3_4[concat_1_2_3_4$statut_bit==1,]

donnees_salarie<-donnees_emploi[donnees_emploi$employe==2,]
donnees_non_salarie<-donnees_emploi[donnees_emploi$employe==1,]




#Table taux d'absence

#Création d'un taux d'absence (à partir d'une indicatrice)

#numérateur

#On crée une base spécifique pour étudier le taux d'absence

#base_abs<-as.data.frame(concat_1_2_3_4)
#summary(base_abs$indic_abs_maladie_ref)


#On crée une variable absence réelle qui est l'indicatrice d'absence multipliée par le poids individuel
#base_abs$indic_abs_mal<-0
#base_abs$indic_abs_mal[base_abs$emploi_sans_trav==1 & base_abs$raison_abs==2]<-1
#base_abs$indic_abs_mal[base_abs$une_h_trav==1 & base_abs$indic_abs_maladie_ref==1]<-1
#base_abs$abs_reel<-(base_abs$pond)*(base_abs$indic_abs_mal)


#=>cette variable n'a pas de valeur manquante

#On crée ensuite deux sous tables correspondant au numérateur et dénominateur du taux d'absence

#base_abs_emploi<-base_abs[base_abs$emploi_sans_trav==1| base_abs$une_h_trav==1  ,]
#ag_pond<-aggregate(pond ~ annee_trimestre, base_abs_emploi, sum)
#ag_pond_abs<-aggregate(abs_reel ~ annee_trimestre, base_abs, sum)

#On les réunit
#base_taux_absence<-inner_join(ag_pond, ag_pond_abs, by="annee_trimestre")

#On crée enfin le taux d'absence

#base_taux_absence$pt_abs<-(base_taux_absence$abs_reel/base_taux_absence$pond)*100

#Base intensité 

#base_intensite<-concat_1_2_3_4[concat_1_2_3_4$une_h_trav==1 & concat_1_2_3_4$indic_abs_maladie_ref==1 | concat_1_2_3_4$emploi_sans_trav==1 & concat_1_2_3_4$raison_abs==2,]


#Table fatigue

#base_fatigue<-data_frame(donnees_emploi)
#base_fatigue$fatigue_reel<-(base_fatigue$pond)*(base_fatigue$fatigue)
#ag_fatigue<-aggregate(fatigue_reel ~ annee_trimestre, base_fatigue, sum)
#ag_pond_fatigue<-aggregate(pond ~ annee_trimestre, base_fatigue, sum)
#base_moyenne_fatigue<-inner_join(ag_fatigue, ag_pond_fatigue, by="annee_trimestre")
#base_moyenne_fatigue$indic_fatigue<-(base_moyenne_fatigue$fatigue_reel/base_moyenne_fatigue$pond)

#Désaisonnalisation de fatigue & absence 

#Code exemple desaisonnaliation
# 
# base_moyenne_fatigue$indic_fatigue_cvs<-seas(base_moyenne_fatigue$indic_fatigue, x11 = "")
# base_taux_absence$pt_abs_cvs<-seas(base_taux_absence$pt_abs, x11 = "")

#seasonally_adjusted <- seas(ts(nom_var, start = c(2003, 1), end = c(2022, 4), frequency = 4), x11 = "")  # Use empty string for default X-12-ARIMA method
#nom_var_cvs <- seasonally_adjusted$series$d11&

#concat_1_2_3_4$annee_trimestre <- paste(concat_1_2_3_4$annee, "-T", concat_1_2_3_4$trimestre, sep = "")
#concat_1_2_3_4$annee_trimestre <- paste(concat_1_2_3_4$annee, "-T", concat_1_2_3_4$trimestre, sep = "")
#concat_1_2_3_4$annee_trimestre <- paste(concat_1_2_3_4$annee, "-T", concat_1_2_3_4$trimestre, sep = "")
