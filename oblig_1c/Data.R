library(tidyverse) # Sugar and spice, and everything nice!
library(datasets)  # https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html
library(roperators) # For kommandoen %+=%
library(plotrix)

# Vi begynner med kategoriske data, altså hvor observasjonene er TYPER:
help(chickwts)     # Dataene er chickwts fra biblioteket datasets. Hva har du slags data i chickwts?
head(chickwts)     # Se de første radene med data.
(x<-chickwts$feed) # Vi velger ut fôrtypen som våre data
(y<-table(x))      # Frekvenstabell over fôrtype 
plot(x)            # Frekvensdiagram over fôrtype
barplot(y)         # Samme diagram, men barplot som kommando, 
                   # og frekvenstabellen som input
plot(y)            # Plot, med frekvenstabellen som input

# Vi kan også lage kakediagram. Merk at vi ikke behøver sette argumentene col og main selv.
pie(y)             # Hvorfor pie(y) og ikke pie(x)? Prøv!
pie(table(x), col=c("blue", "red", "yellow", "pink", "green", "orange","brown"), main="Fôrtyper")
pie3D(table(x))  # eller et 3D kakediagram, for fancy presentasjon. Mer fancy:
pie3D(table(x), theta=pi/4, explode=0.1, labels=names(table(x)))

# Hvordan skriver vi inn egen tabell?
mTable<-table(c("a","b","a","c","a","b","a","c","a","c"))  # Hvis du har en liste over dataene
mTable
# Hvis du allerede har en frekvenstabell, så gjør du slik: (eksempel)
freq<-c(19,12,23)
verdier<-c("katt","hund","ugle")
mTable<-table(verdier)
mTable[verdier]<-freq
mTable
# Hvis du vil plotte, så legger du dataene inn i en dataRamme
library(ggplot2)      # Må påkalles en eller annen gang, men bare én gang, før du bruker ggplot-funksjonen.
mFrame<-data.frame(y=c(mTable)) # Gjør om tabellen til en enkel dataRamme
mFrame
ggplot(mFrame)+ geom_col(aes(x = rownames(mFrame), y = y))


# Men de viktigste dataene for oss er TALL-data:
# Hvordan legger vi inn våre egne tall-data?
# Vi legger inn noen data tilsvarende SEIGMANNOPPGAVEN som eksempel
## For fargetabell og -diagram, se "kategoriske data"

# Metode 1.  (Sjekk for å se hva du fikk inn ved å skrive x i konsollet)
x<-c(17.5,12.5,13,14.5,16,14.5) # Liste av rådata, alt lagt inn på en gang.
# Metode 2 (Sjekk ved å skrive x i konsollet for å se hva du fikk inn)
x<-c(); i<-0  # Initialiserer x som tom streng, og i=0. ";" = linjeskift i koden
x[i%+=%1]<-17.5 # Legger inn første datapunkt ...
x[i%+=%1]<-12.5 # så neste ... (indeksen i øker automagisk)
x[i%+=%1]<-13   # ... osv ...
x[i%+=%1]<-14.5
x[i%+=%1]<-16
x[i%+=%1]<-14.5 # ... til alle er inne
### Vise frem og behandle dataene
b<-0.5 # Bredden på gruppene av strekklengde
L<-12.25 # nedre grense for observerte strekklengder
U<-17.75 # øvre grense for observerte strekklengder
hist(x,breaks = seq(L,U,b),col="orangered")
# Metode 3. Frekvenstabell.
b<-0.5 # Bredden på gruppene av strekklengde
L<-11.75 # nedre grense for observerte strekklengder, minus b
U<-18.25 # øvre grense for observerte strekklengder, pluss b
(x<-seq(L,U,b)) # Liste av alle intervallmidtpunktene
f<-c(0,1,1,0,0,2,0,0,1,0,0,1,0) # Liste over alle frekvensene (antallene)
xHist <-list(breaks=x, counts=f) # Gjør om ...
class(xHist) <- "histogram"  # .. til histogram, så vi kan plotte pent.
plot(xHist,col="purple")     # Da bruker vi plot
# Metode 4. Lag tabell i Excel, lagre som .csv-fil.
z<-read.csv(file.choose()) # Åpner dialog for å finne filen.
z # Merk at z er en data.frame. Vi går ut fra at kolonnene heter x og f.
xHist <-list(breaks=z$x, counts=z$f) # Som over ...
class(xHist) <- "histogram"  # ...
plot(xHist,col="purple")     # ... som over.

# Hente inn tall-data fra bibliotek
help(trees)   # Her er dataene trees, også fra datasets. Hva har du slags data?
head(trees)   # Se de første radene med data.
(x<-trees$Height)  # Høyde (i lengdeenheten feet) er fine tall-data. Vi velger dem.

