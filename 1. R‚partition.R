# Charger les packages nécessaires
library(ggplot2)
library(gridExtra)

# Charger le dataset
titanic <- read.csv("G:/Mon Drive/S8/INFO0808/Projet/INFO0808_Projet/titanic.csv", header = TRUE, sep = ",")

#Retire les NA
titanic <- na.omit(titanic)
titanic <- titanic[titanic$Embarked != "",]

# Repartition des passagers par sexe
g1 <- ggplot(data = titanic, aes(x = Sex)) +
  geom_bar() +
  labs(x = "Sexe", y = "Nombre de passagers", title = "Repartition des passagers par sexe") +
  scale_x_discrete(labels = c("Femme", "Homme")) +
  theme(text = element_text(size = 15))
g1

# Repartition des passagers par classe de cabine
g2 <- ggplot(data = titanic, aes(x = Pclass)) +
  geom_bar() +
  scale_x_continuous(breaks = c(1,2,3), labels = c("1ere classe", "2eme classe", "3eme classe")) +
  labs(x = "Classe de cabine", y = "Nombre de passagers", title = "Repartition des passagers par classe de cabine") +
    theme(text = element_text(size = 15))
g2

# Repartition des passagers par age
g3 <- ggplot(data = titanic, aes(x = Age)) +
  geom_boxplot() +
  labs(x = "Age", y = "Nombre de passagers", title = "Repartition des passagers par age") +
    theme(text = element_text(size = 15))
g3

# Repartition des passagers par rapport au nb de freres, soeurs, epoux a bord
g4 <- ggplot(data = titanic, aes(x = SibSp)) +
  geom_bar() +
  labs(x = "Nombre de freres, soeurs, epoux", y = "Nombre de passagers", title = "Repartition des passagers par rapport au nb de freres, soeurs, epoux a bord") +
    theme(text = element_text(size = 15))
g4

# Repartition des passagers par rapport au nombre de parents, enfants a bord
g5 <- ggplot(data = titanic, aes(x = Parch)) +
  geom_bar() +
  labs(x = "Nombre de parents, enfants", y = "Nombre de passagers", title = "Repartition des passagers par rapport au nombre de parents, enfants a bord") +
    theme(text = element_text(size = 15))
g5

# Repartition des passagers par rapport au prix du billet
g6 <- ggplot(data = titanic, aes(x = Fare)) +
  geom_histogram(binwidth = 10) +
  labs(x = "Prix du billet", y = "Nombre de passagers", title = "Repartition des passagers par rapport au prix du billet") +
    theme(text = element_text(size = 15))
g6

# Repartition des passagers par rapport au port d'embarquement
g7 <- ggplot(data = titanic, aes(x = Embarked)) +
  geom_bar() +
  scale_x_discrete(labels = c("Cherbourg", "Queenstown", "Southampton")) +
  labs(x = "Port d'embarquement", y = "Nombre de passagers", title = "Repartition des passagers par rapport au port d'embarquement") +
    theme(text = element_text(size = 15))
g7

# Repartition des passagers par rapport au nombre de survivants
g8 <- ggplot(data = titanic, aes(x = Survived))+
  geom_bar() +
  scale_x_continuous(breaks = c(0,1), labels = c("Non Survivant", "Survivant")) +
  labs(x = "Survivant", y = "Nombre de passagers", title = "Repartition des passagers par rapport au nombre de survivants") +
    theme(text = element_text(size = 15))
g8

# Afficher les graphiques en tant que subplot
grid.arrange(g1, g2, g3, g4, g5, g6, g7, g8, ncol = 2)