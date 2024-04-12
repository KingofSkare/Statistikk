import numpy as np
from scipy.stats import gamma, poisson

# Posterior hyperparameters
k1 = 29
T1 = 8
k = 3
l = 1
m = 5

# Calculate predictive distribution for N_+
alpha_N = k1 + k
beta_N = T1 + 1
N_plus_pred = gamma.rvs(alpha_N, scale=1/beta_N)

# Calculate predictive distribution for T_(+k)
alpha_T = k1 + k
beta_T = T1 + l
T_plus_k_pred = gamma.rvs(alpha_T, scale=1/beta_T)

# Calculate P(T_(+k) <= l)
p_T = gamma.cdf(l, alpha_T, scale=1/beta_T)

# Calculate P(N_+ <= m)
p_N = poisson.cdf(m, N_plus_pred)

print("Predictive distribution for N_+: ", N_plus_pred)
print("Predictive distribution for T_(+k): ", T_plus_k_pred)
print("P(T_(+k) <= l): ", p_T)
print("P(N_+ <= m): ", p_N)