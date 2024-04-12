library(tidyverse)
library(rmarkdown)
library(metRology)

# Definer stien til mappen med CSV-filer
file_path <- "/home/ingejohan/statistikk/Oblig_3b/attachments"

# Finner alle CSV-filene i mappen
files <- list.files(path = file_path, pattern = "\\.csv$", full.names = TRUE)

# Sjekker at det er filer ?? arbeide med
if(length(files) == 0) {
  stop("Ingen filer funnet i den angitte mappen.")
}

# Importerer og standardiserer strekktypen for hvert datasett
data_list <- lapply(files, function(file) {
  file_name <- tools::file_path_sans_ext(basename(file))
  strekktype_standardized <- tolower(gsub("[0-9()]", "", file_name))
  
  df <- read_csv(file, col_types = cols()) %>%
    mutate(Strekktype = strekktype_standardized)
  
  return(df)
})

# Sjekker at listen med datasett ikke er tom etter import
if(length(data_list) == 0) {
  stop("Ingen datasett ble importert.")
}

# Definerer den ??nskede rekkef??lgen for sortering basert p?? strekktype
desired_order <- c("laban", "brynild", "seigmann") # Juster listen etter behov

# Sorterer datasettene basert p?? den forh??ndsdefinerte rekkef??lgen
strekktype_positions <- sapply(data_list, function(df) match(df$Strekktype[1], desired_order))
data_list_sorted <- data_list[order(strekktype_positions)]

# (Valgfritt) Skriver ut de f??rste radene i hvert sortert datasett for ?? verifisere
#lapply(data_list_sorted, head)

# Angir mappen hvor de sorterte datasettene skal lagres
#output_folder <- "C:\\Users\\Emila\\OneDrive - Universitetet i Agder\\Documents\\statestikk\\oblig 3a\\seigmann"

# Lagrer hvert datasett som en ny CSV-fil i den definerte mappen
#lapply(seq_along(data_list_sorted), function(i) {
# file_name <- paste0(desired_order[i], "_", format(Sys.time(), "%Y%m%d%H%M%S"), ".csv")
#  write_csv(data_list_sorted[[i]], file = file.path(output_folder, file_name))
#})

# Skriver ut en melding n??r skriptet er ferdig
#print("Ferdig med ?? importere, behandle og lagre datasettene.")

liste_med_tall <- data_list_sorted[[18]][ , 5]
nr = length(liste_med_tall)
liste_med_tall <- do.call(rbind, liste_med_tall)
colnames(liste_med_tall) <- colnames(liste_med_tall)
liste_med_tall <- t(matrix(liste_med_tall, nrow = nr))
liste_med_tall[is.na(liste_med_tall)] <- 0

#print(liste_med_tall)
n = 28
for (k in 19:n) {
  ny_liste_med_tall <- data_list_sorted[[k]][ , 5]
  
  ny_liste_med_tall <- do.call(rbind, ny_liste_med_tall)
  colnames(ny_liste_med_tall) <- colnames(ny_liste_med_tall)
  
  ny_liste_med_tall <- t(matrix(ny_liste_med_tall, nrow = nr))
  ny_liste_med_tall[is.na(ny_liste_med_tall)] <- 0
  liste_med_tall <- liste_med_tall+ny_liste_med_tall
  #print(liste_med_tall)
}
#labanData[is.na(labanData$Antall),"Antall"]=0


data <- data_list_sorted[[18]] 
data[ , 5] <- liste_med_tall
#view(data)
k<-1
n<-length(liste_med_tall)

S <- 0

# lager liste med alle m??le resultatene
x <- c( 6.0 )
k <- length(x)
i <- k
for (h in 4 : 31){
  t <- liste_med_tall[h]
  for (k in (i+1) : (i+t)){
    x[k] <- data[ h, 3]
  }
  i <- k
}
x_nom <- do.call(rbind, x)
colnames(x_nom) <- colnames(x)

# finner SSx of Sx of x_
n_h <- sum(data[ , 5]) # n i formlene
L <- length(x_nom)
sx <- sum(x_nom)
x_ <-sx/L
SSx <- 0
for (k in 1:L){
  SSx_new <- SSx + (x_nom[k]-x_)^2
  SSx <- SSx_new
}