# Andelsmål (ikke-grupperte data; rådata x)
(x<-sort(x))       # Setter dataene i stigende rekkefølge
median(x)         # Medianen, målingen i midten
qx<-quantile(x,probs=c(0.05,0.25,0.5,0.75,0.95),type=6) # Prosentiler: P5, P25, P50, P75, P95. type=6 er NIST-standarden
qx    # Merk at P50=Q2=median, og P25=Q1=første kvartil og P75=Q1=tredje kvartil
hist(x,breaks=10,col="royalblue")
abline(v=qx,col=c("orangered","orangered","green","orangered","orangered"),lty=c(2,2,1,2,2),lwd=2)
# En populær plott-type for andelsmål er er box-plott
boxplot(x, range=0)  # Det er et litt grovere plott, der den tykke, sorte streken i midten 
# er medianen, mens selve boksen går fra Q1 til Q3, og "T"-ene går mellom "ytterverdier". 
# Du velger hvor ekstreme ytterverdier du vil se på ved å sette range-parameteren. 
# 0 gir de ytterste punktene, mens et positivt tall vil strekke seg ut fra kvartilen
# sin range ganger så langt som avstanden fra medianen til sin kvartil, men ikke lenger ut
# enn det er data. Prøv ut!
boxplot(x, range=0.5)  
boxplot(x, range=1)  
boxplot(x, range=1.5)  
boxplot(x, range=200)  

# Andelsmål (grupperte data, men ikke intervaller)
v<-c(3,8,9)  # Verdiene
f<-c(6,3,4)  # Frekvensene, altså antallet av hver verdi
(x<-rep(v,f))  # Omdanner frekvenstabellen til rådata.
# Bruk denne x'en som du vill brukt rådata direkte, i avsnittet over.

# Andelsmål (grupperte data, intervallbredde b)
b<-0.5 # Intervallbredde
L<-11.75 # nedre grense
U<-18.25 # øvre grense
(x<-seq(L,U,b)) # Liste av alle intervallskillene, inkludert ytterpunktene
f<-c(7,19,11,10,10,21,10,10,14,3,7,10,9)# Liste over alle frekvensene (antallene)
f<-c(0,1,1,0,0,2,0,0,1,0,0,1,0) 
groupedQuantile<-function(p,leftpoints,width,frequencies)
{
  low<-0
  fP<-frequencies/sum(frequencies)
  fPC<-cumsum(frequencies)/sum(frequencies)
  for (i in 1:(length(fPC)))
  {
    if(p<=fPC[i] & fPC[i]>0) {return (leftpoints[i] + ((p-low)/fP[i])*width)}
    low<-fPC[i]
  }
#  return (leftpoints[length(fPC)]+width)
}
x # Lister opp intervallskillene. Intervallene er da mellom disse skillene.
groupedQuantile(0,x,b,f)
groupedQuantile(0.5,x,b,f)
groupedQuantile(1,x,b,f)
## Merk at groupedQuantile ikke er robust, så om du prøver å gi den flere
## verdier som en vektor, så protesterer den. Så den må få verdiene en og en.




# Vektemål
nx<-length(x)         # Antall høydemålinger
Sx<-sum(x)            # Summen av høydemålingene
Sx/nx                 # Gjennomsnittlig høyde
mx<-mean(x)           # Gjennomsnittlig høyde regnet med innebygd funksjon i R
mx
x^2                   # Kvadratet av høydene
Sx2<-sum(x^2)         # Summen av kvadratet av høydemålingene
x-mx
sum((x-mx)^2)         # Summen av kvadratiske avvik fra gjennomsnittet
Sx2-Sx^2/nx           # Dette er lik sum((x-mx)^2)
SSx<-Sx2-Sx^2/nx
# For ikke-grupperte data, ignorer de neste tre linjene linjene. Evt b=0.
b<-3              # Grupperte data, intervallbredde b. For eksempelet: b=3
SSb<-nx*b^2       # korreksjonsfaktor for grupperte data med intervallbredde b
SSx<-SSx+SSb      # Korrigert SSx
pVar<-SSx/nx      # Gjennomsnittlig kvadratisk avvik fra gjennomsnittet. Dette kalles populasjonsvarians.
sVar<-SSx/(nx-1)  # Dette kalles utvalgsvarians, og brukes når dataene våre skal anslå varians for en 
# større mengde enn bare dataene selv. Dette er det beste anslaget, når vi deler på (nx-1) heller enn nx.
pSd<-sqrt(pVar)   # Kvadratroten av variansen er standardavviket. Dette er da populasjonsstandardavviket.
sSd<-sqrt(sVar)   # ... og dette er utvalgsstandardavviket.
pSd
sSd
hist(x,breaks=min(x):max(x),col="royalblue") # breaks=min(x):max(x) gir intervallbredder på 1.
abline(v=c(mx,mx-pSd,mx+pSd),col=c("green","palevioletred","palevioletred"),lty=c(1,1,1),lwd=2)
abline(v=c(mx,mx-sSd,mx+sSd),col=c("olivedrab","red","red"),lty=c(1,4,4),lwd=2)

# Alternative histogram: 
hist(x,breaks=seq(min(x),max(x),0.5),col="royalblue") # breaks=seq(min(x),max(x),0.5) gir intervallbredder på 0.5.
hist(x,breaks=seq(min(x),max(x),3),col="royalblue") # breaks=seq(min(x),max(x),3) gir intervallbredder på 3.
hist(x,breaks=7,col="royalblue") # breaks=7 gir omtrent 7 intervaller. Omtrent.

# Vi kan gjenta for andre data. 
help(women)   # Hva har du slags data?
head(women)   # Se de første radene med data.
x<-women$weight
x
# Vi går nå bare opp til linje 8, og regner derfra. Eller vi kan kopiere linje 8--38 og kjøre.

