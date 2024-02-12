# https://www.datacamp.com/community/tutorials/r-packages-guide?utm_source=adwords_ppc&utm_campaignid=898687156&utm_adgroupid=48947256715&utm_device=c&utm_keyword=&utm_matchtype=b&utm_network=g&utm_adpostion=&utm_creative=255798340456&utm_targetid=dsa-473406586795&utm_loc_interest_ms=&utm_loc_physical_ms=1010886&gclid=Cj0KCQjwtZH7BRDzARIsAGjbK2bbqQTPB-_y-OMe6VnkGV8gUrRAUIkPShHGT2-ux9KMuL7fExHztoYaAoHjEALw_wcB
# https://towardsdatascience.com/top-r-libraries-for-data-science-9b24f658e243
# https://www.computerworld.com/article/2921176/great-r-packages-for-data-import-wrangling-visualization.html
install.packages("tidyverse")   # Sugar and spice, and everything nice
##### Installerer du tidyverse, installerer du samtidig disse pakkene: ######
# install.packages("ggplot2")   # visualisering av data: https://homepage.divms.uiowa.edu/~luke/classes/STAT4580/catone.html
# install.packages("tibble")    # for dataRammer
# install.packages("readr")     # import av data
# install.packages("tidyr")     # rydde opp i data (Ja, det trengs!)
# install.packages("purrr")     # funksjonell programmering
# install.packages("forcats")   # For faktorer
# install.packages("stringr")   # Manipulering av tekststrenger
# install.packages("dplyr")     # Generell datamanipulering
################################################################################
install.packages("roperators")  # Gir R noen operatorer som ligner litt på C++
install.packages("coda")        # Støttebibliotek som trengs for rjags
install.packages("rjags")       # JAGS: Kryss-plattform bayesiansk simulering
install.packages("rstan")       # STAN: Bayesiansk simulering. Nyere og raskere enn jags
install.packages("distr")       # For egendefinerte og andre nyttige sannsynlighetsfordelinger. https://cran.r-project.org/web/packages/distr/distr.pdf
install.packages("extraDistr")  # Sannsynlighetsfordelingen Gamma-gamma, også kalt Beta II, finnes her
install.packages("rmutil")      # Flere fordelinger, inkludert en versjon av beta-binomisk 
install.packages("metRology")   # For skalert t-fordeling
install.packages("codetools")   # For de som vil dypdykke i R-koding
install.packages("knitr")       # For integrasjon med LaTeX, så du kan skrive rapporter i R
install.packages("hesim")       # For kategoriske variable
install.packages("eulerr")      # For illustrasjoner med Euler-diagram 
install.packages("VennDiagram") # For illustrasjoner med Venn-diagram - https://www.r-graph-gallery.com/14-venn-diagramm.html
install.packages("plotrix")     # For å plotte kakediagrammer, for eksempel
install.packages("ramify")      # Mer matematisk funksjonalitet
install.packages("lattice")     # Flerdimensjonal funksjonalitet. Scatterplots etc.


### Datasett til undervisning, oppgaver og prosjekt ############# 
install.packages("titanic")     # Data fra Titanic-forliset
install.packages("MASS")        # Data fra hoursing.markedet i Boston, og mange andre godbiter
install.packages("alr4")        # FLER eksempeldata! 

####### Etter denne linja kommer biblioteker jeg har benyttet selv til ett eller annet formål 
####### i undervisningen, men som ikke brukes i opplæringsfulene jeg har lagt ut for dere.

install.packages("skellam")     # For Skellam-fordelingen, fordelingen av forskjellen mellom to Poisson-fordelte variable
install.packages("UpSetR")      # Mengdelære
install.packages("sets")        # Mer mengdelære

####### Noen pakker har blitt bygd inn i R selv, så da trenger du ikke installere. Bare påkall med library.
library(datasets)    # MANGE eksempeldata! https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html

####### Noen pakker har blitt problematiske i nyere utgaver av R:
install.packages("matlib")      # Navnet sier seg kanskje selv ... nyttige funksjoner


