###   Set-Up   ###
# Packages
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from matplotlib.lines import Line2D
import os
import numpy as np
import os
import scipy.stats as stats


# Example using seaborn color palette
colors = sns.color_palette('pastel')


# Functions
def find_median(df, column):
   # Find the amount of data points.
   n = len(df[column]) # Get length of column

   # Check if "n" is a odd or even number
   if n % 2 == 0:
     # "n" is even
     median = (1/2) * ( df.at[(n / 2), column] + df.at[((n + 2) / 2), column]) # df.at[i, column] gets value at index i of the column.
   else:
     # "n" is odd
     median = df.at[((n + 1) / 2), column]
   
   return median

def count_unique_values(df, column_name, unique_values_colum_name, count_name):
  # Find unique values and their counts
  unique_values_counts = df[column_name].value_counts()

  # Create a new DataFrame with unique values and counts
  result_df = pd.DataFrame({
    unique_values_colum_name: unique_values_counts.index,
    count_name: unique_values_counts.values
  })

  return result_df

# # Call the count_unique_values function
# engineer_income.df_unique = count_unique_values(engineer_income.df_raw, "Inntekt", "Unique_Values", "Counts")

def get_largest_value(df, unique_values_colum_name, count_name):
    # Find the index of the largest count
    max_count_index = df[count_name].idxmax()
    # Locate value with the corresponding index
    mode = df.loc[max_count_index, unique_values_colum_name]

    return mode
     

# Define data set class
class data_set:
  def __init__(self):
    self.path = None
    self.df_raw = None
    self.df_unique = None
    self.df_rising = None
    self.mode = None
    self.median = None
    self.n = None
    self.sum = None
    self.avg = None
    self.freq = None
    self.cum_freq = None
    self.std = None
    self.std_pop = None



####    Task 8    ####
###   Import data   ###
# rosa_kvit
rosa_kvit = data_set()
rosa_kvit.path = "oblig_1a/data/rosa_kvit42.csv"
rosa_kvit.df_raw = pd.read_csv(rosa_kvit.path)

# rosa_groon
rosa_groon = data_set()
rosa_groon.path = "oblig_1a/data/rosa_groon42.csv"
rosa_groon.df_raw = pd.read_csv(rosa_groon.path)

# Calculate midpoint and place in Midpunkt column
rosa_kvit.df_raw['Midpunkt'] = (rosa_kvit.df_raw['Lower'] + rosa_kvit.df_raw['Upper']) / 2
rosa_groon.df_raw['Midpunkt'] = (rosa_groon.df_raw['Lower'] + rosa_groon.df_raw['Upper']) / 2
###   Find mode, median, mean, standard deviation and population standard deviation   ###
# Mode
rosa_kvit.mode = rosa_kvit.df_raw["Midpunkt"].mode().iloc[0]
#rosa_groon.mode = rosa_groon.df_raw["Midpunkt"].mode().iloc[0]
print("Mode:")
print(rosa_kvit.mode)

# Median
rosa_kvit.median = rosa_kvit.df_raw["Midpunkt"].median()
#rosa_groon.median = rosa_groon.df_raw["Midpunkt"].median()
print("Median:")
print(rosa_kvit.median)

# Mean
rosa_kvit.avg = rosa_kvit.df_raw["Midpunkt"].mean()
#rosa_groon.avg = rosa_groon.df_raw["Midpunkt"].mean()
print("Avg:")
print(rosa_kvit.avg)

# Standard deviation
rosa_kvit.std = rosa_kvit.df_raw["Midpunkt"].std()
#rosa_groon.std = rosa_groon.df_raw["Midpunkt"].std()
print("Standard deviation:")
print(rosa_kvit.std)

# Population standard deviation
rosa_kvit.std_pop = rosa_kvit.df_raw["Midpunkt"].std(ddof=0)
#rosa_groon.std_pop = rosa_groon.df_raw["Midpunkt"].std(ddof=0)
print("Population standard deviation:")
print(rosa_kvit.std_pop)


###   Find mode, median, mean, standard deviation and population standard deviation   ###
# Mode
#rosa_kvit.mode = rosa_kvit.df_raw["Midpunkt"].mode().iloc[0]
rosa_groon.mode = rosa_groon.df_raw["Midpunkt"].mode().iloc[0]
print("Mode:")
print(rosa_groon.mode)

