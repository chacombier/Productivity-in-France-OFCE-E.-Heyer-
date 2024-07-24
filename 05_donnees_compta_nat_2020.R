#Script pour traiter les données de comptabilité nationale


#On importe les données Insee 

#D'abord tu charges la liste de l'ensemble des DF dispo sur le package 
list_df <- insee::get_dataset_list()


#Tu vois que y'a le DF "CNT-2014-CB" qui est cool : c'est les comptes trim par branche en base 2014, ceux publiés
#Du coup tu charges ce DF, mais comme il est gros tu vas filtrer les variables que tu veux prendre

# list_idbank_cnt_2020 =
#   get_idbank_list("CNT-2020-CB")

###S'il te demande do you want to update all metadata tu tapes "y"
##Tu ouvres le df, et tu cherches naivement 'Emploi" dans la barre de recherche 
#Tu vois que dans la variable OPERATION_label_fr, ya des trucs intéressants, alors tu filtres

list_idbank_cnt_2020_bis <- get_insee_dataset("CNT-2020-CB") %>% 
  filter(OPERATION == "EMPS" | #salarié
           OPERATION == "EMPNS" | #non salarié
           OPERATION == "EMP") #total

list_idbank_cnt_2020_ter <- get_insee_dataset("CNT-2020-CB") %>% 
  filter(OPERATION == "B1"| 
           OPERATION == "D1"| 
           OPERATION == "DHES")

#Travail sur l'extraction précise de l'ebe (toutes branches)

list_idbank_cnt_ebe <- get_insee_dataset("CNT-2020-CB") %>% 
  filter(OPERATION == "B2")

list_ebe = list_idbank_cnt_ebe %>% pull(IDBANK)

ebe = get_insee_idbank(list_ebe) %>% 
  split_title() 

ebe <- ebe %>% 
  select(DATE, OBS_VALUE, TITLE_FR1, TITLE_FR2)

ebe<-ebe[ebe$TITLE_FR2=="Total branches",]

ebe <- ebe %>% 
  mutate(annee = as.numeric(substr(DATE,1,4))) %>% 
  mutate(trim = case_when(
    substr(DATE,6,7)=="01"~1,
    substr(DATE,6,7)=="04"~2,
    substr(DATE,6,7)=="07"~3,
    substr(DATE,6,7)=="10"~4
  ))

ebe$annee_trimestre <- paste(ebe$annee, "-T", ebe$trim, sep = "")

ebe <- ebe %>% 
  dplyr::rename("date" = "DATE")  %>% 
  dplyr::rename("ebe" = "OBS_VALUE")  

ebe<-subset(ebe, select=c(ebe, annee_trimestre))

#La tu vois que tu as plusieurs valeurs identiques de "Emploi salarié", parce que tu l'as par branche (CNA_produit_label_fr), 
# et que tu l'as soit en EQTP, soit en individus (variable UNIT_MEASURE) => on prend individus 

list_idbank_cnt_2020_bis <- list_idbank_cnt_2020_bis %>% 
  filter(UNIT_MEASURE == "INDIVIDUS")

###La ca parait propre car t'as 17 branches plus des regroupements pour chaque observation donc c'est ce que tu veux 

###Du coup on extrait 
list_emploi = list_idbank_cnt_2020_bis %>% pull(IDBANK)

list_cn = list_idbank_cnt_2020_ter %>% pull(IDBANK)

emploi = 
  get_insee_idbank(list_emploi) %>% 
  split_title() 

data_cn = 
  get_insee_idbank(list_cn) %>% 
  split_title() 

data_cn_SMNA = 
  get_insee_idbank(list_cn) %>% 
  split_title() 

#on garde que les colonnes intéressantes, ici : OBS_VALUE, DATE, TITLE_FR1, TITLE_FR2 qu'on renomme 
emploi <- emploi %>% 
  select(DATE, OBS_VALUE, TITLE_FR1, TITLE_FR2)

data_cn <- data_cn %>% 
  select(DATE, OBS_VALUE, TITLE_FR1, TITLE_FR2, TITLE_FR3)

data_cn_2 <- data_cn %>% 
  select(DATE, OBS_VALUE, TITLE_FR1, TITLE_FR2, TITLE_FR3)

data_cn_SMNA <- data_cn %>% 
  select(DATE, OBS_VALUE, TITLE_FR1, TITLE_FR2, TITLE_FR3)

data_cn_SMNA<-data_cn_SMNA[data_cn_SMNA$TITLE_FR2=="Marchand non agricole",]


# On nettoie ces données

setnames(emploi, c("date","emploi", "type", "Grand_secteur"))

emploi$emploi_mil <- emploi$emploi*1000

