library(datasets)
discoveries <- discoveries

# Lag histogram med forskjellige verdier for k
k_values <- c(5, 10, 15, 20)
for (k in k_values) {
  hist(discoveries, breaks=k, main=paste("Histogram med", k, "brudd"))
}
kappa0 <- 1
tau0 <- 0.1

n1 <- sum(discoveries[1:3]) # Summen av oppdagelser de første 3 årene
t1 <- 3 # Antall år

# Oppdater hyperparametre
kappa1 <- kappa0 + n1
tau1 <- tau0 + t1


lambda_values <- seq(0, 10, length.out = 1000)
posterior1 <- dgamma(lambda_values, shape = kappa1, rate = tau1)
plot(lambda_values, posterior1, type = 'l', col = 'blue', xlab = "Lambda", ylab = "Sannsynlighet", main = "Posterior for Lambda etter 3 år")


n2 <- sum(discoveries[4:25]) # Summen av oppdagelser for de neste 22 årene
t2 <- 22 # Antall år

# Oppdater hyperparametre
kappa2 <- kappa1 + n2
tau2 <- tau1 + t2

# Tegn den nye posterior fordelingen
posterior2 <- dgamma(lambda_values, shape = kappa2, rate = tau2)
lines(lambda_values, posterior2, col = 'red')



n3 <- sum(discoveries[26:100]) # Summen av oppdagelser for de resterende årene
t3 <- 75 # Antall år

# Oppdater hyperparametre
kappa3 <- kappa2 + n3
tau3 <- tau2 + t3

# Tegn den nye posterior fordelingen
posterior3 <- dgamma(lambda_values, shape = kappa3, rate = tau3)
lines(lambda_values, posterior3, col = 'green')

# Forventet verdi av lambda fra den siste posterior
expected_lambda <- kappa3 / tau3

# Bruk for


