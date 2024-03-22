# Installer nødvendige pakker hvis ikke allerede installert
# install.packages("stats")

# Last inn nødvendige pakker
library(stats)

# Antatte observasjonsdata og hyperparametere
n <- 8
Sx <- 31832
SSx <- 82818
x_bar <- Sx / n
z <- 4000
s <- 100

# Oppdatering av hyperparametere basert på antatte gyldige verdier
k0 <- 1
v0 <- 2
mu0 <- 0
sigma2_0 <- 1

# Beregning av posteriore hyperparametere
k_n <- k0 + n
v_n <- v0 + n
mu_n <- (k0 * mu0 + n * x_bar) / (k0 + n)
sigma2_n <- (v0 * sigma2_0 + SSx + k0 * mu0^2 - k_n * mu_n^2) / v_n

# Korrekt beregning av P(mu < z)
p_mu_less_than_z <- pnorm(z, mean=mu_n, sd=sqrt(sigma2_n / k_n))

# Korrigert beregning av P(sigma < s) ved å bruke pgamma for invers-gammafordelingen
p_sigma_less_than_s <- 1 - pgamma(1 / (s^2), shape = v_n / 2, rate = (v_n * sigma2_n) / 2)

# Skriv ut resultatene
print(paste("P(mu <", z, "):", p_mu_less_than_z))
print(paste("P(sigma <", s, "):", p_sigma_less_than_s))

