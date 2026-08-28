# vgsales_analysis
# 🎮 Video Game Sales Outlier & Market DNA Analysis

An end-to-end data analytics project using **Python** for statistical outlier classification and **Power BI** for executive reporting. 

## Dashboard Preview
<img width="1195" height="651" alt="Screenshot 2026-08-28 193917" src="https://github.com/user-attachments/assets/16874e9e-b1f8-4d92-aab1-eebda7244e97" />


## Project Workflow
1. **Data Engineering (Python):** 
   - Used statistical boxplot upper bounds ($Q3 + 1.5 \times IQR$) dynamically across regional columns to isolate macro-level market anomalies ("Mega-Hits") without arbitrary guessing thresholds.
   - Melted/unpivoted wide-format regional data into a long-format schema using `pd.melt()` for optimized reporting performance.
2. **Business Intelligence (Power BI):**
   - Modeled a 1-to-many dimensional relationship across data segments.
   - Designed clean corporate metrics bypassing unnecessary DAX layers by utilizing pre-aggregated engine pipelines.

## Key Market Insights
- **The Power-Law Reality:** The industry relies heavily on hyper-performing outlier titles; the mathematical baseline for a regular game sits almost flat against blockbuster revenue.
- **Regional DNA Nuances:** Western markets show extreme revenue cluster concentrations on Action/Shooter titles, whereas the Japanese landscape is dominated historically by Role-Playing ecosystems.
