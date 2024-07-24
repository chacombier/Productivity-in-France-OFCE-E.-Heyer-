######## 07_graphs_comparaison_EE_CN ###########

openxlsx::write.xlsx(table_finale, file  = "~/Desktop/OFCE/table_finale.xlsx")
openxlsx::write.xlsx(table_finale_simplifiee, file  = "~/Desktop/OFCE/table_finale_simplifiee.xlsx")


#Emploi total

library(ggplot2)

########## Par secteur 

##### I/ Emploi total

# Conversion de annee_trimestre en un facteur ordonné
table_finale$annee_trimestre <- factor(table_finale$annee_trimestre, levels = unique(table_finale$annee_trimestre), ordered = TRUE)

# Sélection des étiquettes pour l'axe des abscisses
etiquettes <- unique(table_finale$annee_trimestre)[c(TRUE, rep(FALSE, times = 3))]

# Création du facet grid
ggplot(table_finale, aes(x = annee_trimestre, y = emploi_total_EE_ds, group = 1)) +
  geom_line(aes(color = "Enquête emploi"), linetype = "solid") +
  geom_line(aes(y = emploi_total_CN, color = "Comptes nationaux"), linetype = "dashed") +
  facet_wrap(~ Grand_secteur, scales = "free_y", nrow = 2) +
  scale_color_manual(values = c( "Comptes nationaux" = "red", "Enquête emploi" = "blue"),
                     labels = c( "Comptes nationaux","Enquête emploi")) +
  labs(x = "Année-Trimestre", y = "Nombre d'emplois total", color = "Source") +
  theme_minimal() +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))

##### II/ Emploi salarié

# Conversion de annee_trimestre en un facteur ordonné
table_finale$annee_trimestre <- factor(table_finale$annee_trimestre, levels = unique(table_finale$annee_trimestre), ordered = TRUE)

etiquettes <- unique(table_finale$annee_trimestre)[c(TRUE, rep(FALSE, times = 3))]

# Création du facet grid
ggplot(table_finale, aes(x = annee_trimestre, y = emploi_salarie_EE_ds, group = 1)) +
  geom_line(aes(color = "Enquête emploi"), linetype = "solid") +
  geom_line(aes(y = emploi_salarie_CN, color = "Comptes nationaux"), linetype = "dotted") +
  facet_wrap(~ Grand_secteur, scales = "free_y", nrow = 2) +
  scale_color_manual(values = c( "Comptes nationaux" = "red", "Enquête emploi" = "blue"),
                     labels = c( "Comptes nationaux","Enquête emploi")) +
  labs(x = "Année-Trimestre", y = "Nombre d'emplois salariés", color = "Source") +
  theme_minimal() +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))

##### III/ Emploi non salarié

# Conversion de annee_trimestre en un facteur ordonné
table_finale$annee_trimestre <- factor(table_finale$annee_trimestre, levels = unique(table_finale$annee_trimestre), ordered = TRUE)

etiquettes <- unique(table_finale$annee_trimestre)[c(TRUE, rep(FALSE, times = 3))]

# Création du facet grid
ggplot(table_finale, aes(x = annee_trimestre, y = emploi_non_salarie_EE_ds, group = 1)) +
  geom_line(aes(color = "Enquête emploi"), linetype = "solid") +
  geom_line(aes(y = emploi_non_salarie_CN, color = "Comptes nationaux"), linetype = "dotted") +
  facet_wrap(~ Grand_secteur, scales = "free_y", nrow = 2) +
  scale_color_manual(values = c( "Comptes nationaux" = "red", "Enquête emploi" = "blue"),
                     labels = c( "Comptes nationaux","Enquête emploi")) +
  labs(x = "Année-Trimestre", y = "Nombre d'emplois non salariés", color = "Source") +
  theme_minimal() +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))


####### Hors secteur 

#non salarie

ggplot(table_finale_simplifiee, aes(x = annee_trimestre, y = emploi_non_salarie_EE_ds, group = 1)) +
  geom_line(aes(color = "Enquête emploi"), linetype = "solid") +
  geom_line(aes(y = emploi_non_salarie_CN, color = "Comptes nationaux"), linetype = "dotted") +
  scale_color_manual(values = c( "Comptes nationaux" = "red", "Enquête emploi" = "blue"),
                     labels = c( "Comptes nationaux","Enquête emploi")) +
  labs(x = "Année-Trimestre", y = "Nombre d'emplois non salariés", color = "Source") +
  theme_minimal() +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))

#salarie

ggplot(table_finale_simplifiee, aes(x = annee_trimestre, y = emploi_salarie_EE_ds, group = 1)) +
  geom_line(aes(color = "Enquête emploi"), linetype = "solid") +
  geom_line(aes(y = emploi_salarie_CN, color = "Comptes nationaux"), linetype = "dotted") +
  scale_color_manual(values = c( "Comptes nationaux" = "red", "Enquête emploi" = "blue"),
                     labels = c( "Comptes nationaux","Enquête emploi")) +
  labs(x = "Année-Trimestre", y = "Nombre d'emplois salariés", color = "Source") +
  theme_minimal() +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))

#total

ggplot(table_finale_simplifiee, aes(x = annee_trimestre, y = emploi_total_EE_ds, group = 1)) +
  geom_line(aes(color = "Enquête emploi"), linetype = "solid") +
  geom_line(aes(y = emploi_total_CN, color = "Comptes nationaux"), linetype = "dotted") +
  scale_color_manual(values = c( "Comptes nationaux" = "red", "Enquête emploi" = "blue"),
                     labels = c( "Comptes nationaux","Enquête emploi")) +
  labs(x = "Année-Trimestre", y = "Nombre d'emplois total", color = "Source") +
  theme_minimal() +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))

