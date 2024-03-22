# Priorer
k0 <- 0
S0 <- 0
v0 <- -1
B0 <- 0

# Observasjoner
n <- 8
Sx <- 31832
SSx <- 82818
z <- 4000
s <- 100

# Posteriort for  tau
a_tau <- v0 / 2 + n / 2
b_tau <- (S0 + SSx + (z - k0)^2 * s) / (2 * s)

# Posteriort for X+ (ett eksempelpunkt, må utvides for flere)
x_new <- 5  # Eksempelpunkt for prediksjon

kernel <- function(x1, x2, params) {
  # Squared Exponential kernel
  sigma_f <- exp(params[1])
  l <- exp(params[2])
  sigma_f^2 * exp(-(x1 - x2)^2 / (2 * l^2))
}

X <- c(1, 2, 3, 4, 5, 6, 7, 8)  
y <- c(12, 15, 9, 17, 21, 16, 18, 11)  

# Beregn K(X, X), K(X+, X), K(X+, X+)
K_XX <- outer(X, X, kernel, params=c(S0, v0)) + B0 * diag(n)
K_XplusX <- sapply(X, kernel, x2=x_new, params=c(S0, v0))
K_XplusXplus <-  kernel(x_new, x_new, params=c(S0, v0)) + B0

mu_Xplus <- K_XplusX %*% solve(K_XX) %*% y
sigma_Xplus_sq <-  K_XplusXplus - t(K_XplusX) %*% solve(K_XX) %*% K_XplusX

# Sannsynligheter
print(paste0("P(my < z): ", 1.0)) 
print(paste0("P(sigma < s): ", pt(s, df=2*a_tau, lower.tail=TRUE, scale=sqrt(b_tau/(a_tau * (a_tau-2)))))) 
print(paste0("P(X+ < z): ", pnorm(z, mean=mu_Xplus, sd=sqrt(sigma_Xplus_sq))))

