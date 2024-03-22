# Installere nødvendige pakker om de ikke allerede er installert
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("binom")) install.packages("binom")

# Laste inn nødvendige pakker
library(ggplot2)
library(binom)

# 1. Plotte prior sannsynlighetsfordeling for p
p_values <- seq(0, 1, length.out = 1000)
a0 <- 0.5
b0 <- 0.5
prior_pdf <- dbeta(p_values, a0, b0)

ggplot(data.frame(p=p_values, density=prior_pdf), aes(x=p, y=density)) +
  geom_line(color="blue") +
  geom_area(fill="blue", alpha=0.1) +
  labs(title="Prior Probability Distribution for p", x="p", y="Density")

# Funksjon for å simulere Bernoulli-forsøk og beregne posterior
simulate_and_plot_posterior <- function(n, p_real=0.349, a0=0.5, b0=0.5) {
  trials <- rbinom(n, 1, p_real)
  k <- sum(trials)  # Antall suksesser
  l <- n - k  # Antall feil
  
  a1 <- a0 + k
  b1 <- b0 + l
  
  posterior_pdf <- dbeta(p_values, a1, b1)
  mu_p <- a1 / (a1 + b1)
  sigma_p <- sqrt(a1 * b1 / ((a1 + b1)^2 * (a1 + b1 + 1)))
  
  ggplot(data.frame(p=p_values, density=posterior_pdf), aes(x=p, y=density)) +
    geom_line(color="red") +
    geom_area(fill="red", alpha=0.1) +
    geom_vline(xintercept=mu_p, color="green", linetype="dashed") +
    geom_vline(xintercept=mu_p + sigma_p, color="pink", linetype="dashed") +
    geom_vline(xintercept=mu_p - sigma_p, color="pink", linetype="dashed") +
    labs(title=paste("Posterior Probability Distribution for p with n =", n), x="p", y="Density")
  
  return(list(a1=a1, b1=b1, mu_p=mu_p, sigma_p=sigma_p))
}

# Simulere for n=10, 100, 1000, 10000
n_values <- c(10, 100, 1000, 10000)
lapply(n_values, function(n) {
  simulate_and_plot_posterior(n)
})

# Prediktiv sannsynlighet for 2 suksesser i 5 forsøk og 4 feil før 3 suksesser
calculate_predictive_probabilities <- function(mu_p) {
  prob_2_successes_in_5 <- dbinom(2, 5, mu_p)
  prob_4_failures_before_3_successes <- dnbinom(4, 3, mu_p)
  
  return(list(prob_2_successes_in_5=prob_2_successes_in_5,
              prob_4_failures_before_3_successes=prob_4_failures_before_3_successes))
}

# Bruker forventningsverdien av p fra et av de tidligere resultatene
mu_p_example <- 0.349  # Dette bør erstattes med et faktisk beregnet mu_p fra en av simuleringene
calculate_predictive_probabilities(mu_p_example)