emploi <- emploi %>% 
  mutate(annee = as.numeric(substr(date,1,4))) %>% 
  mutate(trim = case_when(
    substr(date,6,7)=="01"~1,
    substr(date,6,7)=="04"~2,
    substr(date,6,7)=="07"~3,
    substr(date,6,7)=="10"~4
  ))

emploi$annee_trimestre <- paste(emploi$annee, "-T", emploi$trim, sep = "")


emploi_CN_gs<-emploi[emploi$Grand_secteur=="Agriculture" | emploi$Grand_secteur=="Services principalement marchands" | emploi$Grand_secteur=="Services principalement non-marchands" | emploi$Grand_secteur=="Construction" | emploi$Grand_secteur=="Industrie" | emploi$Grand_secteur=="Total branches",]
emploi_CN_gs$annee<-as.numeric(emploi_CN_gs$annee)
emploi_CN_gs<-emploi_CN_gs[emploi_CN_gs$annee>2002,]
summary(emploi_CN_gs$annee)

emploi_CN_gs$Grand_secteur[emploi_CN_gs$Grand_secteur=="Services principalement marchands"]<-"Tertiaire marchand"
emploi_CN_gs$Grand_secteur[emploi_CN_gs$Grand_secteur=="Services principalement non-marchands"]<-"Tertiaire non marchand"

#On le trie pour avoir le même ordonnancement que dans les données EEC

emploi_CN_gs<-emploi_CN_gs[order(emploi_CN_gs$annee, emploi_CN_gs$trim), ]
#On crée des sous bases par type d'emploi

emploi_total_CN<-emploi_CN_gs[emploi_CN_gs$type=="Emploi total (personnes physiques)",]
emploi_salarie_CN<-emploi_CN_gs[emploi_CN_gs$type=="Emploi salarié (personnes physiques)",]
emploi_non_salarie_CN<-emploi_CN_gs[emploi_CN_gs$type=="Emploi non salarié (personnes physiques)",]


emploi_total_CN <- emploi_total_CN %>% 
  dplyr::rename("emploi_total_CN" = "emploi_mil")

emploi_salarie_CN <- emploi_salarie_CN %>% 
  dplyr::rename("emploi_salarie_CN" = "emploi_mil")

emploi_non_salarie_CN <- emploi_non_salarie_CN %>% 
  dplyr::rename("emploi_non_salarie_CN"= "emploi_mil")

emploi_total_CN<-emploi_total_CN[order(emploi_total_CN$annee, emploi_total_CN$trim), ]
emploi_salarie_CN<-emploi_salarie_CN[order(emploi_salarie_CN$annee, emploi_salarie_CN$trim), ]
emploi_non_salarie_CN<-emploi_non_salarie_CN[order(emploi_non_salarie_CN$annee, emploi_non_salarie_CN$trim), ]
emploi_non_salarie_CN<-arrange(emploi_non_salarie_CN,Grand_secteur)
emploi_salarie_CN<-arrange(emploi_salarie_CN,Grand_secteur)
emploi_total_CN<-arrange(emploi_total_CN,Grand_secteur)


#On garde dans les bases total, salarié et non salarié juste les colonnes pour merge

emploi_total_CN<-subset(emploi_total_CN, select=c(emploi_total_CN, annee_trimestre, Grand_secteur))
emploi_non_salarie_CN<-subset(emploi_non_salarie_CN, select=c(emploi_non_salarie_CN, annee_trimestre, Grand_secteur))
emploi_salarie_CN<-subset(emploi_salarie_CN, select=c(emploi_salarie_CN, annee_trimestre, Grand_secteur))

#On crée les bases simplifiées exprimées en toutes branches 

emploi_total_CN_simplifie<-emploi_total_CN[emploi_total_CN$Grand_secteur=="Total branches", ]
emploi_salarie_CN_simplifie<-emploi_salarie_CN[emploi_salarie_CN$Grand_secteur=="Total branches", ]
emploi_non_salarie_CN_simplifie<-emploi_non_salarie_CN[emploi_non_salarie_CN$Grand_secteur=="Total branches", ]

#On sauvegarde les bases sectorielles réduites à 3 colonnes

openxlsx::write.xlsx(emploi_total_CN, file  = "~/Desktop/OFCE/Output GS/emploi_total_CN.xlsx")
openxlsx::write.xlsx(emploi_salarie_CN, file  = "~/Desktop/OFCE/Output GS/emploi_salarie_CN.xlsx")
openxlsx::write.xlsx(emploi_non_salarie_CN, file  = "~/Desktop/OFCE/Output GS/emploi_non_salarie_CN.xlsx")

#On passe au nettoyage pour la base de compta nat non emploi: VA, heures travaillées et coût du travail

head(data_cn)
base_CN<-c("date", "VA_valeur", "VA_volume", "Heures_travaillée", "Cout_travail")
base_CN<-as.data.frame(base_CN)
#base_CN$date<-data_cn$DATE

