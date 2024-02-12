# https://www.datacamp.com/community/tutorials/r-packages-guide?utm_source=adwords_ppc&utm_campaignid=898687156&utm_adgroupid=48947256715&utm_device=c&utm_keyword=&utm_matchtype=b&utm_network=g&utm_adpostion=&utm_creative=255798340456&utm_targetid=dsa-473406586795&utm_loc_interest_ms=&utm_loc_physical_ms=1010886&gclid=Cj0KCQjwtZH7BRDzARIsAGjbK2bbqQTPB-_y-OMe6VnkGV8gUrRAUIkPShHGT2-ux9KMuL7fExHztoYaAoHjEALw_wcB
# https://towardsdatascience.com/top-r-libraries-for-data-science-9b24f658e243
# https://www.computerworld.com/article/2921176/great-r-packages-for-data-import-wrangling-visualization.html
library(tidyverse)   # Sugar and spice, and everything nice
##### Installerer du tidyverse, installerer du samtidig disse pakkene: ######
# library(ggplot2)   # visualisering av data: https://homepage.divms.uiowa.edu/~luke/classes/STAT4580/catone.html
# library(tibble)    # for dataRammer
# library(readr)     # import av data
# library(tidyr)     # rydde opp i data (Ja, det trengs!)
# library(purrr)     # funksjonell programmering
# library(forcats)   # For faktorer
# library(stringr)   # Manipulering av tekststrenger
# library(dplyr)     # Generell datamanipulering
################################################################################
library(roperators)  # Gir R noen operatorer som ligner litt på C++
library(coda)        # Støttebibliotek som trengs for rjags
library(rjags)       # JAGS: Kryss-plattform bayesiansk simulering
library(rstan)       # STAN: Bayesiansk simulering. Nyere og raskere enn jags
library(distr)       # For egendefinerte og andre nyttige sannsynlighetsfordelinger. https://cran.r-project.org/web/packages/distr/distr.pdf
library(extraDistr)  # Sannsynlighetsfordelingen Gamma-gamma, også kalt Beta II, finnes her
library(rmutil)      # Flere fordelinger, inkludert en versjon av beta-binomisk 
library(metRology)   # For skalert t-fordeling
library(codetools)   # For de som vil dypdykke i R-koding
library(knitr)       # For integrasjon med LaTeX, så du kan skrive rapporter i R
library(hesim)       # For kategoriske variable
library(matlib)      # Navnet sier seg kanskje selv ... nyttige funksjoner
library(eulerr)      # For illustrasjoner med Euler-diagram 
library(VennDiagram) # For illustrasjoner med Venn-diagram - https://www.r-graph-gallery.com/14-venn-diagramm.html
library(plotrix)     # For å plotte kakediagrammer, for eksempel
library(ramify)      # Mer matematisk funksjonalitet
library(lattice)     # Flerdimensjonal funksjonalitet. Scatterplots etc.


### Datasett til undervisning, oppgaver og prosjekt ############# 
library(titanic)     # Data fra Titanic-forliset
library(MASS)        # Data fra hoursing.markedet i Boston, og mange andre godbiter
library(datasets)    # MANGE eksempeldata! https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html
library(alr4)        # FLER eksempeldata! 

####### Etter denne linja kommer biblioteker jeg har benyttet selv til ett eller annet formål 
####### i undervisningen, men som ikke brukes i opplæringsfilene jeg har lagt ut for dere.

library(skellam)     # For Skellam-fordelingen, fordelingen av forskjellen mellom to Poisson-fordelte variable
library(UpSetR)      # Mengdelære
library(sets)        # Mer mengdelære
# 