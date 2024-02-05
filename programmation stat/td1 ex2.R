vecteur= c(seq(1,5))
class(vecteur)
vecteur[3]
v1=c(1,2,3,4,5)
v2= v1+3
v3=c(seq(1,6))
v4=v3^2
v5=v4/2
vecteur<-c("lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche")
class(vecteur)
vecteur[c(2,7)]

vecteur <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
class(vecteur)

vecteur<- c(2.5,6.9,5.6,2.6,4.8) #on peut donner le meme nom car il faut d'abord selectionner pour faire run
class(vecteur)
vecteur[-3]

vecteur<- c("janvier","fevrier","mars","avril","mai","mai","juin","juillet","aout","septembre","octobre","novembre","decembre")
class(vecteur)
vecteur[c(1,2,3)] #pour en afficher que 3

vecteur<-c(-2,-8,-3,-5,-11,-69,-89)
class(vecteur)
vecteur[c(7,1)]

vecteur=c("pasteque","fraise","peche","orange","banane")
class(vecteur)
vecteur[c(-1,-2)] # le moins c'est pour ne pas afficher

vecteur=c(NA,NA,NA,4)
class(vecteur)


vecteur=c(seq(1,10))
length(vecteur)

vecteur=seq(10,1,by=-1)

vecteur=rep(c("A","B","C"),3)

rm(list = ls())  # pour effacer tout les objet 


