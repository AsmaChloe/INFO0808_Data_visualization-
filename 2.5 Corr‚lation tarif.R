titanic <- read.csv("G:/Mon Drive/S8/INFO0808/Projet/INFO0808_Projet/titanic.csv", header = TRUE, sep = ",")

titanic <- na.omit(titanic)
titanic <- titanic[titanic$Embarked != "",]

library(ggplot2)

# Visualisation du tarif selon la survie
ggplot(data=titanic, aes(x=Fare, group=factor(Survived), fill=factor(Survived))) +
  geom_density(adjust=1.5) +
  facet_wrap(~factor(Survived), labeller = labeller('factor(Survived)' = labels)) +
  scale_fill_brewer(palette = "Set1", labels = c("Non Survivant", "Survivant")) +
  labs(x = "Tarif", y = "Densite", title = "Repartition du tarif selon la survie", fill="Survie") +
  theme(text = element_text(size = 15))

#Port d'embarquement en fonction du tarif
ggplot(data = titanic, aes(x = factor(Embarked), y = Fare)) +
  geom_boxplot() +
    scale_x_discrete(labels = c("Cherbourg", "Queenstown", "Southampton", "Unknown")) +
    labs(x = "Port d'embarquement", y = "Tarif", title = "Tarif en fonction du port d'embarquement", fill="Port d'embarquement") +
  theme(text = element_text(size = 15))


