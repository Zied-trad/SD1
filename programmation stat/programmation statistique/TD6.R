#Exercice 1


df <- read.csv(file = "L:/BUT/SD/Promo 2023/ztrad/progra stat/NBA2014_2015.csv", sep = ",", #pas de ";" dans le seq car c'est une virgule qui separe les colonne 
               header = TRUE, dec = ";")                                                    # mettre le chemin d'acces sans oublier de changer le sens des barre 
 nrow(df)   #il ne s'appelle pas nba mais df
 ncol(df)  #enlever tout les > car inutile 
 colnames(df)  # il manquait un "s" a la fin  
 sqrt(df)   #je ne comprends pas ce qu'il veut sortir 
 df$PERIOD = as.factor(df$PERIOD)  # respecter la facon d'ecrire 
 df$PTS_TYPE = as.factor(df$PTS_TYPE)
 df$SHOOTER = as.factor(df$SHOOTER)     # respecter les majuscules et avoir la meme ecriture 
 
 
 #Exercice 2
 
 
 length(levels(df$PERIOD))
  length(df$PTS_TYPE)
  length(df$SHOOTER)       # bien ecrire le length et les fonctions 
  summary(df)
  sd(df$SHOT_DIST)
       sd(df$SHOT_CLOCK,na.rm = TRUE)   # enlever les NA,pas entre crochet, pas se trompez sur les noms
      
      #combien de tirs manqués/réussis
      table(df$SHOT_RESULTS)
      #les quartiles
      df$SHOT_CLOCK= as.numeric(df$SHOT_CLOCK)
      quantile(df$SHOT_CLOCK ,na.rm = TRUE) # pas la bonne class pour shotclock, et pas mettre de probs au dessus de 1
      #les déciles
      df$CLOSE_DEF_DIST= as.numeric(df$CLOSE_DEF_DIST)
      quantile(df$CLOSE_DEF_DIST, probs = seq(0.1,1, by= 0.1),na.rm=TRUE)  # na, nom fichier, quartile sans s , probs avec une sequence 
      #nombre de matches différents
      liste_game <- unique(df$GAME_ID)
 length(liste_game)  # ne pas se tromper sur les noms 
 #nombre de joueurs différents
 df$SHOOTER = as.factor(df$SHOOTER)
 nlevels(df$SHOOTER)
        #conversion de la variable SHOT_DIST en mètre pour que les européens comprennent nos chiffres
        df$SHOT_DIST= as.numeric(df$SHOT_DIST)
        df$SHOT_DIST_METRE =( df$SHOT_DIST * 0.30)
        #nombre de points qu'a rapporté la tentative (0,2 ou 3)  
        df$PTS_MARQUES <- ifelse(test =  "made", yes = df$PTS_TYPE, no=0)   # respecter la formule 
        #On supprime la variable GAME_RESULT car elle n'est pas utile
        df$GAME_RESULT <- NULL    # manquait un L dans null
        
        #création d'un objet sans la première colonne GAME_ID
        df2 <- df[ ,-1    ]     #mauvaise place de la virgule 
        
#Exercice 3 reste a corriger 
        
        
        #Les 100 tirs réussis ou manqués les plus loin
        rang <- order(df$SHOT_DIST, decreasing = TRUE)
        df3 <- df[ rang,]
        df3 <- df[ 1 : 100, ]
        
        #Les 100 tirs réussis les plus loin
        df4 = subset(df3, SHOT_RESULT = made)
        df4 <- df[ 1 : 100 ]
        
        #Combien de tirs à 3 points a réussi Kobe Bryant ?
        df_kobe = subset(df,SHOT_RESULT = made &
                           PTS_TYPE = 3 & 
                           SHOOTER = "Kobe BRYANT")
        
        dim(df_kobe)
        
        #Le TOP5 des joueurs qui ont marqués le plus de points dans la saison
        df_total <- aggregate(PTS_MARQUES ~ SHOOTER, data = df, FUN = sum)
        df_total_tri <- df_total[-order(df_total$PTS_MARQUES)]
        df_top5 <-  df_total_tri[  5  ,  ]
        
#Exercice 4 reste a corriger 
        
        
        #Des graphiques adaptés selon le type de variable
        
        #construction de la fonction
        build_graph <- function(une_colonne, nom_colonne) {
          if(is.numeric(une_colonne)) {
            print(boxplot(une_colonne, main = nom_colonne))
          }
          else if (as.factor(une_colonne)) {
            tri <- table(une_colonne)
            print(barplot(tri, main = nom_colonne))
          }
          
          #on déroule la fonction sur chaque colonne du data frame.
          
          for (colonne in colnames(df) {
            build_graph(une_colonne = df[colonne , ] , nom_colonne = colone)
          }
        }
  