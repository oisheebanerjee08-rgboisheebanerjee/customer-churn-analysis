# Customer Churn Analysis — Subscription Business

## Problem Statement
Which customer behaviours and contract factors most strongly predict churn in a subscription business — and how early can at-risk customers be identified before they disengage?

## Dataset
- **Source:** Kaggle — Customer Churn Prediction Business Dataset
- **Records:** 10,000 customers, 32 features
- **Target variable:** `churn` (0 = Stayed, 1 = Churned)
- **Domain:** Subscription / SaaS / Service Business
- **Note:** Synthetically generated using business-driven rules to simulate realistic customer behaviour

## Tools Used
- **Python** (pandas, matplotlib, seaborn) — data cleaning, EDA, visualisation
- **MySQL** — database creation, data import, SQL business queries
- **Power BI** — interactive dashboard with contract type slicer

## Key Findings

### 1. Overall Churn Rate — 10.2%
1,021 out of 10,000 customers churned. Imbalanced dataset reflecting real-world subscription business conditions.

### 2. Payment Failures = Strongest Churn Signal
| Payment Failures | Churn Rate |
|---|---|
| 0 | 8.8% |
| 1 | 8.7% |
| 2 | **25.3%** |
| 3 | 21.5% |
| 5 | 33.3% |

Customers with 2+ payment failures churn at 3x the rate of customers with 0-1 failures. The threshold is exactly 2 failures — a concrete, actionable early warning trigger.

### 3. First Year is the Danger Zone
| Tenure | Churn Rate |
|---|---|
| Under 12 months | **19.4%** |
| 12-24 months | 8.7% |
| 25-36 months | 7.9% |
| Over 36 months | 7.8% |

Churn rate drops by more than half after the first year and stays flat. Early-stage customer success has the highest possible ROI.

### 4. Contract Type Does NOT Predict Churn
Monthly (10.3%), Yearly (10.3%), Quarterly (9.9%) — nearly identical. Churn is behavioural, not structural.

### 5. Churn is Behavioural, Not Demographic
Correlation analysis shows no single variable strongly predicts churn. The highest risk profile combines: short tenure + low CSAT + payment failures + low engagement. Segment and contract type are weak predictors.

## Business Recommendations
1. **Flag customers at 2nd payment failure** — implement automated retention outreach at this threshold
2. **Dedicated onboarding programme for first 12 months** — this window carries 2.5x the churn risk
3. **CSAT-triggered interventions** — customers scoring below 3.0 should receive proactive support outreach
4. **Engagement monitoring** — customers with declining login frequency are early churn signals

## Dashboard Preview
![Dashboard](Screenshot_2026-06-07_131746.png)

## Project Structure
- `churn_analysis.ipynb` — Python EDA and visualisations
- `queries1.sql` — MySQL business queries
- `churn_dashboard.pbix` — Power BI interactive dashboard
- `churn_cleaned.csv` — cleaned dataset
- `customer_churn_business_dataset.csv` — original dataset

## Limitations
- Synthetic dataset — patterns are business-logic driven, not from real customer behaviour
- No temporal data — cannot track churn over time or identify seasonal patterns
- Binary churn label — does not distinguish voluntary cancellation from payment failure churn

---
*Oishee Banerjee · June 2026 
