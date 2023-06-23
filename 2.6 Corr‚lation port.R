titanic <- read.csv("G:/Mon Drive/S8/INFO0808/Projet/INFO0808_Projet/titanic.csv", header = TRUE, sep = ",")

titanic <- na.omit(titanic)
titanic <- titanic[titanic$Embarked != "",]

library(ggplot2)

# Visualisation du taux de survie en fonction du port d'embarquement
ggplot(data = titanic, aes(x = factor(Survived), fill = factor(Embarked))) +
  geom_bar() +
  geom_text(stat='count', aes(label=..count..), position=position_stack(vjust=0.5)) +
  scale_x_discrete(labels = c("Non Survivant","Survivant")) +
  scale_fill_brewer(palette = "Set1", labels = c("Cherbourg", "Queenstown", "Southampton", "Unknown")) +
  labs(x = "Survie", y = "Nombre de passagers", title = "Taux de survie en fonction du port d'embarquement", fill="Port d'embarquement") +
    theme(text = element_text(size = 15))
