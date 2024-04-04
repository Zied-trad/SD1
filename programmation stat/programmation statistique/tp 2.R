#Exercice 1

df<- read.csv("fao.csv",header=TRUE, dec=",",sep=";")

length(df$Nom)

summary(df)

#exercice 2

sum(df$Dispo_alim)

sd(df$Prod_viande,TRUE)
sd(df$Import_viande,TRUE)

median(df$Prod_viande,TRUE)

quantile(df$Dispo_alim)

quantile(df$Import_viande,probs = seq(0.10,0.90,by=0.10) )

#Exercice 3

f=order(df$Population,decreasing = TRUE)
resultat= df[f,c("Nom","Population")]
ff=head(resultat,n=5)
View(ff)

d=order(df$Population,decreasing = FALSE)
resultats= df[d,c("Nom","Population")]
dd=head(resultats,n=5)
View(dd)

p=order(df$Population,decreasing = TRUE)
result= df[p,c("Nom","Prod_viande")]
pp=head(result,n=5)
View(pp)

p=order(df$Population,decreasing = TRUE)
result= df[p,c("Nom","Import_viande")]
pp=head(result,n=5)
View(pp)




