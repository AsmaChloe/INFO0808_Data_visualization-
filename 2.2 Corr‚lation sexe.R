titanic <- read.csv("G:/Mon Drive/S8/INFO0808/Projet/INFO0808_Projet/titanic.csv", header = TRUE, sep = ",")

titanic <- na.omit(titanic)
library(ggplot2)

########### VISUALISATION DES DONNEES EN FONCTION DU SEXE
# Taux de survie en fonction du sexe
ggplot(data = titanic, aes(x = factor(Survived), fill = factor(Sex))) +
  geom_bar() +
  scale_x_discrete(labels = c("Non Survivant","Survivant")) +
  geom_text(stat='count', aes(label=..count..), position=position_stack(vjust=0.5)) +
  scale_fill_brewer(palette = "Set1", labels = c("Femme", "Homme")) +
  labs(x = "Survie", y = "Nombre de passagers", title = "Taux de survie en fonction du sexe", fill="Sexe")+
  theme(text = element_text(size = 15))

# Visualiser l'âge en fonction du sexe
ggplot(titanic, aes(x = Sex, y=Age, group = Sex))+
  geom_boxplot() +
  scale_x_discrete(labels = c("Femme", "Homme")) +
  labs(title = "Age en fonction du sexe", x = "Sexe", y = "Age") +
  theme(text = element_text(size = 15))

# Visualisation de si la personne voyageait seule (SibSp==0 et Parch==0) ou non selon le sexe
titanic$alone <- ifelse(titanic$SibSp == 0 & titanic$Parch == 0, 1, 0)
ggplot(titanic, aes( x=factor(alone))) +
  geom_bar() +
  facet_wrap(~Sex, labeller = labeller("female"="femme", "male"="homme")) +
  scale_x_discrete(labels = c("Voyage en famille", "Voyage seul")) +
  labs(title = "Nombre de personnes voyageant seules en fonction du sexe", x = "Voyage seul", y = "Nombre de personnes") +
  theme(text = element_text(size = 15))
