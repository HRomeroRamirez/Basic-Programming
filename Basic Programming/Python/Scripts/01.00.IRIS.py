import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# 1. Use the 'r' object provided by reticulate to get the R dataset
from src.reticulate import r
iris = r.iris

# 2. Convert R dots to Python underscores so the rest of your code works
iris.columns = [c.replace('.', '_').lower() for c in iris.columns]

# --- PART I: DATA MANIPULATION ---
summary_stats = (
    iris.query('sepal_length > 6')
    .groupby('species')
    .agg(median_pl=('petal_length', 'median'), 
         max_pl=('petal_length', 'max'))
    .reset_index()
)
print(summary_stats)

# --- PART II: VISUALIZATION ---
iris_small = iris.query('sepal_length > 5')

# Scatter Plot with Faceting
sns.relplot(data=iris_small, x='petal_length', y='petal_width', 
            hue='species', col='species', kind='scatter')
plt.show()

# Boxplot
plt.figure(figsize=(8, 5))
sns.boxplot(data=iris_small, x='species', y='sepal_width')
plt.title("Sepal Width by Species")
plt.show()
