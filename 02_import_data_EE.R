#02_Script import données EE

#Script audit import des données 

#Les données ne sont pas importées par boucle car le changement de noms de variables
# par vagues désynchronisées rend aussi compliquée l'import par boucle que par série séparemment

INDIV20031 <- read_delim("Downloads/donnees_new/INDIV20031.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20032 <- read_delim("Downloads/donnees_new/INDIV20032.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20033 <- read_delim("Downloads/donnees_new/INDIV20033.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20034 <- read_delim("Downloads/donnees_new/INDIV20034.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20041 <- read_delim("Downloads/donnees_new/INDIV20041.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20042 <- read_delim("Downloads/donnees_new/INDIV20042.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20043 <- read_delim("Downloads/donnees_new/INDIV20043.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20044 <- read_delim("Downloads/donnees_new/INDIV20044.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20051 <- read_delim("Downloads/donnees_new/INDIV20051.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20052 <- read_delim("Downloads/donnees_new/INDIV20052.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20053 <- read_delim("Downloads/donnees_new/INDIV20053.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20054 <- read_delim("Downloads/donnees_new/INDIV20054.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20061 <- read_delim("Downloads/donnees_new/INDIV20061.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20062 <- read_delim("Downloads/donnees_new/INDIV20062.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20063 <- read_delim("Downloads/donnees_new/INDIV20063.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20064 <- read_delim("Downloads/donnees_new/INDIV20064.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20071 <- read_delim("Downloads/donnees_new/INDIV20071.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20072 <- read_delim("Downloads/donnees_new/INDIV20072.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20073 <- read_delim("Downloads/donnees_new/INDIV20073.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20074 <- read_delim("Downloads/donnees_new/INDIV20074.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20081 <- read_delim("Downloads/donnees_new/INDIV20081.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20082 <- read_delim("Downloads/donnees_new/INDIV20082.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20083 <- read_delim("Downloads/donnees_new/INDIV20083.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20084 <- read_delim("Downloads/donnees_new/INDIV20084.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAF", "ACTEU", "STAT2","STATUT", "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)


INDIV20031 <- INDIV20031 %>% 
  dplyr::rename("TXTPPB" = "TXTPP")
INDIV20032 <- INDIV20032 %>% 
  dplyr::rename("TXTPPB" = "TXTPP")
INDIV20033 <- INDIV20033 %>% 
  dplyr::rename("TXTPPB" = "TXTPP")
INDIV20034 <- INDIV20034 %>% 
  dplyr::rename("TXTPPB" = "TXTPP")


donnees_2003<-rbind(INDIV20031, INDIV20032, INDIV20033, INDIV20034)
donnees_2004<-rbind(INDIV20041, INDIV20042, INDIV20043, INDIV20044)
donnees_2005<-rbind(INDIV20051, INDIV20052, INDIV20053, INDIV20054)
donnees_2006<-rbind(INDIV20061, INDIV20062, INDIV20063, INDIV20064)
donnees_2007<-rbind(INDIV20071, INDIV20072, INDIV20073, INDIV20074)
donnees_2008<-rbind(INDIV20081, INDIV20082, INDIV20083, INDIV20084)
donnees_1<-rbind(donnees_2003, donnees_2004, donnees_2005, donnees_2006, donnees_2007, donnees_2008)


INDIV20091 <- read_delim("Downloads/donnees_new/INDIV20091.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20092 <- read_delim("Downloads/donnees_new/INDIV20092.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20093 <- read_delim("Downloads/donnees_new/INDIV20093.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20094 <- read_delim("Downloads/donnees_new/INDIV20094.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20101 <- read_delim("Downloads/donnees_new/INDIV20101.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20102 <- read_delim("Downloads/donnees_new/INDIV20102.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20103 <- read_delim("Downloads/donnees_new/INDIV20103.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20104 <- read_delim("Downloads/donnees_new/INDIV20104.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20111 <- read_delim("Downloads/donnees_new/INDIV20111.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20112 <- read_delim("Downloads/donnees_new/INDIV20112.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20113 <- read_delim("Downloads/donnees_new/INDIV20113.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20114 <- read_delim("Downloads/donnees_new/INDIV20114.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20121 <- read_delim("Downloads/donnees_new/INDIV20121.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20122 <- read_delim("Downloads/donnees_new/INDIV20122.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20123 <- read_delim("Downloads/donnees_new/INDIV20123.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20124 <- read_delim("Downloads/donnees_new/INDIV20124.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STAT2","STATUT",  "EXTRI_RETROPOLE", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPB", "TPP", "CONTRA"), trim_ws = TRUE)

donnees_2009<-rbind(INDIV20091, INDIV20092, INDIV20093, INDIV20094)
donnees_2010<-rbind(INDIV20101, INDIV20102, INDIV20103, INDIV20104)
donnees_2011<-rbind(INDIV20111, INDIV20112, INDIV20113, INDIV20114)
donnees_2012<-rbind(INDIV20121, INDIV20122, INDIV20123, INDIV20124)

donnees_2<-rbind(donnees_2009, donnees_2010, donnees_2011,donnees_2012)


INDIV20131 <- read_delim("Downloads/donnees_new/INDIV20131.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20132 <- read_delim("Downloads/donnees_new/INDIV20132.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20133 <- read_delim("Downloads/donnees_new/INDIV20133.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20134 <- read_delim("Downloads/donnees_new/INDIV20134.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20141 <- read_delim("Downloads/donnees_new/INDIV20141.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20142 <- read_delim("Downloads/donnees_new/INDIV20142.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20143 <- read_delim("Downloads/donnees_new/INDIV20143.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20144 <- read_delim("Downloads/donnees_new/INDIV20144.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPP", "TPP", "CONTRA"), trim_ws = TRUE)
INDIV20151 <- read_delim("Downloads/donnees_new/INDIV20151.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20152 <- read_delim("Downloads/donnees_new/INDIV20152.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20153 <- read_delim("Downloads/donnees_new/INDIV20153.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20154 <- read_delim("Downloads/donnees_new/INDIV20154.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20161 <- read_delim("Downloads/donnees_new/INDIV20161.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20162 <- read_delim("Downloads/donnees_new/INDIV20162.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20163 <- read_delim("Downloads/donnees_new/INDIV20163.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20164 <- read_delim("Downloads/donnees_new/INDIV20164.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20171 <- read_delim("Downloads/donnees_new/INDIV20171.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20172 <- read_delim("Downloads/donnees_new/INDIV20172.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20173 <- read_delim("Downloads/donnees_new/INDIV20173.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20174 <- read_delim("Downloads/donnees_new/INDIV20174.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20181 <- read_delim("Downloads/donnees_new/INDIV20181.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20182 <- read_delim("Downloads/donnees_new/INDIV20182.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20183 <- read_delim("Downloads/donnees_new/INDIV20183.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20184 <- read_delim("Downloads/donnees_new/INDIV20184.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20191 <- read_delim("Downloads/donnees_new/INDIV20191.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20192 <- read_delim("Downloads/donnees_new/INDIV20192.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20193 <- read_delim("Downloads/donnees_new/INDIV20193.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20194 <- read_delim("Downloads/donnees_new/INDIV20194.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20201 <- read_delim("Downloads/donnees_new/INDIV20201.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20202 <- read_delim("Downloads/donnees_new/INDIV20202.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20203 <- read_delim("Downloads/donnees_new/INDIV20203.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)
INDIV20204 <- read_delim("Downloads/donnees_new/INDIV20204.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU","STAT2", "STATUTR","extri", "EMPANH", "EMPABS", "TRAREF", "PASTRA", "FORDAT", "EMPNBH", "RABS", "RABSP", "CSER", "TXTPPRED", "TPPRED", "CONTRA"), trim_ws = TRUE)



INDIV20131 <- INDIV20131 %>% 
  dplyr::rename("TXTPPRED" = "TXTPP", "TPPRED" = "TPP")
INDIV20132 <- INDIV20132 %>% 
  dplyr::rename("TXTPPRED" = "TXTPP", "TPPRED" = "TPP")
INDIV20133 <- INDIV20133 %>% 
  dplyr::rename("TXTPPRED" = "TXTPP", "TPPRED" = "TPP")
INDIV20134 <- INDIV20134 %>% 
  dplyr::rename("TXTPPRED" = "TXTPP", "TPPRED" = "TPP")
INDIV20141 <- INDIV20141 %>% 
  dplyr::rename("TXTPPRED" = "TXTPP", "TPPRED" = "TPP")
INDIV20142 <- INDIV20142 %>% 
  dplyr::rename("TXTPPRED" = "TXTPP", "TPPRED" = "TPP")
INDIV20143 <- INDIV20143 %>% 
  dplyr::rename("TXTPPRED" = "TXTPP", "TPPRED" = "TPP")
INDIV20144 <- INDIV20144 %>% 
  dplyr::rename("TXTPPRED" = "TXTPP", "TPPRED" = "TPP")



donnees_2013<-rbind(INDIV20131, INDIV20132, INDIV20133, INDIV20134)
donnees_2014<-rbind(INDIV20141, INDIV20142, INDIV20143, INDIV20144)
donnees_2015<-rbind(INDIV20151, INDIV20152, INDIV20153, INDIV20154)
donnees_2016<-rbind(INDIV20161, INDIV20162, INDIV20163, INDIV20164)
donnees_2017<-rbind(INDIV20171, INDIV20172, INDIV20173, INDIV20174)
donnees_2018<-rbind(INDIV20181, INDIV20182, INDIV20183, INDIV20184)
donnees_2019<-rbind(INDIV20191, INDIV20192, INDIV20193, INDIV20194)
donnees_2020<-rbind(INDIV20201, INDIV20202, INDIV20203, INDIV20204)

donnees_3<-rbind(donnees_2013, donnees_2014, donnees_2015,donnees_2016,donnees_2017,donnees_2018,donnees_2019, donnees_2020)

INDIV20211 <- read_delim("Downloads/donnees_new/INDIV20211.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STATUT", "APPRENT","STATUTDET","EXTRI", "ABSDUR_MAL", "TRAREF", "PASTRA", "FORDAT", "HEFFEMP","RABS", "PCS1", "TXTPPRED", "TPPRED", "DURCONT"), trim_ws = TRUE)
INDIV20212 <- read_delim("Downloads/donnees_new/INDIV20212.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STATUT", "APPRENT","STATUTDET","EXTRI", "ABSDUR_MAL", "TRAREF", "PASTRA", "FORDAT", "HEFFEMP","RABS", "PCS1", "TXTPPRED", "TPPRED", "DURCONT"), trim_ws = TRUE)
INDIV20213 <- read_delim("Downloads/donnees_new/INDIV20213.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STATUT", "APPRENT","STATUTDET","EXTRI", "ABSDUR_MAL", "TRAREF", "PASTRA", "FORDAT", "HEFFEMP","RABS", "PCS1", "TXTPPRED", "TPPRED", "DURCONT"), trim_ws = TRUE)
INDIV20214 <- read_delim("Downloads/donnees_new/INDIV20214.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STATUT", "APPRENT","STATUTDET","EXTRI", "ABSDUR_MAL", "TRAREF", "PASTRA", "FORDAT", "HEFFEMP","RABS", "PCS1", "TXTPPRED", "TPPRED", "DURCONT"), trim_ws = TRUE)
INDIV20221 <- read_delim("Downloads/donnees_new/INDIV20221.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STATUT", "APPRENT","STATUTDET","EXTRI", "ABSDUR_MAL", "TRAREF", "PASTRA", "FORDAT", "HEFFEMP","RABS", "PCS1", "TXTPPRED", "TPPRED", "DURCONT"), trim_ws = TRUE)
INDIV20222 <- read_delim("Downloads/donnees_new/INDIV20222.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STATUT", "APPRENT","STATUTDET","EXTRI", "ABSDUR_MAL", "TRAREF", "PASTRA", "FORDAT", "HEFFEMP","RABS", "PCS1", "TXTPPRED", "TPPRED", "DURCONT"), trim_ws = TRUE)
INDIV20223 <- read_delim("Downloads/donnees_new/INDIV20223.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STATUT", "APPRENT","STATUTDET","EXTRI", "ABSDUR_MAL", "TRAREF", "PASTRA", "FORDAT", "HEFFEMP","RABS", "PCS1", "TXTPPRED", "TPPRED", "DURCONT"), trim_ws = TRUE)
INDIV20224 <- read_delim("Downloads/donnees_new/INDIV20224.csv", delim = ";", escape_double = FALSE, col_select=c("ANNEE", "TRIM", "IDENT",  "REG", "AG", "NAFN", "ACTEU", "STATUT", "APPRENT","STATUTDET","EXTRI", "ABSDUR_MAL", "TRAREF", "PASTRA", "FORDAT", "HEFFEMP","RABS", "PCS1", "TXTPPRED", "TPPRED", "DURCONT"), trim_ws = TRUE)

donnees_2021<-rbind(INDIV20211, INDIV20212, INDIV20213, INDIV20214)
donnees_2022<-rbind(INDIV20221, INDIV20222, INDIV20223, INDIV20224)

donnees_4<-rbind(donnees_2021, donnees_2022)

#Passage au script principal

donnees_concat_1<-as.data.frame(donnees_1)
donnees_concat_2<-as.data.frame(donnees_2)
donnees_concat_3<-as.data.frame(donnees_3)
donnees_concat_4<-as.data.frame(donnees_4)