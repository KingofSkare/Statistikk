import scipy.stats as stats

# Define prior hyperparameters
a0 = 2
b0 = 2

# Define observation data
successes = 17
failures = 29

# Calculate parameters for Beta distribution (posterior)
a_post = successes + a0
b_post = failures + b0

# Define value of p to calculate probability
p_val = 0.4

# Create Beta distribution object
beta_dist = stats.beta(a_post, b_post)

# Calculate exact probability using integration
exact_prob = beta_dist.pdf(p_val)

# Calculate accurate normal approximation 
mean = a_post / (a_post + b_post)
var = (a_post * b_post) / ((a_post + b_post) ** 2 * (a_post + b_post + 1))

def normal_pdf(x, mean, var):
    """Calculates the probability density function of a normal distribution"""
    pdf = (1 / (stats.norm(mean, var).std() * (2 * 3.14159)**0.5)) * stats.norm(mean, var).pdf(x)
    return pdf

normal_approx = normal_pdf(p_val, mean, var)

# Print results
print("Exact probability P(p) using integration:", exact_prob)
print("Normal approximation of P(p):", normal_approx)
