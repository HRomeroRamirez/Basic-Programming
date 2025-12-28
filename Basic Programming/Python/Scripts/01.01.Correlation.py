import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from scipy import stats
from src.reticulate import r

# 1. Load Data (Borrowing from R's built-in mtcars)
mtcars = r.mtcars

# ---------------------------------------------------------
# Part I: Correlation Analysis
# ---------------------------------------------------------

# Simple correlation (R's cor)
correlation_value = mtcars['hp'].corr(mtcars['mpg'])
print(f"Pearson Correlation: {correlation_value}")

# Detailed Correlation Tests (R's cor.test)
# Pearson (Default)
pearson_coef, p_value = stats.pearsonr(mtcars['hp'], mtcars['mpg'])
print(f"Pearson test: coef={pearson_coef:.4f}, p-value={p_value:.4f}")

# Spearman
spearman_coef, s_p_value = stats.spearmanr(mtcars['hp'], mtcars['mpg'])
print(f"Spearman test: coef={spearman_coef:.4f}, p-value={s_p_value:.4f}")

# Kendall
kendall_coef, k_p_value = stats.kendalltau(mtcars['hp'], mtcars['mpg'])
print(f"Kendall test: coef={kendall_coef:.4f}, p-value={k_p_value:.4f}")

# ---------------------------------------------------------
# Part II: Visualizations
# ---------------------------------------------------------

# Histograms
fig, axes = plt.subplots(1, 2, figsize=(10, 4))
sns.histplot(mtcars['hp'], ax=axes[0]).set_title('Histogram of HP')
sns.histplot(mtcars['mpg'], ax=axes[1]).set_title('Histogram of MPG')
plt.show()

# Scatter Plot with Regression Line (R's qplot + geom_smooth)
plt.figure(figsize=(8, 6))
sns.regplot(data=mtcars, x='hp', y='mpg', ci=None, line_kws={"color": "blue"})
plt.title("Figure 4: Strong Negative Association")
plt.show()
