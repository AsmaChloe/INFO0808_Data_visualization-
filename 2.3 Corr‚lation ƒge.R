titanic <- read.csv("G:/Mon Drive/S8/INFO0808/Projet/INFO0808_Projet/titanic.csv", header = TRUE, sep = ",")

titanic <- na.omit(titanic)
library(ggplot2)

########### VISUALISATION DES DONNEES EN FONCTION DE l'AGE
# Taux de survie en fonction de l'age
ggplot(data = titanic, aes(x = Age, y = ..count.., fill = factor(Survived))) +
  geom_histogram(binwidth = 5) +
  stat_bin(aes(label=..count..), binwidth=5, geom="text", position=position_stack(vjust=0.5)) +
  scale_fill_brewer(palette = "Set1", labels = c("Non Survivant","Survivant"), name = "Survie") +
  labs(x = "Age", y = "Nombre de passagers", title = "Taux de survie en fonction de l'age", fill="Survie") +
    theme(text = element_text(size = 15))

# Visualiser l'age en fonction de si la personn voyageait seule ou non
ggplot(data = titanic_complet, aes(x = Age, y = ..count.., fill = factor(alone))) +
  geom_histogram(binwidth = 5) +
  stat_bin(aes(label=..count..), binwidth=5, geom="text", position=position_stack(vjust=0.5)) +
  scale_fill_brewer(palette = "Set1", labels = c("Voyage en famille", "Voyage seul"), name = "Voyage ?") +
  labs(title = "Age des passagers en fonctions de s'ils voyagent seuls ou non", x = "Age", y = "Nombre de personnes") +
  theme(text = element_text(size = 15))
