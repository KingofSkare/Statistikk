library(alr4)

# read.csv funksjon oppgave 1a
data_kvit <- read.csv("rosa_kvit42.csv")
data_groon <- read.csv("rosa_groon42.csv")

# read.csv funksjon oppgave 1b
data_terning <- read.csv("Terning_20.csv")
# regresjons linje terningkast++
regression_model <- lm(Lengde ~ Hoyde, data = data_terning)

#Plotting av regresjons linje og splatterplot
plot(data_terning$Hoyde, data_terning$Lengde, main = "Lengde vs Hoyde", xlab = "Hoyde", ylab = "Lengde", pch = 19)
abline(regression_model, col = "red")

head(fuel2001)
write.csv(fuel2001, "fuel2001.csv")
#


# Definer sekvensen av myntkast
sequence <- "MKMKKKMMMKMMKKKKKMKKMMMMKKKMMMMKKKKMMMKKKKMMMKMKKK"

## Oppgave 24 kapittel4
# A)
# Lengden på sekvensen, som tilsvarer antall kast
n <- nchar(sequence)

# Beregn sannsynligheten
P <- (1/2)^n

# Skriv ut resultatet
print(P)

# B)
# Lengden på sekvensen
n2 <- 50

# Beregn sannsynligheten for den spesifikke sekvensen
P2 <- (1/2)^n2

# Skriv ut resultatet
print(P2)


# C)
# Definer antall kast og antall "K"
n <- 50
k <- 27

# Beregn antall kombinasjoner
combinations <- choose(n, k)

# Skriv ut resultatet
print(combinations)


# D)
total = 2^n
print(total)

# E)
# Definer antall kast (n), antall "K" (k), og suksesssannsynlighet for hvert kast (p)
n <- 50
k <- 27
p <- 1/2

# Beregn binomialkoeffisienten
binom_coeff <- choose(n, k)

# Beregn sannsynligheten for nøyaktig k "K" på n kast
P <- binom_coeff * (p^k) * ((1-p)^(n-k))

# Skriv ut resultatet
print(P)

