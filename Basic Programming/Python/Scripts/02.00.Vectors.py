import pandas as pd
import numpy as np

# 1. Setup the data
days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
poker = [140, -50, 20, -120, 240]
roulette = [-24, -50, 100, -350, 10]

# 2. Create the DataFrame (The Python equivalent of an R Data Frame)
# We use a dictionary {} to map column names to our lists
df = pd.DataFrame({
    'poker': poker,
    'roulette': roulette
}, index=days)

# 3. Add a "total" column (Calculated across rows)
df['daily_total'] = df['poker'] + df['roulette']

# 4. Analysis (The DPLYR-style logic)
# Find the average of each game
averages = df.mean()

# Check which days were profitable overall
profitable_days = df.query('daily_total > 0')

# 5. Output results
print("--- Full Weekly Ledger ---")
print(df)
print("\n--- Summary ---")
print(f"Total Week Winnings: {df['daily_total'].sum()}")
print(f"Was Poker better than Roulette? {df['poker'].sum() > df['roulette'].sum()}")
print("\n--- Profitable Days Only ---")
print(profitable_days)

