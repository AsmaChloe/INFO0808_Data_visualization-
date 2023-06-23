titanic <- read.csv("G:/Mon Drive/S8/INFO0808/Projet/INFO0808_Projet/titanic.csv", header = TRUE, sep = ",")

# Retire les NA
titanic <- na.omit(titanic)
titanic <- titanic[titanic$Embarked != "",]

# Retire les colonnes inutiles
titanic <- titanic[, !(names(titanic) %in%  c("PassengerId", "Name", "Ticket", "Cabin"))]

# Transforme les variables en catégories
titanic$Pclass <- factor(titanic$Pclass)
library(caret)
dummy <- dummyVars(" ~ .", data=titanic)
titanic <- data.frame(predict(dummy, newdata = titanic))

########### MATRICE DE CORRELATION

library(corrplot)
corrplot(cor(titanic), method = "circle", tl.cex = 1.5)