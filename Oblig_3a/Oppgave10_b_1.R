library(datasets)

# Histogram av antall oppdagelser
for (k in c(5, 10, 15)) {
  hist(discoveries, breaks=k, main=paste("Histogram med", k, "breaks"))
}

# Bayesiansk analyse av oppdagelsesrate

# Nøytrale prior hyperparametre
kappa0 <- 1
tau0 <- 1

# Første 3 år
n1 <- sum(discoveries[1:3])
t1 <- 3
kappa1 <- kappa0 + n1
tau1 <- tau0 + t1

# Posterior fordeling for lambda (første 3 år)
plot(function(x) dpois(x, lambda=kappa1/tau1), 0, 10, main="Posterior fordeling for lambda (første 3 år)")

# Neste 22 år
n2 <- sum(discoveries[4:25])
t2 <- 22
kappa2 <- kappa1 + n2
tau2 <- tau1 + t2

# Posterior fordeling for lambda (neste 22 år)
plot(function(x) dpois(x, lambda=kappa2/tau2), 0, 10, main="Posterior fordeling for lambda (neste 22 år)")

# Resterende 75 år
n3 <- sum(discoveries[26:100])
t3 <- 75
kappa3 <- kappa2 + n3
tau3 <- tau2 + t3

# Posterior fordeling for lambda (resterende 75 år)
plot(function(x) dpois(x, lambda=kappa3/tau3), 0, 10, main="Posterior fordeling for lambda (resterende 75 år)")

# Sammenligning av alle tre
plot(function(x) dpois(x, lambda=kappa1/tau1), 0, 10, col="blue", lwd=2, main="Sammenligning av posterior fordelinger")
lines(function(x) dpois(x, lambda=kappa2/tau2), col="green", lwd=2)
lines(function(x) dpois(x, lambda=kappa3/tau3), col="red", lwd=2)
legend("topright", c("Første 3 år", "Neste 22 år", "Resterende 75 år"), col=c("blue", "green", "red"), lwd=2)

# Sannsynlighet for 5 nye oppdagelser
P_5 <- ppois(5, lambda=kappa3/tau3)

print(paste("Sannsynlighet for 5 nye oppdagelser:", P_5))
