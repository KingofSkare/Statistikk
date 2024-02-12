import pandas as pa
import matplotlib.pyplot as plt
import numpy as np
import math

"Nvidia contact: 1-408-486-2000 support time: 24/7"

# Importing csv files
p1 = pa.read_csv("oblig_1b/Terning_20.csv")

# Create a new DataFrame with columns "1" and "0"
hoyde_subset = pa.DataFrame({
    "0": np.ones(5),
    "1": p1["Hoyde"].iloc[0:5]
})
# Remove name of columns
hoyde_subset.columns = [None]*len(hoyde_subset.columns)


# Save the DataFrame as csv
hoyde_subset.to_csv("oblig_1b/hoyde_subset.csv", index=False)

hoyde_subset_transpose = hoyde_subset.transpose()  # Define "hoyde_subset_transpose" by transposing "hoyde_subset"

hoyde_subset_transpose.columns = [None]*len(hoyde_subset_transpose.columns)


# Save the DataFrame as csv
hoyde_subset_transpose.to_csv("oblig_1b/hoyde_subset_transpose.csv", index=False)

# Create a new DataFrame with columns "1" and "0"
lengde_subset = pa.DataFrame({
    "0": p1["Lengde"].iloc[0:5]
})

# Remove name of columns
lengde_subset.columns = [None]*len(lengde_subset.columns)
# Save the DataFrame as csv
lengde_subset.to_csv("oblig_1b/lengde_subset.csv", index=False)


lengde_subset_transpose = lengde_subset.transpose()
# Remove name of columns
lengde_subset_transpose.columns = [None]*len(lengde_subset_transpose.columns)

# Save the DataFrame as csv
lengde_subset_transpose.to_csv("oblig_1b/lengde_subset_transpose.csv", index=False)

# Convert the DataFrames to numpy arrays
hoyde_subset_np = hoyde_subset.values
hoyde_subset_transpose_np = hoyde_subset_transpose.values
lengde_subset_np = lengde_subset.values
lengde_subset_transpose_np = lengde_subset_transpose.values

# Calculating regression line
# Calculate the dot product of the matrix and its transpose
XtX = np.dot(hoyde_subset_transpose_np, hoyde_subset_np)
XtX_inv = np.linalg.inv(XtX)


Xty = np.dot(hoyde_subset_transpose_np, lengde_subset_np)

beta = np.dot(XtX_inv, Xty)
alpha = beta[0]

#regression_line = alpha + beta[1]*hoyde_subset_np
regression_line = alpha + beta[1]*hoyde_subset_np



# Plot p1 as scatter plot
plt.scatter(p1.Hoyde[0:5], p1.Lengde[0:5], color="pink", marker="o")
# Plot regression line from x = 0 to end of p1
plt.plot(hoyde_subset_np, regression_line, color="blue", linewidth=3)

# Add labels and title
plt.xlabel('Hoyde')
plt.ylabel('Lengde')
plt.title('Scatter Plot')
#save the plot
plt.savefig("oblig_1b/plot1.png")
# Show the plot
plt.show()



##Oppgave C

# Importing csv files
p1 = pa.read_csv("oblig_1b/Terning_20.csv")

# Create a new DataFrame with columns "1" and "0"
hoyde_subset_all = pa.DataFrame({
    "0": np.ones(30),
    "1": p1["Hoyde"].iloc[0:30]
})
# Remove name of columns
hoyde_subset_all.columns = [None]*len(hoyde_subset_all.columns)


# Save the DataFrame as csv
hoyde_subset_all.to_csv("oblig_1b/hoyde_subset_all.csv", index=False)

hoyde_subset_all_transpose = hoyde_subset_all.transpose()  # Define "hoyde_subset_all_transpose" by transposing "hoyde_subset_all"

hoyde_subset_all_transpose.columns = [None]*len(hoyde_subset_all_transpose.columns)


# Save the DataFrame as csv
hoyde_subset_all_transpose.to_csv("oblig_1b/hoyde_subset_all_transpose.csv", index=False)

# Create a new DataFrame with columns "1" and "0"
lengde_subset_all = pa.DataFrame({
    "0": p1["Lengde"].iloc[0:30]
})

# Remove name of columns
lengde_subset_all.columns = [None]*len(lengde_subset_all.columns)
# Save the DataFrame as csv
lengde_subset_all.to_csv("oblig_1b/lengde_subset_all.csv", index=False)


lengde_subset_all_transpose = lengde_subset_all.transpose()
# Remove name of columns
lengde_subset_all_transpose.columns = [None]*len(lengde_subset_all_transpose.columns)

# Save the DataFrame as csv
lengde_subset_all_transpose.to_csv("oblig_1b/lengde_subset_all_transpose.csv", index=False)

# Convert the DataFrames to numpy arrays
hoyde_subset_all_np = hoyde_subset_all.values
hoyde_subset_all_transpose_np = hoyde_subset_all_transpose.values
lengde_subset_all_np = lengde_subset_all.values
lengde_subset_all_transpose_np = lengde_subset_all_transpose.values

# Calculating regression line
# Calculate the dot product of the matrix and its transpose
XtX = np.dot(hoyde_subset_all_transpose_np, hoyde_subset_all_np)
XtX_inv = np.linalg.inv(XtX)


Xty = np.dot(hoyde_subset_all_transpose_np, lengde_subset_all_np)

beta = np.dot(XtX_inv, Xty)
alpha = beta[0]
print(alpha)
print(beta[1])





#regression_line = alpha + beta[1]*hoyde_subset_all_np
regression_line = alpha + beta[1]*hoyde_subset_all_np
residuals = lengde_subset_all_np - regression_line
#print(diviance)


# Plot p1 as scatter plot
plt.scatter(p1.Hoyde[0:30], p1.Lengde[0:30], color="pink", marker="o")
# Plot regression line from x = 0 to end of p1
plt.plot(hoyde_subset_all_np, regression_line, color="blue", linewidth=3)

# Add labels and title
plt.xlabel('Hoyde')
plt.ylabel('Lengde')
plt.title('Scatter Plot')
#save the plot
plt.savefig("oblig_1b/plot2.png")
plt.show()