# Median
#rosa_kvit.median = rosa_kvit.df_raw["Midpunkt"].median()
rosa_groon.median = rosa_groon.df_raw["Midpunkt"].median()
print("Median:")
print(rosa_groon.median)

# Mean
#rosa_kvit.avg = rosa_kvit.df_raw["Midpunkt"].mean()
rosa_groon.avg = rosa_groon.df_raw["Midpunkt"].mean()
print("Avg:")
print(rosa_groon.avg)

# Standard deviation
#rosa_kvit.std = rosa_kvit.df_raw["Midpunkt"].std()
rosa_groon.std = rosa_groon.df_raw["Midpunkt"].std()
print("Standard deviation:")
print(rosa_groon.std)

# Population standard deviation
#rosa_kvit.std_pop = rosa_kvit.df_raw["Midpunkt"].std(ddof=0)
rosa_groon.std_pop = rosa_groon.df_raw["Midpunkt"].std(ddof=0)
print("Population standard deviation:")
print(rosa_groon.std_pop)



###   Tables   ###
## rosa_kvit
# Create a frequency table for the "Midpunkt" column
rosa_kvit.freq = rosa_kvit.df_raw['Midpunkt'].value_counts()

# Create cumulative frequency table for "Midpunkt" colum
rosa_kvit.cum_freq = rosa_kvit.df_raw['Midpunkt'].value_counts().sort_index(ascending=False).cumsum()

# Set table up in correct format
rosa_kvit_sorted = rosa_kvit.df_raw.groupby(['Lower', 'Upper', 'Midpunkt', 'Bredde']).size().reset_index(name='Antall')

# Sort the DataFrame by 'Frequency' in ascending order
rosa_kvit_sorted = rosa_kvit_sorted.sort_values('Midpunkt', ascending=False)

# Add a cumulative frequency column
rosa_kvit_sorted['Kumulativt Antall'] = rosa_kvit_sorted['Antall'].cumsum()


## rosa_groon
# Create a frequency table for the "Midpunkt" column
rosa_groon.freq = rosa_groon.df_raw['Midpunkt'].value_counts()

# Create cumulative frequency table for "Midpunkt" colum
rosa_groon.cum_freq = rosa_groon.df_raw['Midpunkt'].value_counts().sort_index(ascending=False).cumsum()

# Set table up in correct format
rosa_groon_sorted = rosa_groon.df_raw.groupby(['Lower', 'Upper', 'Midpunkt', 'Bredde']).size().reset_index(name='Antall')

# Sort the DataFrame by 'Antall' in ascending order
rosa_groon_sorted = rosa_groon_sorted.sort_values('Midpunkt', ascending=False)

# Add a cumulative frequency column
rosa_groon_sorted['Kumulativt Antall'] = rosa_groon_sorted['Antall'].cumsum()




###   Plotting   ###
## Set-Up  ##
# Create the first figure for frequency diagrams
fig1, axs1 = plt.subplots(2, 1, figsize=(8.27, 11.69))

# rosa_kvit
# First subplot: Frequency Diagram - rosa_kvit
axs1[0].bar(rosa_kvit.freq.index, rosa_kvit.freq, color='palegreen', width=4.5)
axs1[0].set_title('Frequency Diagram - rosa_kvit')
axs1[0].set_xlabel('Stretch before failure [cm]')
axs1[0].set_ylabel('Frequency')

# First subplot: Frequency Diagram - rosa_kvit
mean_line = axs1[0].axvline(rosa_kvit.avg, color='red', linestyle='dashed', linewidth=2)
median_line = axs1[0].axvline(rosa_kvit.median, color='green', linestyle='dashed', linewidth=2)
mode_line = axs1[0].axvline(rosa_kvit.mode, color='orange', linestyle='dashed', linewidth=2)
std_line = axs1[0].axvline(rosa_kvit.avg + rosa_kvit.std, color='purple', linestyle='dashed', linewidth=1)
std_neg_line = axs1[0].axvline(rosa_kvit.avg - rosa_kvit.std, color='purple', linestyle='dashed', linewidth=1)
std_pop_line = axs1[0].axvline(rosa_kvit.avg + rosa_kvit.std_pop, color='Yellow', linestyle='dashed', linewidth=2)
std_pop_neg_line = axs1[0].axvline(rosa_kvit.avg - rosa_kvit.std_pop, color='Yellow', linestyle='dashed', linewidth=2)


# Add a legend
axs1[0].legend([mean_line, median_line, mode_line, std_line, std_pop_line], ['Mean', 'Median', 'Mode', 'SD', 'PSD'], loc='upper right')

