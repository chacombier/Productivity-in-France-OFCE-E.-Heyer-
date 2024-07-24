library(ggplot2)
library(dplyr)
etiquettes <- unique(table_ecm$annee_trimestre)[c(TRUE, rep(FALSE, times = 3))]
# Convertir annee_trimestre en une variable numérique pour le modèle linéaire
table_ecm <- table_ecm %>%
  mutate(numeric_date = as.numeric(as.factor(annee_trimestre)))

# Filtrer les données pour les trimestres avant 2020
table_ecm_before_2020 <- table_ecm %>%
  filter(annee < 2020)

# Calculer le modèle linéaire
model <- lm(productivite_tete ~ numeric_date, data = table_ecm_before_2020)

# Prédire les valeurs pour toute la période
table_ecm$predicted <- predict(model, newdata = table_ecm)

# Créer le graphique
ggplot(table_ecm, aes(x = annee_trimestre, y = productivite_tete, group = 1)) +
  geom_line() +
  labs(x = "Année-Trimestre", y = "Productivité par tête") +
  theme_minimal() +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 8, vjust = 0.5)) +
  scale_x_discrete(breaks = etiquettes) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) +
  geom_line(aes(y = predicted), color = "red", linetype = "dotted")