# oppgaven sp??r etter dem
sum_x = sum(x_nom) 
sum_x2 = sum(x_nom^2)


# siden vi har s?? mange m??linger kan vi si at my_0 = sx/n_h
my_0 = sx/L
k_0 = 0
s_0 = 0
v_0 = -1
b_0 = 0
k_1 = k_0 + L
s_1 = s_0 + sx
v_1 = v_0 + L
b_1 = b_0 + SSx + L*k_0/k_1*(x_-my_0)^2


print(k_1)
print(s_1)
print(v_1)
print(b_1)


k = 0.03
sigma_1_2 = b_1/v_1
sigma_1 = sqrt(sigma_1_2)
tau = 1/sigma_1_2
my_1 = s_1/k_1
C_1 = SSx + sx^2/k_1
(s12=SSx/v_1)
(s1=sqrt(s12))
smu1=s1/sqrt(k_1)
splus1=s1*sqrt((k+k/k_1))
x_plot = seq(11.9,13.5,0.007)

yMu = dt.scaled(x_plot,v_1,my_1,smu1) # sannsynlighets fordeling til my
plot(x_plot,yMu,type="l") 
abline(v=my_1,col="green")
yXplus = dt.scaled(x_plot,v_1,my_1,splus1) # sannsynlighets fordeling til X_plus
lines(x_plot,yXplus,type="l",col="blue")

x_values <- x_plot
k_40 = 0.4
k_80 = 0.8
k_90 = 0.9
for( i in 1 : length(x_plot)){
  k_40[i] = 0.4
  k_80[i] = 0.8
  k_90[i] = 0.9
}
# Beregn den kumulative fordelingen (CDF) for en standard normalfordeling
CDF_m <- pnorm(x_values, mean = my_1, smu1)
CDF_x <- pnorm(x_values, mean = my_1, splus1)
# Plot CDF
plot(x_values, CDF_m, type = "l")
lines(x_values, CDF_x, type = "l")
C_m <- abs(2 * CDF_m - 1)
c_x <- abs(2 * CDF_x - 1)
plot(x_plot, C_m, type = "l",col='blue') #konfidens
lines(x_plot, c_x, type='l',col='maroon')
lines(x_plot,k_40,type='l',col='magenta',lty=2) 
lines(x_plot,k_80,type='l',col='magenta',lty=2) 
lines(x_plot,k_90,type='l',col='magenta',lty=2) 
abline(h = seq(0, 1, by = 0.1), col = "lightgray", lty = "dotted")
abline(v = seq(11.9, 13.5, by = 0.1), col = "lightgray", lty = "dotted")
axis(1, at = seq(11.9, 13.5, by = 0.1))
axis(2, at = seq(0, 1, by = 0.1))

##############################################################################

S_A = smu1
mu_A = my_1
v_A = v_1

S_B = S_Laban
mu_B = mu_Laban
v_B = v_Laban

sva = S_A^2 / (v_A+1)
svb = S_B^2 / (v_B+1)
sv = (sva+svb)^2

svva = sva^2 / v_A
svvb = svb^2 / v_B
svv = svva + svvb

vz = sv/svv
(vz = floor(vz))

(muz = mu_A - mu_B)

(Sz = sqrt(S_A^2+S_B^2))

# Beregn sannsynligheten P(H0) ved x = 0
sannsynlighet <- pt(0, df = vz, lower.tail = TRUE)
sannsynlighet2 <- pt(0, df = vz, ncp = muz/Sz, lower.tail = TRUE)
# Skriv ut resultatet
print(sannsynlighet)
print(sannsynlighet2)

ssA <- SSx  # Summer av kvadrater for varians 1
ssB <- SSx_Laban  # Summer av kvadrater for varians 2

# Beregn sannsynligheten
sannsynlighet3 <- pf((ssA/v_A) * (v_B/ssB), df1 = v_A, df2 = v_B, lower.tail = TRUE)
print(sannsynlighet)
print(sannsynlighet2)
print(sannsynlighet3)


