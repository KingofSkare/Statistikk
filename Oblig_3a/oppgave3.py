from scipy.stats import t
import numpy as np

# Sample data
n = 25  # Number of measurements
x_bar = 49.19  # Average capacitance measured, in μF
s = 2.15  # Sample standard deviation of the capacitance, in μF

# Parameters for the t-distribution
df = n - 1  # Degrees of freedom
scale = s / np.sqrt(n)  # Standard error of the mean

# Calculate the probability that a random capacitor will have a capacitance > 50 μF
# This calculation uses the cumulative distribution function (CDF) of the t-distribution
prob_over_50 = 1 - t.cdf(50, df=df, loc=x_bar, scale=scale)

print(f"Probability of a capacitor having > 50 μF capacitance: {prob_over_50*100:.2f}%")