# rosa_groon
# Second subplot: Frequency Diagram - rosa_groon
axs1[1].bar(rosa_groon.freq.index, rosa_groon.freq, color='pink', width=4.5)
axs1[1].set_title('Frequency Diagram - rosa_groon')
axs1[1].set_xlabel('Stretch before failure [cm]')
axs1[1].set_ylabel('Frequency')

# First subplot: Frequency Diagram - rosa_groon
mean_line = axs1[1].axvline(rosa_groon.avg, color='red', linestyle='dashed', linewidth=2)
median_line = axs1[1].axvline(rosa_groon.median, color='green', linestyle='dashed', linewidth=2)
mode_line = axs1[1].axvline(rosa_groon.mode, color='orange', linestyle='dashed', linewidth=2)
std_line = axs1[1].axvline(rosa_groon.avg + rosa_groon.std, color='purple', linestyle='dashed', linewidth=2)
std_neg_line = axs1[1].axvline(rosa_groon.avg - rosa_groon.std, color='purple', linestyle='dashed', linewidth=2)
std_pop_line = axs1[1].axvline(rosa_groon.avg + rosa_groon.std_pop, color='Yellow', linestyle='dashed', linewidth=2)
std_pop_neg_line = axs1[1].axvline(rosa_groon.avg - rosa_groon.std_pop, color='Yellow', linestyle='dashed', linewidth=2)

# Add a legend
axs1[1].legend([mean_line, median_line, mode_line, std_line, std_pop_line], ['Mean', 'Median', 'Mode', 'SD', 'PSD'], loc='upper right')

# Increase the vertical space between the subplots
plt.subplots_adjust(hspace=0.5)

# Create the second figure for cumulative frequency diagrams
fig2, axs2 = plt.subplots(2, 1, figsize=(8.27, 11.69))
# rosa_kvit
# First subplot: Cumulative Frequency Diagram - rosa_kvit
axs2[0].plot(np.array(rosa_kvit.cum_freq.index), np.array(rosa_kvit.cum_freq.values), marker='o', color='palegreen')
axs2[0].set_title('Cumulative Frequency Diagram - rosa_kvit')
axs2[0].set_xlabel('Stretch before failure [cm]')
axs2[0].set_ylabel('Cumulative Frequency')

# Second subplot: Cumulative Frequency Diagram - rosa_kvit
mean_line = axs2[0].axvline(rosa_kvit.avg, color='red', linestyle='dashed', linewidth=2)
median_line = axs2[0].axvline(rosa_kvit.median, color='green', linestyle='dashed', linewidth=2)
mode_line = axs2[0].axvline(rosa_kvit.mode, color='orange', linestyle='dashed', linewidth=2)
std_line = axs2[0].axvline(rosa_kvit.avg + rosa_kvit.std, color='purple', linestyle='dashed', linewidth=2)
std_neg_line = axs2[0].axvline(rosa_kvit.avg - rosa_kvit.std, color='purple', linestyle='dashed', linewidth=2)
std_pop_line = axs2[0].axvline(rosa_kvit.avg + rosa_kvit.std_pop, color='Yellow', linestyle='dashed', linewidth=2)
std_pop_neg_line = axs2[0].axvline(rosa_kvit.avg - rosa_kvit.std_pop, color='Yellow', linestyle='dashed', linewidth=2)

# Add a legend
axs2[0].legend([mean_line, median_line, mode_line, std_line, std_pop_line], ['Mean', 'Median', 'Mode', 'SD', 'PSD'], loc='upper right')

# rosa_groon
# Second subplot: Cumulative Frequency Diagram - rosa_groon
axs2[1].plot(np.array(rosa_groon.cum_freq.index), np.array(rosa_groon.cum_freq.values), marker='o', color='pink')
axs2[1].set_title('Cumulative Frequency Diagram - rosa_groon')
axs2[1].set_xlabel('Stretch before failure [cm]')

# rosa_kvit
# First subplot: Cumulative Frequency Diagram - rosa_kvit
axs2[0].plot(np.array(rosa_kvit.cum_freq.index), np.array(rosa_kvit.cum_freq.values), marker='o', color='palegreen')
axs2[0].set_title('Cumulative Frequency Diagram - rosa_kvit')
axs2[0].set_xlabel('Stretch before failure [cm]')
axs2[0].set_ylabel('Cumulative Frequency')

