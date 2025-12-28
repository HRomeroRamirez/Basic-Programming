import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# 1. Use the 'r' object provided by reticulate
try:
    from src.reticulate import r
except ImportError:
    # If the import fails, we use the built-in 'r' object already in the session
    pass 

# Grab the data from R
flights = r.flights

# ---------------------------------------------------------
# Part I: Filtering & Arranging
# ---------------------------------------------------------

# Select Jan 1st
jan1 = flights.query('month == 1 and day == 1')

# Nov or Dec
nov_dec = flights[flights['month'].isin([11, 12])]

# Not delayed > 2 hours
not_delayed = flights.query('arr_delay <= 120 and dep_delay <= 120')

# Arrange
flights_sorted = flights.sort_values(['year', 'month', 'day'])
flights_delayed_desc = flights.sort_values('dep_delay', ascending=False)

# ---------------------------------------------------------
# Part II: Selection & Summarization
# ---------------------------------------------------------

subset = flights[['year', 'month', 'day']]
avg_delay = flights['dep_delay'].mean()

# The grouping logic
delays = (
    flights.groupby('dest')
    .agg(
        count=('dest', 'size'),
        dist=('distance', 'mean'),
        delay=('arr_delay', 'mean')
    )
    .query('count > 20 and dest != "HNL"')
    .reset_index()
)

# ---------------------------------------------------------
# Part III: Visualization
# ---------------------------------------------------------

sns.set_theme(style="white")
plt.figure(figsize=(10, 6))

sns.regplot(
    data=delays, 
    x='dist', 
    y='delay', 
    lowess=True, 
    scatter_kws={'s': delays['count'] * 0.5, 'alpha': 0.25},
    line_kws={'color': 'blue'}
)

plt.title("Average Arrival Delay vs. Distance")
plt.xlabel("Distance")
plt.ylabel("Arrival Delay")
plt.show()