#On réduite la base de CN aux secteurs institutionnels

data_cn<-data_cn[data_cn$TITLE_FR2=="Agriculture" | data_cn$TITLE_FR2=="Services principalement marchands" | data_cn$TITLE_FR2=="Services principalement non-marchands" | data_cn$TITLE_FR2=="Construction" | data_cn$TITLE_FR2=="Industrie",]

#data_cn$secteur_agri_non_marchand<-1
#data_cn$secteur_agri_non_marchand[data_cn$TITLE_FR2=="Agriculture"]<-0
#data_cn$secteur_agri_non_marchand[data_cn$TITLE_FR2=="Services principalement non-marchands"]<-0
#data_cn<-data_cn[data_cn$TITLE_FR2=="Total branches",]
#data_cn$VA_valeur<-[data_cn$TITLE_FR1=="Valeur ajoutée des branches" |data_cn$TITLE_FR3=="Valeur aux prix courants"  | data_cn$TITLE_FR2=="Total branches" ]
#heures_travaillees<-c(data_cn_SMNA$DATE, data_cn_SMNA$OBS_VALUE[data_cn_SMNA$TITLE_FR1=="Durée de travail effective des salariés" & data_cn_SMNA$TITLE_FR3=="Série CVS-CJO" ])


#Retravailler la base à partir du secteur marchand non agricole 

data_cn_SMNA_heures<-data_cn_SMNA[data_cn_SMNA$TITLE_FR1=="Durée de travail effective des salariés",]
data_cn_SMNA_cout<-data_cn_SMNA[data_cn_SMNA$TITLE_FR1=="Rémunération salariale versée",]
data_cn_SMNA_va_volume<-data_cn_SMNA[data_cn_SMNA$TITLE_FR1=="Valeur ajoutée des branches" & data_cn_SMNA$TITLE_FR3=="Volume aux prix de l'année précédente chaînés" ,]
data_cn_SMNA_va_valeur<-data_cn_SMNA[data_cn_SMNA$TITLE_FR1=="Valeur ajoutée des branches" & data_cn_SMNA$TITLE_FR3=="Valeur aux prix courants",]

data_cn_SMNA_heures_ag<-aggregate(OBS_VALUE ~ DATE, data_cn_SMNA_heures, mean)
#View(data_cn_SMNA_heures_ag)
data_cn_SMNA_cout_ag<-aggregate(OBS_VALUE ~ DATE, data_cn_SMNA_cout, mean)
data_cn_SMNA_va_volume_ag<-aggregate(OBS_VALUE ~ DATE, data_cn_SMNA_va_volume, mean)
data_cn_SMNA_va_valeur_ag<-aggregate(OBS_VALUE ~ DATE, data_cn_SMNA_va_valeur, mean)

data_cn_SMNA_heures_ag <- data_cn_SMNA_heures_ag %>% 
  dplyr::rename("heures_travaillees"= "OBS_VALUE")

data_cn_SMNA_cout_ag <- data_cn_SMNA_cout_ag %>% 
  dplyr::rename("cout_salarial"= "OBS_VALUE")

data_cn_SMNA_va_volume_ag <- data_cn_SMNA_va_volume_ag %>% 
  dplyr::rename("va_volume"= "OBS_VALUE")

data_cn_SMNA_va_valeur_ag <- data_cn_SMNA_va_valeur_ag %>% 
  dplyr::rename("va_valeur"= "OBS_VALUE")

data_SMNA<-inner_join(data_cn_SMNA_heures_ag,data_cn_SMNA_cout_ag,by="DATE")
data_SMNA<-inner_join(data_SMNA,data_cn_SMNA_va_volume_ag,by="DATE")
data_SMNA<-inner_join(data_SMNA,data_cn_SMNA_va_valeur_ag,by="DATE")

data_SMNA <- data_SMNA %>% 
  mutate(annee = as.numeric(substr(DATE,1,4))) %>% 
  mutate(trim = case_when(
    substr(DATE,6,7)=="01"~1,
    substr(DATE,6,7)=="04"~2,
    substr(DATE,6,7)=="07"~3,
    substr(DATE,6,7)=="10"~4
  ))

data_SMNA$annee_trimestre <- paste(data_SMNA$annee, "-T", data_SMNA$trim, sep = "")

emploi_salarie_CN$emploi_salarie_strict<-emploi_salarie_CN$emploi_salarie_CN/1000
emploi_total_CN$emploi_total_strict<-emploi_total_CN$emploi_total_CN/1000
emploi_non_salarie_CN$emploi_non_salarie_strict<-emploi_non_salarie_CN$emploi_non_salarie_CN/1000


