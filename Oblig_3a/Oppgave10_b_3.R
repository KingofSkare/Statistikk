library(datasets)
data("discoveries")

# For å lage et histogram over discoveries med forskjellige verdier for breaks
hist(discoveries, breaks = 10, main = "Histogram over discoveries", xlab = "Antall oppdagelser", ylab = "Antall år")

kappa0 <- 1
tau0 <- 0.1

n1 <- sum(discoveries[1:3]) # Summen av oppdagelser de første 3 årene
t1 <- 3 # Antall år

# Oppdater hyperparametre
kappa1 <- kappa0 + n1
tau1 <- tau0 + t1

lambda_values <- seq(0, 10, length.out = 1000)

n2 <- sum(discoveries[4:25]) # Summen av oppdagelser for de neste 22 årene
t2 <- 22 # Antall år

## Oppdater hyperparametre
kappa2 <- kappa1 + n2
tau2 <- tau1 + t2


n3 <- sum(discoveries[26:100]) # Summen av oppdagelser for de resterende årene
t3 <- 75 # Antall år

# Oppdater hyperparametre
kappa3 <- kappa2 + n3
tau3 <- tau2 + t3


# Forventet verdi av lambda fra den siste posterior
expected_lambda <- kappa3 / tau3

# Bruk for

# Juster intervallet for lambda_values basert på den forventede lambda
lambda_values <- seq(0, expected_lambda * 2, length.out = 1000)

# Beregn de posterior sannsynlighetsfordelingene igjen med det nye intervallet
posterior1 <- dgamma(lambda_values, shape = kappa1, rate = tau1)
posterior2 <- dgamma(lambda_values, shape = kappa2, rate = tau2)
posterior3 <- dgamma(lambda_values, shape = kappa3, rate = tau3)

# Tegn de posterior fordelingene med det nye intervallet
plot(lambda_values, posterior1, type = 'l', col = 'blue', ylim = c(0, max(posterior3)), 
     xlab = "Lambda", ylab = "Sannsynlighet", main = "Posterior for Lambda")
lines(lambda_values, posterior2, col = 'red')
lines(lambda_values, posterior3, col = 'green')
legend("topright", legend=c("Etter 3 år", "Etter 25 år", "Etter 100 år"), col=c("blue", "red", "green"), lty=1)
