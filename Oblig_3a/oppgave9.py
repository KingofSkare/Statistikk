from scipy.stats import gamma

# Parameters of our posterior distribution
alpha = 157
beta = 100

# Calculate the probabilities
prob_less_equal_1_8= gamma.cdf(1.8, alpha, scale=1 / beta)
prob_less_equal_1_4 = gamma.cdf(1.4, alpha, scale=1 / beta)

prob_between_1_4_1_8 = prob_less_equal_1_8 - prob_less_equal_1_4

print(f"P(1.4 <= lambda <= 1.8) = {prob_between_1_4_1_8:.4f}")




alpha = 157
beta = 100
lambda_val = 2

probability = gamma.pdf(lambda_val, a=alpha, scale=1 / beta)

print(f"P(lambda = {lambda_val}) = {probability:.4f}")


lower_bound = 1.5
upper_bound = 2.5

probability = gamma.cdf(upper_bound, a=alpha, scale=1 / beta) - gamma.cdf(lower_bound, a=alpha, scale=1 / beta)

print(f"P({lower_bound} < lambda < {upper_bound}) = {probability:.4f}") 
