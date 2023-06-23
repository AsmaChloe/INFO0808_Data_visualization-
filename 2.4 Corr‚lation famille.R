titanic <- read.csv("G:/Mon Drive/S8/INFO0808/Projet/INFO0808_Projet/titanic.csv", header = TRUE, sep = ",")

titanic <- na.omit(titanic)

########### VISUALISATION DES DONNEES EN FONCTION DU FAIT D'ETRE EN FAMILLE OU NON
library(ggplot2)
# Survie en fonction du fait si le passager est seul ou non ; Si le passager est seul, alors SibSp = 0 et Parch = 0 sinon SibSp > 0 ou Parch > 0
titanic$alone <- ifelse(titanic$SibSp == 0 & titanic$Parch == 0, 1, 0)
ggplot(data = titanic, aes(x = factor(Survived), fill = factor(alone))) +
  geom_bar() +
  scale_x_discrete(labels = c("Non Survivant","Survivant")) +
  geom_text(stat='count', aes(label=..count..), position=position_stack(vjust=0.5)) +
  scale_fill_brewer(palette = "Set1", labels = c("En famille", "Seul")) +
  labs(x = "Survie", y = "Nombre de passagers", title = "Taux de survie en fonction du fait si le passager est seul ou non", fill="Accompagne ?") +
    theme(text = element_text(size = 15))

# Tarif en fonction du fait si le passager est seul ou non
ggplot(titanic, aes(x = factor(alone), y = Fare, group=factor(alone))) +
  geom_boxplot() +
  labs(title = "Prix en fonction de si le passager est seul ou non", x = "Accompagne ?", y = "Prix du billet") +
  scale_x_discrete(labels = c("En famille", "Seul")) +
  theme(text = element_text(size = 15))
