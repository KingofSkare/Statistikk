library(datasets)
data(discoveries)
hist(discoveries, breaks=10, main="Histogram of Discoveries", xlab="Number of Discoveries per Year", ylab="Frequency")

# Anta disse er de observerte oppdagelsene for de første 3 årene
observations_1 = c(4, 3, 2)

# Prior hyperparametere
kappa_0 = 1
tau_0 = 0.1

# Oppdater til posterior etter første sett med observasjoner
n_1 = sum(observations_1)  # Totalt antall oppdagelser
t_1 = length(observations_1)  # Antall år

kappa_1 = kappa_0 + n_1
tau_1 = tau_0 + t_1

# For å illustrere, la oss anta at vi har data for de neste 22 årene
# Dette er et hypotetisk eksempel. Erstatt med faktiske data
observations_2 = rep(3, 22)  # Anta et gjennomsnitt på 3 oppdagelser per år

# Oppdater til posterior etter andre sett med observasjoner
n_2 = sum(observations_2)
t_2 = length(observations_2)

kappa_2 = kappa_1 + n_2
tau_2 = tau_1 + t_2

# Tegn de oppdaterte posterior fordelingene
library(ggplot2)
lambda_seq = seq(0, 10, by = 0.1)
posterior_1 = dgamma(lambda_seq, shape = kappa_1, rate = tau_1)
posterior_2 = dgamma(lambda_seq, shape = kappa_2, rate = tau_2)

ggplot() + 
  geom_line(aes(x = lambda_seq, y = posterior_1), color = "blue") +
  geom_line(aes(x = lambda_seq, y = posterior_2), color = "red") +
  labs(x = "Lambda", y = "Density", title = "Posterior distributions of Lambda")