#apprentissage

ggplot(table_finale_simplifiee, aes(x = annee_trimestre, y = apprenti_EE_ds, group = 1)) +
  geom_line(aes(color = "Enquête emploi"), linetype = "solid") +
  geom_line(aes(y = apprentissage_dares_ds, color = "Comptes nationaux"), linetype = "dotted") +
  scale_color_manual(values = c( "Comptes nationaux" = "red", "Enquête emploi" = "blue"),
                     labels = c( "Comptes nationaux","Enquête emploi")) +
  labs(x = "Année-Trimestre", y = "Apprentissage", color = "Source") +
  theme_minimal() +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))


#Graph par écart 

#I. Hors secteur

#Apprentissage

ggplot(table_finale_simplifiee, aes(x = annee_trimestre, y = ecart_absolu_ap)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  scale_x_discrete(breaks = unique(table_finale_simplifiee$annee_trimestre)[seq(1, length(unique(table_finale_simplifiee$annee_trimestre)), by = 4)]) +
  labs(x = "Année-Trimestre", y = "Ecart absolu CN/EEC", title = "Histogramme de l'écart absolu (en % base 100 enquête emploi) entre le nombre d'apprentissages enquête emploi et comptes nationaux par trimestre") +
  theme_minimal()+
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))

#Total

ggplot(table_finale_simplifiee, aes(x = annee_trimestre, y = ecart_absolu_emploi_tot)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  scale_x_discrete(breaks = unique(table_finale_simplifiee$annee_trimestre)[seq(1, length(unique(table_finale_simplifiee$annee_trimestre)), by = 4)]) +
  labs(x = "Année-Trimestre", y = "Ecart absolu CN/EEC", title = "Histogramme de l'écart absolu (en % base 100 enquête emploi) entre le nombre d'emplois enquête emploi et comptes nationaux par trimestre") +
  theme_minimal()+
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))


#Salarie

ggplot(table_finale_simplifiee, aes(x = annee_trimestre, y = ecart_absolu_salarie)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  scale_x_discrete(breaks = unique(table_finale_simplifiee$annee_trimestre)[seq(1, length(unique(table_finale_simplifiee$annee_trimestre)), by = 4)]) +
  labs(x = "Année-Trimestre", y = "Ecart absolu CN/EEC", title = "Histogramme de l'écart absolu (en % base 100 enquête emploi) entre le nombre d'emplois salariés enquête emploi et comptes nationaux par trimestre") +
  theme_minimal()+
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))


#Non salarie

ggplot(table_finale_simplifiee, aes(x = annee_trimestre, y = ecart_absolu_non_salarie)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  scale_x_discrete(breaks = unique(table_finale_simplifiee$annee_trimestre)[seq(1, length(unique(table_finale_simplifiee$annee_trimestre)), by = 4)]) +
  labs(x = "Année-Trimestre", y = "Ecart absolu CN/EEC", title = "Histogramme de l'écart absolu (en % base 100 enquête emploi) entre le nombre d'emplois non salariés enquête emploi et comptes nationaux par trimestre") +
  theme_minimal()+
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))



#II. Par secteur écarts

#Emploi total

table_finale$annee_trimestre <- factor(table_finale$annee_trimestre, levels = unique(table_finale_simplifiee$annee_trimestre))

# Tracer l'histogramme avec facet_grid par secteur
ggplot(table_finale, aes(x = annee_trimestre, y = ecart_absolu_emploi_tot)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  scale_x_discrete(breaks = unique(table_finale_simplifiee$annee_trimestre)[seq(1, length(unique(table_finale_simplifiee$annee_trimestre)), by = 4)]) +
  labs(x = "Année-Trimestre", y = "Ecart Absolu CN/EE", title = "Histogramme de l'écart absolu d'emplois par trimestre par secteur") +
  facet_grid(.~Grand_secteur) +
  theme_minimal()+
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))

#Emploi salarie

table_finale$annee_trimestre <- factor(table_finale$annee_trimestre, levels = unique(table_finale_simplifiee$annee_trimestre))

# Tracer l'histogramme avec facet_grid par secteur
ggplot(table_finale, aes(x = annee_trimestre, y = ecart_absolu_salarie)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  scale_x_discrete(breaks = unique(table_finale_simplifiee$annee_trimestre)[seq(1, length(unique(table_finale_simplifiee$annee_trimestre)), by = 4)]) +
  labs(x = "Année-Trimestre", y = "Ecart Absolu CN/EE", title = "Histogramme de l'écart absolu d'emplois salariés par trimestre par secteur") +
  facet_grid(.~Grand_secteur) +
  theme_minimal()+
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))


#Emploi non salarie

table_finale$annee_trimestre <- factor(table_finale$annee_trimestre, levels = unique(table_finale_simplifiee$annee_trimestre))

# Tracer l'histogramme avec facet_grid par secteur
ggplot(table_finale, aes(x = annee_trimestre, y = ecart_absolu_non_salarie)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  scale_x_discrete(breaks = unique(table_finale_simplifiee$annee_trimestre)[seq(1, length(unique(table_finale_simplifiee$annee_trimestre)), by = 4)]) +
  labs(x = "Année-Trimestre", y = "Ecart Absolu CN/EE", title = "Histogramme de l'écart absolu d'emplois non salariés par trimestre par secteur") +
  facet_grid(.~Grand_secteur) +
  theme_minimal()+
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 10, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))