# Second subplot: Cumulative Frequency Diagram - rosa_kvit
mean_line = axs2[0].axvline(rosa_kvit.avg, color='red', linestyle='dashed', linewidth=2)
median_line = axs2[0].axvline(rosa_kvit.median, color='green', linestyle='dashed', linewidth=2)
mode_line = axs2[0].axvline(rosa_kvit.mode, color='orange', linestyle='dashed', linewidth=2)
std_line = axs2[0].axvline(rosa_kvit.avg + rosa_kvit.std, color='purple', linestyle='dashed', linewidth=2)
std_neg_line = axs2[0].axvline(rosa_kvit.avg - rosa_kvit.std, color='purple', linestyle='dashed', linewidth=2)
std_pop_line = axs2[0].axvline(rosa_kvit.avg + rosa_kvit.std_pop, color='Yellow', linestyle='dashed', linewidth=2)
std_pop_neg_line = axs2[0].axvline(rosa_kvit.avg - rosa_kvit.std_pop, color='Yellow', linestyle='dashed', linewidth=2)

# Add a legend
axs2[0].legend([mean_line, median_line, mode_line, std_line, std_pop_line], ['Mean', 'Median', 'Mode', 'SD', 'PSD'], loc='upper right')

# rosa_groon
# Second subplot: Cumulative Frequency Diagram - rosa_groon
axs2[1].plot(np.array(rosa_groon.cum_freq.index), np.array(rosa_groon.cum_freq.values), marker='o', color='pink')
axs2[1].set_title('Cumulative Frequency Diagram - rosa_groon')
axs2[1].set_xlabel('Stretch before failure [cm]')
axs2[1].set_ylabel('Cumulative Frequency')

# Second subplot: Cumulative Frequency Diagram - rosa_groon
mean_line = axs2[1].axvline(rosa_groon.avg, color='red', linestyle='dashed', linewidth=2)
median_line = axs2[1].axvline(rosa_groon.median, color='green', linestyle='dashed', linewidth=2)
mode_line = axs2[1].axvline(rosa_groon.mode, color='orange', linestyle='dashed', linewidth=2)
std_line = axs2[1].axvline(rosa_groon.avg + rosa_groon.std, color='purple', linestyle='dashed', linewidth=2)
std_neg_line = axs2[1].axvline(rosa_groon.avg - rosa_groon.std, color='purple', linestyle='dashed', linewidth=2)
std_pop_line = axs2[1].axvline(rosa_groon.avg + rosa_groon.std_pop, color='Yellow', linestyle='dashed', linewidth=2)
std_pop_neg_line = axs2[1].axvline(rosa_groon.avg - rosa_groon.std_pop, color='Yellow', linestyle='dashed', linewidth=2)

# Add a legend
axs2[1].legend([mean_line, median_line, mode_line, std_line, std_pop_line], ['Mean', 'Median', 'Mode', 'SD', 'PSD'], loc='upper right')

# Increase the vertical space between the subplots
plt.subplots_adjust(hspace=0.5)


# Show the plots
plt.show()


#### Save Files  ####
##  Save figures  ##
# Define the relative directory where you want to save the files
directory = "oblig_1a/figures/"

# Create the directory if it doesn't exist
os.makedirs(directory, exist_ok=True)


# Define the name of the first file
filename1 = 'freq.png'

# Construct the full path to the first file
full_path1 = os.path.join(directory, filename1)

# Save the first figure to this location
fig1.savefig(full_path1, format='png')


# Define the name of the second file
filename2 = 'cum_freq.png'

# Construct the full path to the second file
full_path2 = os.path.join(directory, filename2)

# Save the second figure to this location
fig2.savefig(full_path2, format='png')





## Save tables ##
# Specify the directory
directory_table = "oblig_1a/tables/"
os.makedirs(directory_table, exist_ok=True)


# Save the tables as CSV files
try:
  rosa_kvit_sorted.to_csv(os.path.join(directory_table, "rosa_kvit_table.csv"), index=False)
  rosa_groon_sorted.to_csv(os.path.join(directory_table, "rosa_groon_table.csv"), index=False)
except Exception as e:
    print(f"An error occurred: {e}")

# Save the first figure as .png
filename1 = 'freq.png'
full_path1 = os.path.join(directory, filename1)
fig1.savefig(full_path1)

# Save the second figure as .png
filename2 = 'cum_freq.png'
full_path2 = os.path.join(directory, filename2)
fig2.savefig(full_path2)
