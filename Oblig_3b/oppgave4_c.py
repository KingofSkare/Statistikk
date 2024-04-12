import scipy.stats as stats

# Posterior hyperparameters
k1 = 29
T1 = 8
k = 3
l = 1
m = 5

# Calculate parameters for predictive distribution of N_+
lambda_hat = (k1 + k) / (T1 + 1)
lambda_sum = k1 + k

# Calculate parameters for predictive distribution of T_(+k)
lambda_T_sum = lambda_sum * T1

# Calculate predictive distribution for N_+
N_plus_dist = stats.poisson(mu=lambda_sum)

# Calculate predictive distribution for T_(+k)
T_plus_k_dist = stats.gamma(a=lambda_T_sum, scale=1/lambda_sum)

# Calculate probabilities
prob_T_plus_k = T_plus_k_dist.cdf(l)
prob_N_plus = N_plus_dist.cdf(m)

print("Predictive distribution for N_+:")
print(N_plus_dist.pmf(range(m+1)))  # PMF for N_+
print("Predictive distribution for T_(+k):")
print(T_plus_k_dist.pdf(range(l+1)))  # PDF for T_(+k)
print("P(T_(+k) <= l):", prob_T_plus_k)
print("P(N_+ <= m):", prob_N_plus)