# Hyperparameters
k_1 <- 7
t_1 <- 5
k <- 2
l <- 3
m <- 4

# Updated posterior parameters
alpha <- k_1 + k
beta <- 1 / (1/t_1 + 1)

# Probability P(T(+k) <= l)
p_T_leq_l <- pgamma(l, shape = k, rate = alpha/beta)

# Probability P(N+ <= m)
p_N_leq_m <- pnbinom(m, size = alpha, prob = beta)

# Print results
print(paste0("P(T(+k) <= ", l, ") = ", p_T_leq_l))
print(paste0("P(N+ <= ", m, ") = ", p_N_leq_m))
