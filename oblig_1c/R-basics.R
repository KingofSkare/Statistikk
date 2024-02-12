library(tidyverse)   # Dette er et greit standard-bibliotek.
library(roperators)  # Vi bruker %+=% fra dette biblioteket

print("Hello World!") # Slik starter man alltid læring av et dataspråk
2+2                   # ... og slik et regnespråk 
a <- 5                # Hovedmåten å sette en variabel i R er pila
a
# Hvis vi vil BÅDE sette verdien OG vise den frem, setter vi parentes rundt:
(A <- 5)              # Setter A=5, OG skriver ut denne verdien, samtidig.
A                     # Ok, vi bare sjekker denne ene gangen, og ja, vi fikk verdien på A første gang!
(b = "Lure ord")      # ... men = funker også, nesten alltid. Nesten.
(2:7 -> c)            # Pila kan også gå andre veien. Men hva blir dette? (Se output)
a+5
paste(b," og ",b," og enda flere ",b)  # Slå sammen tekststrenger
c+3                   # Legger 3 til samtlige elementer
2*c                   # Ganger samtlige elementer med 3
(d <- seq(2,7,0.2))   # Som 2:7, men styrer steglengde. Her er den da 0.2
(e <- c(2,3,6,6.2,6.5,7))   # Om du vil spesifisere hvert enkelt element
c+e                   # Vektorer av lik lengde kan legges sammen, element for element
c*e                   # Vektorer av lik lengde kan ganges sammen, element for element
c-e                   # Vektorer av lik lengde subtraheres, element for element
c/e                   # Vektorer av lik lengde kan deles, element for element
c^e                   # Vektorer av lik lengde kan eksponentieres, element for element
(f <- rep(2,30))      # Noen ganger vil man bare ha det samme om igjen
a
a %+=% 2              # Krever biblioteket roperators
a                     # Kan du se hva %+=% gjør?
f[a %+=% 2]<--99      # Inspiser både f og a for å se hva som skjedde nå

# Nå som vi kan vektorer, så kan vi også se på matriser:
X<-matrix(1:18, nrow = 6, ncol = 3)    # Erklærer X å være en 6 x 3 - matrise, altså 6 rader og 3 kolonner
X[,1]=rep(1,6)                         # 1. kolonne er bare 1-tall
X[,2]=4:9                              # 2. kolonne er tallene 4 til 9
X[,3]=e                                # 3. kolonne er e
X                                      # Inspisere X for å se at vi har det vi vil. det har vi.
t(X)                                   # Den transponerte av X
(A<-t(X) %*% X)                        # Matrisemultiplikasjon AB er A %*% B og ikke som man skulle tro A * B.Dimensjonene må matche.
solve(A)                               # Den inverse av en matrise finner du med kommandoen solve
# For noen av dere er dette det første biblioteket dere laster. Se install.packages.R og kjør den først!
library(matlib)                        # For en alternativ måte å ta invers på, som er lettere å huske
Inverse(A)                             # Samme jobb, lettere navn å huske for operasjonen enn solve
inv(A)                                 # inv er like greit, og kortere. Samme resultat fra alle 3 metoder, så klart.
t(X)%*%e                               # Matriser ganges med vektorer likedan som med hverandre. Dimensjonene må matche.

for (i in -1:4)                 # Dette er ei løkke, der i starter på -1, og øker med 1 for hver runde, opp til og med 4
{                               # { betyr starten på koden i løkka.
   print(paste("Runde",i))      # Kommandoen vår her er at vi skriver ut runden i hver runde
}                               # { betyr slutten på koden i løkka.

square <- function(x)           # Slik definerer man funksjon i R. 
{                               # { betyr starten på koden i funksjonen.
  sin(x)                        # Kode som utføres. MEN: Sist beregnede verdi
  x^2                           # er funksjonens output, så output er x^2, ikke sin(x)
}                               # { betyr slutten på koden i funksjonen.

# Generelt: fNavn <- function(x1,x2, ... ) {beregning med argumentene x1, x2 osv}
square(3)                       # fNavn(x1,x2, ...) er måten vi bruker funksjonen på

c                             # Påminner på den gamle lista vår, c
square(c)                     # Funksjonen anvendes på alle elementer i en liste
plot(seq(-3,9,0.01),square(seq(-3,9,0.01)),type="l",xlim=c(-2,8),ylim=c(-10,100),col=rgb(0.8,0.2,0))
# Gå i vinduet du ser grafen, og se på "Help" for å få sett alle grafiske alternativer
# Der skriver du "plot", og så scroller du til "Help pages" og trykker på "base::plot"

