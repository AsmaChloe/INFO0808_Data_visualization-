titanic <- read.csv("G:/Mon Drive/S8/INFO0808/Projet/INFO0808_Projet/titanic.csv", header = TRUE, sep = ",")

# Reture les lignes avec des valeurs manquantes
titanic <- na.omit(titanic)
titanic <- titanic[titanic$Embarked != "",]

library(ggplot2)

########### VISUALISATION DES DONNEES EN FONCTION DE LA CLASSE

# Visualiser le nombre de survivants en fonction de la classe
ggplot(data = titanic, aes(x = factor(Survived), fill = factor(Pclass))) +
  geom_bar(position = "dodge") +
  scale_x_discrete(labels = c("Non Survivant","Survivant")) +
  geom_text(stat='count', aes(label=..count..), position=position_dodge(width=0.9), vjust=-0.25) +
  scale_fill_brewer(palette = "Set1", labels = c("1ere classe", "2eme classe", "3eme classe")) +
  labs(x = "Survie", y = "Nombre de passagers", title = "Taux de survie en fonction de la classe de cabine", fill="Classe de cabine") +
    theme(text = element_text(size = 15))

#Visualiser l'âge en fonction de la classe
ggplot(titanic, aes(x = Pclass, y = Age, group=Pclass)) +
  geom_boxplot() +
  labs(title = "Age en fonction de la classe", x = "Classe", y = "Age") +
  scale_x_discrete(limits = c("1ere classe", "2eme classe", "3eme classe")) +
  theme(text = element_text(size = 15))

# Visualiser le prix paye en fonction de la classe
ggplot(titanic, aes(x = Pclass, y = Fare, group=Pclass)) +
  geom_boxplot() +
  labs(title = "Prix paye en fonction de la classe", x = "Classe", y = "Prix paye") +
  scale_x_discrete(limits = c("1ere classe", "2eme classe", "3eme classe"))+
  theme(text = element_text(size = 15))

# Visualiser le port d'embarquement en fonction de la classe avec un diagramme en bâtons
ggplot(titanic_complet, aes(x = Pclass, fill = Embarked)) +
  geom_bar() +
  labs(title = "Port d'embarquement en fonction de la classe", x = "Classe", y = "Nombre de personnes") +
  scale_x_discrete(limits = c("1ere classe", "2eme classe", "3eme classe")) +
  scale_fill_brewer(palette = "Set1", labels = c("Cherbourg", "Queenstown", "Southampton"), name = "Port d'embarquement")+
  theme(text = element_text(size = 15))
