library(tidyverse) # Sugar and spice, and everything nice!
library(datasets)  # https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html
help(trees)   # Hva har du slags data?
head(trees)   # Se de første radene med data.

# Kovarians og korrelasjon
cov(trees$Girth,trees$Volume) # kovarians. Innebygd funksjon i R. Omkrets vs Volum
cor(trees$Girth,trees$Volume) # korrelasjon. Innebygd funksjon i R. Omkrets vs Volum
cor(trees$Height,trees$Volume) # Høyde vs Volum
plot(trees$Height,trees$Volume,type="p",xlim=c(5,25),ylim=c(0,90),col="royalblue") # Lavere korrelasjon
plot(trees$Girth,trees$Volume,type="p",xlim=c(5,25),ylim=c(0,90),col="royalblue") # Høyere korrelasjon
x<-trees$Girth
y<-trees$Volume
# ... regne ut selv
xy<-x*y
x
y
xy
n<-length(xy)  # Lengdene på x, y og xy er like, så vi plukker bare en av dem. Antall observasjoner.
Sx<-sum(x)
Sy<-sum(y)
Sxy<-sum(xy)
SSxy<-Sxy-Sx*Sy/n
pCov<-SSxy/n      # Populasjonskovarians
sCov<-SSxy/(n-1)  # Utvalgskovarians
pSdx<-sqrt((sum(x^2)-sum(x)^2/n)/n)
sSdx<-sqrt((sum(x^2)-sum(x)^2/n)/(n-1))
pSdy<-sqrt((sum(y^2)-sum(y)^2/n)/n)
sSdy<-sqrt((sum(y^2)-sum(y)^2/n)/(n-1))
pCor<-pCov/(pSdx*pSdy)      # Populasjonskorrelasjon
sCor<-sCov/(sSdx*sSdy)      # Utvalgskorrelasjon, altså beste anslag på en større populasjon sin 
# populasjonskorrelasjon ut fra våre data.
pCor # Populasjonskorrelasjon
sCor # Utvalgskorrelasjon. Ser du noe? :-)
regDat<-data.frame(x=x,y=y)  # Vi hentet x og y fra en data frame, og nå pakker vi dem inn i en igjen
lmDat<-lm(y~x,data=regDat)   # Hmm ... Hva er dette?
lmDat$coefficients           # Jaha ... to tall ... men ... ?
a<-lmDat$coefficients[1]     # a blir satt til det første tallet (den første koeffisienten)
b<-lmDat$coefficients[2]     # b blir satt til det andre tallet (den andre koeffisienten)
abline(a,b,col="red")        # ÅJA!!! a og b er koeffisientene i regresjonslinja! y = a + bx --- NICE!!

# Men vi skal regne ut regresjonslinja på "saktemåten" òg, altså for hånd. β = (X^T*X)^{-1}*X^T*y
# y er allerede på plass. Men vi skal lage matrisen X. Vi har ikke lagd matriser før.
X<-cbind(rep(1,n),x)                   # Erklærer X å være en n x 2 - matrise
X[,1]                                  # 1. kolonne er bare 1-tall
X[,2]                                  # 2. kolonne er x-verdiene
t(X)                                   # Den transponerte av X
t(X) %*% X                             # Matrisemultiplikasjon er t(X) %*% X og ikke som man skulle tro X^T * X
library(matlib)                        # For å kunne bruke inv. Bibliotek-kall kan gjerne samles på toppen.
beta<-inv(t(X)%*%X)%*%t(X)%*%y         # Koeffisientene til regresjonslinjen, etter formelen β = (X^T*X)^{-1}*X^T*y
beta                                   # Tallene vi fikk
lmDat$coefficients                     # Ingen overraskelse: Det er de samme tallene!
plot(x,y,type="p",col="royalblue")     # Plotter igjen. Denne gangen generisk for x og y
abline(beta[1],beta[2],col="red")      # ... og regresjonslinja, som vi nå har regnet ut SJØL !!
for (i in 1:n)                         
  {
    segments(x[i],y[i],x[i],a+b*x[i],col="orange")  # For hver x-verdi tegner vi en oransj linje fra punktet til linja. Residualene.
  }
y-(a+b*x)                              # Residualene
sum((y-(a+b*x))^2)                     # Summen av kvadratet av residualene. Dette er SSe.
SSe<-t(y)%*%y-t(beta)%*%t(X)%*%X%*%beta  # Summen av kvadratet av residualene, regnet direkte fra formel. Vi foretrekker denne for å få mindre numerisk feil.
SSe                                    # Nesten likt sum((y-(a+b*x))^2), som forventet. Avviket er numerisk unøyaktighet.
se<-sqrt(SSe/(n-2))                    # "Standardfeilen" se. Tenk på det som et gjennomsnittlig avvik mellom punkt og linje, for enkelhets skyld.
se
