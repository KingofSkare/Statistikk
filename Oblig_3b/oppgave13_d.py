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