#emploi_smna_prov<-emploi_salarie_CN[emploi_salarie_CN$Grand_secteur=="Tertiaire marchand" | emploi_salarie_CN$Grand_secteur=="Construction" | emploi_salarie_CN$Grand_secteur=="Industrie",]
#emploi_smna_prov<-subset(emploi_smna_prov, select= c(emploi_salarie_CN, emploi_salarie_strict, annee_trimestre))
#emploi_smna<-aggregate(emploi_salarie_CN ~ annee_trimestre, emploi_smna_prov, sum)
#emploi_smna_mil<-aggregate(emploi_salarie_strict ~ annee_trimestre, emploi_smna_prov, sum)
#emploi_smna<-inner_join(emploi_smna, emploi_smna_mil, by=c("annee_trimestre"))


#On crée une base emploi au niveau SMNA

emploi_SMNA<-emploi[emploi$Grand_secteur=="Marchand non agricole",]

emploi_total_SMNA<-emploi_SMNA[emploi_SMNA$type=="Emploi total (personnes physiques)",]
emploi_salarie_SMNA<-emploi_SMNA[emploi_SMNA$type=="Emploi salarié (personnes physiques)",]
emploi_non_salarie_SMNA<-emploi_SMNA[emploi_SMNA$type=="Emploi non salarié (personnes physiques)",]


emploi_total_SMNA <- emploi_total_SMNA %>% 
  dplyr::rename("emploi_total_SMNA_CN" = "emploi_mil")

emploi_salarie_SMNA <- emploi_salarie_SMNA %>% 
  dplyr::rename("emploi_salarie_SMNA_CN" = "emploi_mil")

emploi_non_salarie_SMNA <- emploi_non_salarie_SMNA %>% 
  dplyr::rename("emploi_non_salarie_SMNA_CN"= "emploi_mil")

emploi_non_salarie_SMNA<-subset(emploi_non_salarie_SMNA, select= c( annee_trimestre,emploi_non_salarie_SMNA_CN ))
emploi_salarie_SMNA<-subset(emploi_salarie_SMNA, select= c( annee_trimestre,emploi_salarie_SMNA_CN ))
emploi_total_SMNA<-subset(emploi_total_SMNA, select= c( annee_trimestre,emploi_total_SMNA_CN ))

emploi_SMNA_final<-inner_join(emploi_non_salarie_SMNA, emploi_salarie_SMNA, by=c("annee_trimestre"))
emploi_SMNA_final<-inner_join(emploi_SMNA_final, emploi_total_SMNA, by=c("annee_trimestre"))


#Creation de la table SMNA comme merge des donnees emploi et des donnees macro compta nat

table_smna<-inner_join(emploi_SMNA_final, data_SMNA, by=c("annee_trimestre"))

#Creation de variables a partir de ces variables de base 

table_smna$emploi_salarie_strict<-table_smna$emploi_salarie_SMNA_CN/1000
table_smna$prix_va<-table_smna$va_valeur/table_smna$va_volume
table_smna$productivite_tete<-table_smna$va_volume/table_smna$emploi_salarie_strict
table_smna$productivite_horaire<-table_smna$va_volume/table_smna$heures_travaillees
table_smna$productivite_hor_ducoudre_1<-table_smna$va_volume/(table_smna$emploi_salarie_strict * table_smna$heures_travaillees * 1000)
table_smna$productivite_hor_ducoudre_2<-table_smna$va_volume/(table_smna$emploi_salarie_strict * table_smna$heures_travaillees) * 1000

########## arreter le script là ########
#data_cn2 <- data_cn_SMNA %>% 
  #mutate(TITLE_FR1 = case_when(TITLE_FR1 == "Valeur ajoutée des branches"~"va_tot",
                               #TITLE_FR1 == "Rémunération salariale versée"~"salaire",
                               #TITLE_FR1 == "Durée de travail effective des salariés"~"duree"))  %>% 
 # mutate(TITLE_FR3 = case_when(TITLE_FR3 == "Valeur aux prix courants"~"valeur",
#                               TITLE_FR3 == "Série CVS-CJO"~"so",
#                               TITLE_FR3 == "Volume aux prix de l'année précédente chaînés"~"volume")) %>% 
 # pivot_wider(names_from = c(TITLE_FR1, TITLE_FR3), values_from = OBS_VALUE, id_cols = DATE)

#data_cn2 <- data_cn2 %>% 
#  mutate(annee = as.numeric(substr(DATE,1,4))) %>% 
 # mutate(trim = case_when(
 #   substr(DATE,6,7)=="01"~1,
 #   substr(DATE,6,7)=="04"~2,
  #  substr(DATE,6,7)=="07"~3,
 #   substr(DATE,6,7)=="10"~4
#  ))

#data_cn2$annee_trimestre <- paste(data_cn2$annee, "-T", data_cn2$trim, sep = "")

#Save des bases CN SMNA fusionnées

openxlsx::write.xlsx(table_smna, file  = "~/Desktop/OFCE/Output GS/table_smna.xlsx")