# Slik lager du et diskret plott:
plot(seq(-3,9,0.5),square(seq(-3,9,0.5)),type="h",xlim=c(-2,8),ylim=c(-1,60),col=rgb(0,0.8,0.2),lwd=3)
# Men du kan få med deg flere ting i ett plott ved å følge opp med kommandoene
# lines og points
lines(seq(-3,9,0.01),square(seq(-3,9,0.01)),type="l",col=rgb(0.8,0.2,0))
points(c(0,3.5,6),square(c(0,3.5,6)),type="p",col=rgb(0,0,0.8))
# Punktet behøver ikke ha noe med det tidligere å gjøre ...
points(1,30,type="p",xlim=c(-2,8),ylim=c(-10,100),col=rgb(0.8,0,0.8))
text(1,20,"Randomz punkt",srt=45,col=rgb(0.8,0,0.8))

# Hvis du vil illustrere integralet av x^2 fra 2 til 6 kan du gjøre slik:
plot(seq(-3,9,0.01),square(seq(-3,9,0.01)),type="l",xlim=c(-2,8),ylim=c(-0.1,60),col=rgb(0.8,0.2,0))
lines(seq(2,6,0.01),square(seq(2,6,0.01)),type="h",col=rgb(0.9,0.7,0))
lines(seq(-3,9,0.01),square(seq(-3,9,0.01)),type="l",col=rgb(0.8,0.2,0))
abline(v=c(2,6),col=c("green","blue"),lwd=c(3,1,1),lty=c(1,5))
segments(2,0,6,0,col=rgb(0.5,0.5,0.5),lwd=2)

segments(-2,50,0,20,col=rgb(0.5,0,0.5),lwd=2)
text(-1,40,"Randomz linjesegment",srt=-50,col=rgb(0.8,0,0.8))

# Selve integralet kan du også regne ut, egentlig på samme måte, som en sum av rektangler med gitt bredde dx
dx<-0.001
sum(dx*square(seq(-3,9,dx))) # integralet som sum
integrate(square,-3,9)       # innebygd integrasjon i R
# Men du kan også integrere ved å plukke N tilfeldige tall i intervallet. 
# Dette er egentlig basics for avanserte statistiske simuleringer. (!!)
N<-200000
a<-(-3)
b<-9
samples<-runif(N,a,b)
sum(((b-a)/N)*square(samples))
# Hvorfor blir det forskjellig svar hver gang du kjører?
# Sjekk hvordan de tilfeldige tallene er fordelt for hver gang. Så kjør linje 82-89 sammen.
hist(samples) 

# Å skrive data til en fil
write.csv(c(2,3,4,6,8,0),file="minCSVfil.csv")
# Let nå opp og gå inn i CSV-fila, og gjør en liten endring i to tall.
# Les den så inn igjen
(g <- read.csv(file="minCSVfil.csv"))
g$x   # Vi ser ikke på hele g, men på kolonne x
# Så vi ser innlesing gir oss noe annet enn vektoren vi skrev ut. Det vi
# får inn heter en Data Frame, som er en slags tabell. Det er mer spennende
# å se på ferdige datasett, så derfor skal vi kalle inn et fra nettet. Dere
# vet nå uansett hvordan man leser fra fil.
library(MASS)  # install.packages("MASS") må utføres før dette. Kjør alt i install.packages.R-fila!
help(Boston)   # Hva har du slags data?
head(Boston)
Boston[3,]     # 3. rad, altså et datasett
Boston[1:6,3]  # 3. kolonne, men kun element 1 til 6 så vi ikke får for mye
Industrien <-Boston$indus  # 3. kolonne, påkalt ved navn. 
Industrien[1:6]   # Element 1 til 6 i denne kolonnen
library(tidyverse) # Sugar and spice, and everything nice! Nyttig bibliotek, altså.
OldBoston <- filter(Boston, age>80)   # Filtrerer rader og velger ut de med age>80
head(OldBoston)   # Vi ser at alle age er nå over 80.
GamleBoston<-Boston[Boston$age>80,]  # Mer kompakt metode; gjør samme som filter
head(GamleBoston)  # Samme som OldBoston

# Vi har da nok data til å leke oss med! Og vi har lært at en dataframe er en tabell
# der kolonnene har navn, slik at hver rad tilsvarer et sammenhørende datasett med
# verdier innenfor hver av de aktuelle variablene som kolonnene tilsvarer.

# Mesteparten av lekingen med data skal vi gjøre i senere moduler, men vi skal begynne 
# med å tegne et såkalt histogram over den ene kolonnen vi hentet ut, Industrien:

hist(Industrien)
hist(Industrien,breaks=50,col="green") # Delt inn i 50 biter
hist(Industrien,breaks=200,col="blue") # Delt inn i 50 biter
hist(Industrien,breaks=c(0:7,10,seq(20,30,2)),col="maroon") # Variable søylebredder
c(0:7,10,seq(20,30,2))  # Eksperimenter med denne for å se hva du kan få

# For dere som virkelig vil få ting til å se pent ut, sjekk farger i fila Rcolor.pdf

