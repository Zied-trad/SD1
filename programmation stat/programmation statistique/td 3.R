#Exercice 1 TD 3

library(readxl)
pokemon <- read_excel(path ="L:/BUT/SD/Promo 2023/ztrad/progra stat/pokemon.xlsx",sheet = "pokemon")

dim(pokemon)      #pour avoir le nombre de ligne et colonne du fichier
nrow(pokemon)
ncol(pokemon)

summary(pokemon)

pokemon$generation=as.factor(pokemon$generation)
pokemon$type=as.factor(pokemon$type)
pokemon$is_legendary=as.factor(pokemon$is_legendary)

summary(pokemon)

med=median(pokemon$attack)
pokemon$attack_group = ifelse(pokemon$attack >= med,"Attack+","Attack-")
pokemon$attack_group=as.factor(pokemon$attack_group)
summary(pokemon)

pokemon$water_fire=ifelse(pokemon$type %in% c("water","fire"),"yes","no")
pokemon$water_fire=as.factor(pokemon$water_fire)
summary(pokemon)

quar3_attack=quantile(pokemon$attack,probs = 0.75)
quar3_def = quantile(pokemon$defense,probs = 0.75)       # avoir le troisieme quartile et cree une colonne
quar3_speed = quantile(pokemon$speed,probs = 0.75)
pokemon$best = ifelse(pokemon$attack > quar3_attack &
                        pokemon$defense > quar3_def &
                        pokemon$speed > quar3_speed , "yes","no")
pokemon$best <-as.factor(pokemon$best)
summary(pokemon$best)

requete = subset(pokemon, is.na(weight_kg))
View(requete)

requete = subset (pokemon, !is.na(weight_kg))
View(requete)

