import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import beta

# Definerer Jeffreys’ prior hyperparametere for en Bernoulli-prosess
a0, b0 = 0.5, 0.5

# Genererer en rekke p-verdier fra 0 til 1
p_values = np.linspace(0, 1, 1000)

# Beregner prior sannsynlighetsfordeling for p
prior_pdf = beta.pdf(p_values, a0, b0)

# Plotter prior sannsynlighetsfordeling for p
plt.figure(figsize=(10, 6))
plt.plot(p_values, prior_pdf, label='Prior Distribution of p', color='blue')
plt.fill_between(p_values, prior_pdf, color='blue', alpha=0.1)
plt.xlabel('p')
plt.ylabel('Density')
plt.title('Prior Probability Distribution for p')
plt.legend()
plt.grid(True)
plt.show()



# Funksjon for å simulere Bernoulli-forsøk og beregne posterior distribusjon
def simulate_and_plot_posterior(n, p_real=0.349, a0=0.5, b0=0.5):
    # Simulere n Bernoulli-forsøk
    trials = np.random.binomial(1, p_real, n)
    k = np.sum(trials)  # Antall suksesser
    l = n - k  # Antall feil

    # Beregne posterior hyperparametere
    a1 = a0 + k
    b1 = b0 + l

    # Beregne posterior sannsynlighetsfordeling for p
    posterior_pdf = beta.pdf(p_values, a1, b1)
    
    # Beregner forventet verdi og standardavvik for den posterior fordelingen
    mu_p = a1 / (a1 + b1)
    sigma_p = np.sqrt(a1 * b1 / ((a1 + b1) ** 2 * (a1 + b1 + 1)))

    # Plotter posterior sannsynlighetsfordeling for p
    plt.figure(figsize=(10, 6))
    plt.plot(p_values, posterior_pdf, label=f'Posterior Distribution of p (n={n})', color='red')
    plt.fill_between(p_values, posterior_pdf, color='red', alpha=0.1)
    plt.axvline(mu_p, color='green', linestyle='--', label=r'$\mu_p = E[p]$')
    plt.axvline(mu_p - sigma_p, color='pink', linestyle='--', label=r'$\mu_p - \sigma_p$')
    plt.axvline(mu_p + sigma_p, color='pink', linestyle='--', label=r'$\mu_p + \sigma_p$')
    plt.xlabel('p')
    plt.ylabel('Density')
    plt.title(f'Posterior Probability Distribution for p with n={n}')
    plt.legend()
    plt.grid(True)
    plt.show()

    return (a1, b1, mu_p, sigma_p)

# Verdiene av n vi skal simulere for
n_values = [10, 100, 1000, 10000]

# Gjennomfører simulering og plotting for n=10 som et eksempel først
simulate_and_plot_posterior(n=10)



# Posterior resultater for n=100, 1000, 10000
posterior_results = {}
for n in n_values[1:]:  # Starter fra det andre elementet siden vi allerede har gjort n=10
    posterior_results[n] = simulate_and_plot_posterior(n)

posterior_results




from scipy.stats import binom, nbinom

# Definerer funksjon for å beregne prediktive sannsynligheter
def predictive_probabilities(mu_p, scenario):
    if scenario == '2_successes_in_5_trials':
        # Beregner sannsynligheten for 2 suksesser i 5 forsøk
        return binom.pmf(2, 5, mu_p)
    elif scenario == '4_failures_before_3_successes':
        # Beregner sannsynligheten for 4 feil før 3 suksesser
        return nbinom.pmf(4, 3, mu_p)

# Beregner prediktive sannsynligheter for scenario 1: 2 suksesser i 5 forsøk
pred_probs_2_successes = {n: predictive_probabilities(result[2], '2_successes_in_5_trials') for n, result in posterior_results.items()}

# Beregner prediktive sannsynligheter for scenario 2: 4 feil før 3 suksesser
pred_probs_4_failures = {n: predictive_probabilities(result[2], '4_failures_before_3_successes') for n, result in posterior_results.items()}

(pred_probs_2_successes, pred_probs_4_failures)



# Sanne verdien av p
p_true = 0.349

# Beregner direkte prediktive sannsynligheter basert på den sanne p-verdien
direct_pred_prob_2_successes = predictive_probabilities(p_true, '2_successes_in_5_trials')
direct_pred_prob_4_failures = predictive_probabilities(p_true, '4_failures_before_3_successes')

(direct_pred_prob_2_successes, direct_pred_prob_4_failures)
