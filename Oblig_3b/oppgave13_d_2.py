import math

# Prior hyperparameters
k_0 = 3
T_0 = 73

# Observed data
n = 6
t = 119

# Calculate posterior hyperparameters
k_posterior = k_0 + n
T_posterior = T_0 + t

# Calculate posterior for lambda
lambda_posterior = k_posterior / T_posterior

# Print the posterior for lambda
print(f"The posterior for lambda is: {lambda_posterior}")
# Calculate the posterior distribution for lambda
import scipy.stats as stats

posterior_distribution = stats.gamma(a=k_posterior, scale=1/T_posterior)

# Calculate the posterior mean and standard deviation
posterior_mean = posterior_distribution.mean()
posterior_std = posterior_distribution.std()

# Print the posterior mean and standard deviation
print(f"The posterior mean for lambda is: {posterior_mean}")
print(f"The posterior standard deviation for lambda is: {posterior_std}")