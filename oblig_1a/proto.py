import pandas as pd

# Define data
data = {
 'Lower': [0.25, 0.25, 0.25, 0.25, 0.25, 0.00, 0.00, 0.00, 0.00],
 'Upper': [0.75, 0.75, 0.75, 0.75, 0.75, 0.50, 0.50, 0.50, 0.50],
 'Mid': [0.50, 0.50, 0.50, 0.50, 0.50, 0.25, 0.25, 0.25, 0.25],
 'Width': [0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2]
}

# Create DataFrame
df = pd.DataFrame(data)

# Group by all columns and count the occurrence of each row
sorted_df = df.groupby(['Lower', 'Upper', 'Mid', 'Width']).size().reset_index(name='Frequency')

# Add a cumulative frequency column
sorted_df['Cumulative Frequency'] = sorted_df['Frequency'].cumsum()

print(sorted_df)