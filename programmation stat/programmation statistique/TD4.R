#Exercice 1
df = read.csv("L:/BUT/SD/Promo 2023/ztrad/progra stat/velov.csv",header = TRUE, dec=",",sep = ";")

summary(df)
df$status=as.factor(df$status)
df$CodePostal = as.factor(df$CodePostal)
summary(df)
df$bornes = ifelse(df$capacity != (df$bikes + df$stands), "KO" , "OK")
table(df$bornes)

#Exercice 2
hist(df$capacity, main = "histogramme de la capacite",xlab = "capacity",col = "red",breaks = 6)
abline(h = 100, col = "blue", lty = 1)

hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     col ="red",
     probability = TRUE,
     xlab = "Capacity",
     ylim = c(0,0.08))
lines(density(df$capacity),lwd=4,col="blue")

#Exercice 3
boxplot(df$capacity,main ="boite a moustache de la capaciter",horizontal = FALSE, outline = FALSE)
moy = mean(df$capacity)
points(moy,col="red", pch = 15 ,cex=2)
par(mfrow=c(1,2)) #fenêtre sur 1 ligne et 2 colonnes
#7ème
df7 = subset(df, CodePostal == "69007")
boxplot(x = df7$bikes, 
        main = "Boxplot nb vélos \n 69007",
        ylim = c(0,40))
#8ème
df8 = subset(df, CodePostal == "69008")
boxplot(x = df8$bikes, 
        main = "Boxplot nb vélos \n 69008",
        ylim = c(0,40))
#C'est plus simple d'analyser les deux graphiques si la borne des ordonnées est la même.
# On remarque que la disponibilité des stations est plus homogènes sur le 8ème.
par(mfrow=c(1,1)) #fenêtre sur 1 ligne et 1 colonne
# Tracer le graphique boxplot
boxplot(formula = bikes ~ bonus,
        data = df, 
        main = "Dispo vélos vs Stations Bonus")
means= tapply(X=df$bikes,INDEX = df$bonus,FUN = function(X) mean(X))
print(means)
points(means,col="red",pch=19)

#Exercice 4
effectif=table(df$bonus)
frequence= prop.table(effectif)
barplot(frequence,main="repartition station",horiz=TRUE)
effectif = table(df$banking, df$bonus)
print(effectif)
barplot(height = effectif,
        main = "Bonus vs Banking",
        xlab = "Station Bonus ?",
        col=c("red","green"))
#On remarque qu'on ne sait pas distinguer les deux modalités car il n'y a pas de légende.
#Préparer les labels
legend_labels <- colnames(frequence)
#Ajouter une légende
legend(x = "topright", 
       legend = legend_labels, 
       fill  = c("red","green"))
#Afficher les fréquences pour vérifier le graphique
print(frequence)
#7
frequence= prop.table(x= effectif,margin=2)
barplot(height = frequence,
        main = "Bonus vs Banking",
        xlab = "Station Bonus ?",
        col = c("red","green"))
#Préparer les labels
legend_labels <- colnames(frequence)
#Ajouter une légende
legend(x = "topright", 
       legend = legend_labels, 
       fill  = c("red","green"))
print(frequence)
#8
pie(x = effectif,
    main = "Répartition du nombre \n de station bonus",
    col = c("yellow","green"))
