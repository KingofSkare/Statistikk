import os

rosa_kvit = "/home/ingejohan/statistikk/oblig_1a/data/rosa_kvit42.csv"

# Check if file exists
if os.path.isfile(rosa_kvit):
    print("File exists")
else:
    print("File does not exist")