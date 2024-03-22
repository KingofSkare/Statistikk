import numpy as np
from scipy.stats import norm, invgamma

# Antatte observasjonsdata og hyperparametere
n = 8  # antall observasjoner
Sx = 31832  # sum av observasjoner
SSx = 82818  # sum av observasjonenes kvadrater
x_bar = Sx / n  # sample mean
z = 4000
s = 100

# Oppdatering av hyperparametere basert på antatte gyldige verdier
k0 = 1
v0 = 2
mu0 = 0
sigma2_0 = 1

# Beregning av posteriore hyperparametere
k_n = k0 + n
v_n = v0 + n
mu_n = (k0 * mu0 + n * x_bar) / (k0 + n)
sigma2_n = (v0 * sigma2_0 + SSx + k0 * mu0**2 - k_n * mu_n**2) / v_n

# Prediktiv fordeling for en ny observasjon X+
# Bruker normalfordelingens egenskaper og invgamma for å representere usikkerheten i sigma^2

# Beregning av P(mu < z) og P(sigma < s)
p_mu_less_than_z = norm.cdf(z, loc=mu_n, scale=np.sqrt(sigma2_n / k_n))
p_sigma_less_than_s = invgamma.cdf(s**2, a=v_n/2, scale=v_n * sigma2_n / 2)

print(f"P(mu < {z}): {p_mu_less_than_z}")
print(f"P(sigma < {s}): {p_sigma_less_than_s}")
