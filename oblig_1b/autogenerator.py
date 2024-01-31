import csv
import random

# Define the range for the random number generator

min_terning = 1
max_terning = 6
# Path to the CSV file
file_path = 'oblig_1b/Terning_20.csv'

with open(file_path, mode='w', newline='') as file:
    writer = csv.writer(file)
    # Write the numbers to the third column
    for _ in range(30):
        number_collm = random.randint(20,120)
        if number_collm <= 10:
            collom_1 = 5
        elif number_collm <= 60:
            collom_1 = 20
        elif number_collm <= 75:
            collom_1 = 25
        elif number_collm <= 88:
            collom_1 = 30
        elif number_collm <= 108:
            collom_1 = 35
        elif number_collm <= 120:
            collom_1 = 40
        row = [collom_1,random.randint(min_terning,max_terning), number_collm,  ]
        writer.writerow(row)

print(f"File saved as {file_path}")
