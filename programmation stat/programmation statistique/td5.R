#Exercice 1
par(mfrow=c(1,1))
plot(NA,xlim=c(-5,5),ylim=c(0,1),xlab="X",
     ylab="densité de probabilité",
     main="densités de probabilté\n de lois normales")

# Tracer la densité de probabilité pour chaque simulation
moyennes <- c(0, 0, 0, -2)
sigmas <- c(0.45, 1, 2.25, 0.7)
colors <- c("red", "blue", "green", "orange")
legend_labels <- c()
for (i in 1:length(moyennes)) {
  serie = rnorm(n = 1000, 
                mean = moyennes[i], 
                sd = sigmas[i])
  lines(density(serie), col = colors[i])
  legend_labels <- c(legend_labels, paste("m =", moyennes[i], ",", "s =", sigmas[i]))
}

# Ajouter une légende
legend("topright", legend=legend_labels, col=colors, lwd=2, cex=0.8)

serie= rnorm(n=1e4, mean = 0, sd = 1)

hist(serie, main = "loi normal centrée-réduite",
     probability = TRUE)
lines(density(serie))
median(serie)
quantile(serie)
quantile(serie, 
         probs = seq(from = 0, 
                     to = 1, by = 0.01))

quantile(serie, 
         probs = 0.95)
# environ 1,64  
