import numpy as np
from scipy.stats import norm, invgamma, t

# Priorer
k0 = 0
S0 = 0
v0 = -1
B0 = 0

# Observasjoner
n = 8
Sx = 31832
SSx = 82818
z = 4000
s = 100

# Posteriort for tau
a_tau = v0 / 2 + n / 2
b_tau = (S0 + SSx + (z - k0)**2 * s) / (2 * s)

# Posteriort for X+  (et eksempelpunkt, må utvides for flere prediksjoner)
x_new = 5  # Eksempelpunkt for prediksjon

def kernel(x1, x2, params):
    """Squared Exponential kernel"""
    sigma_f = np.exp(params[0])
    l = np.exp(params[1])
    return sigma_f**2 * np.exp(-((x1 - x2)**2) / (2 * l**2)) 

X = np.array([1, 2, 3, 4, 5, 6, 7, 8])  # Ditt eksempel datasett
y = np.array([12, 15, 9, 17, 21, 16, 18, 11])  # Ditt eksempel datasett

# Beregn K(X, X), K(X+, X), K(X+, X+) 
K_XX = np.array([[kernel(xi, xj, [S0, v0]) for xj in X] for xi in X]) + B0 * np.eye(n) 
K_XplusX = np.array([kernel(x_new, xi, [S0, v0]) for xi in X])
K_XplusXplus = kernel(x_new, x_new, [S0, v0]) + B0

mu_Xplus = K_XplusX @ np.linalg.inv(K_XX) @ y
sigma_Xplus_sq =  K_XplusXplus - K_XplusX @ np.linalg.inv(K_XX) @ K_XplusX.T

# Sannsynligheter
print("P(my < z):", 1.0)  
print("P(sigma < s):", t.cdf(s, df=2*a_tau, loc=b_tau/a_tau, scale=np.sqrt(b_tau/a_tau * (a_tau-2))))
print("P(X+ < z):", norm.cdf(z, loc=mu_Xplus, scale=np.sqrt(sigma_Xplus_sq)))
