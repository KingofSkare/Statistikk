import statistics as st
import math as mt
import pandas
import matplotlib.pyplot as plt
import numpy

rosa_kvit = "oblig_1a/data/rosa_kvit42.csv"
rosa_groon = "oblig_1a/data/rosa_groon42.csv"

#importing csv files
rk = pandas.read_csv(rosa_kvit)
rg = pandas.read_csv(rosa_groon)

# Plott Span in Rosa groon
a = 0
b = 0

for a in range(30):
    span = rk["Upper"][a] - rk["Lower"][b]
    
    # Round span to the nearest whole or half number
    span_round = round(span * 2) / 2
    
    # putt i kollonne span
    rk.at[a, "Span"] = span
    rk.at[a, "Span_round"] = span_round
    a += 1
    b += 1
    # print(span)

    #Lagre tilbake i rosa_kvit42.csv
    rk.to_csv(rosa_kvit, index=False)
    

# print(rk)

# Plott Span in Rosa groon
a = 0
b = 0

for a in range (30):
    span = rg["Upper"][a] - rg["Lower"][b]
    # Round span to the nearest whole or half number
    span_round = round(span * 2) / 2

    # putt i kollonne span
    rg.at[a,"Span"] = span
    rg.at[a, "Span_round"] = span_round
    a += 1
    b += 1
    # print(span)

    #Lagre tilbake i rosa_groon42.csv
    rg.to_csv(rosa_groon, index=False)
   

# print(rg)

# Sorterer kolonnen Span i stigende rekkefølge
sorted_rk = rk.sort_values(by=['Span'])
sorted_rg = rg.sort_values(by=['Span'])

sorted_rk.to_csv('sortert_rosa_kvit42.csv', index=False)
sorted_rg.to_csv('sortert_rosa_groon42.csv', index=False)

# Kumulative frekvenser Avrundet
# Rosa Kvit Avrundet
frekvens_rk = rk["Span_round"].value_counts().reset_index()
frekvens_rk.columns = ["Span_round", "Frekvens"]
frekvens_rk = frekvens_rk.sort_values(by=['Span_round'])
frekvens_rk["Kumulativ frekvens"] = frekvens_rk["Frekvens"].cumsum()

# Rosa Groon Avrundet
frekvens_rg = rg["Span_round"].value_counts().reset_index()
frekvens_rg.columns = ["Span_round", "Frekvens"]
frekvens_rg = frekvens_rg.sort_values(by=['Span_round'])
frekvens_rg["Kumulativ frekvens"] = frekvens_rg["Frekvens"].cumsum()

# Kumulative frekvenser
# Rosa Kvit 
original_frekvens_rk = rk["Span"].value_counts().reset_index()
original_frekvens_rk.columns = ["Span", "Frekvens"]
original_frekvens_rk = original_frekvens_rk.sort_values(by=['Span'])
original_frekvens_rk["Kumulativ frekvens"] = original_frekvens_rk["Frekvens"].cumsum()

# Rosa Groon
original_frekvens_rg = rg["Span"].value_counts().reset_index()
original_frekvens_rg.columns = ["Span", "Frekvens"]
original_frekvens_rg = original_frekvens_rg.sort_values(by=['Span'])
original_frekvens_rg["Kumulativ frekvens"] = original_frekvens_rg["Frekvens"].cumsum()

# to_csv
original_frekvens_rg.to_csv('original_frekvens_rg.csv', index=False)
original_frekvens_rk.to_csv('original_frekvens_rk.csv', index=False)

# print(original_frekvens_rk)
# print(original_frekvens_rg)

# Save frekvens_rk/frekvens_rg as CSV
frekvens_rk.to_csv('frekvens_rk.csv', index=False)
frekvens_rg.to_csv('frekvens_rg.csv', index=False)

# Plot frekvens_rk
width = 0.4  # Bredden på hver kolonne
plt.bar(frekvens_rk["Span_round"].to_numpy(), frekvens_rk["Frekvens"].to_numpy(), width=width, color="pink")
plt.xlabel("Span_round", fontsize=14)
plt.ylabel("Frekvens", fontsize=14)
plt.title("Frekvens Plot Rosa Kvit", fontsize=20)
plt.savefig("frekvens_rk.png")
plt.show()


# Plot frekvens_rg

width = 0.4  # Bredden på hver kolonne
plt.bar(frekvens_rg["Span_round"].to_numpy(), frekvens_rg["Frekvens"].to_numpy(), width=width, color="greenyellow")
plt.xlabel("Span_round", fontsize=14)
plt.ylabel("Frekvens", fontsize=14)
plt.title("Frekvens Plot Rosa Groon", fontsize=20)
plt.savefig("frekvens_rg.png")
plt.show()


# Plot kumulative frekvenser rk
width = 0.4  # Bredden på hver kolonne
plt.bar(frekvens_rk["Span_round"].to_numpy(), frekvens_rk["Kumulativ frekvens"].to_numpy(), width=width, color="pink")
plt.xlabel("Span_round", fontsize=14)
plt.ylabel("Kumulativ frekvens", fontsize=14)
plt.title("Kumulativ Frekvens Plot Rosa Kvit", fontsize=20)
plt.savefig("kumulativ_frekvens_rk.png")
plt.show()

# Plot kumulative frekvenser rg
width = 0.4  # Bredden på hver kolonne
plt.bar(frekvens_rg["Span_round"].to_numpy(), frekvens_rg["Kumulativ frekvens"].to_numpy(), width=width, color="greenyellow")
plt.xlabel("Span_round", fontsize=14)
plt.ylabel("Kumulativ frekvens", fontsize=14)
plt.title("Kumulativ Frekvens Plot Rosa Groon", fontsize=20)
plt.savefig("kumulativ_frekvens_rg.png")
plt.show()

read_snop = pandas.read_csv(rosa_kvit)

# Kalkulerer gjennomsnittet av span i rosa_kvit42.csv 
snop_mean_rk = rk["Span"].mean()
print("Rosa kvit middelverdi",snop_mean_rk)

# Kalkulerer gjennomsnittet av span i rosa_groon42.csv 
snop_mean_rg = rg["Span"].mean()
print("Rosa Grønn middelverdi",snop_mean_rg)

# Kalkulerer medianen av span i rosa_kvit42.csv 
snop_median_rk = rk["Span"].median()
print("Rosa Kvit median",snop_median_rk)

# Kalkulerer medianen av span i rosa_groon42.csv 
snop_median_rg = rg["Span"].median()
print("Rosa Grønn median",snop_median_rg)

# Kalkulerer standardavviket av span i rosa_kvit42.csv 
snop_std_rk = rk["Span"].std()
print("Rosa kvit standardavvik",snop_std_rk)

# Kalkulerer standardavviket av span i rosa_groon42.csv 
snop_std_rg = rg["Span"].std()
print("Rosa grønn standardavvik",snop_std_rg)

# Kalkulerer variansen av span i rosa_kvit42.csv 
snop = rk["Span"].var()
print(snop)

# Kalkulerer variansen av span i rosa_groon42.csv 
snop = rg["Span"].var()
print(snop)

# finn typetall i rosa_kvit42.csv 
snop_typt_rk = rk["Span"].mode()
print("Rosa kvit typetall",snop_typt_rk)

# finn typetall i rosa_groon42.csv 
snop_typt_rg = rg["Span"].mode()
print("Rosa grønn typetall",snop_typt_rg)
