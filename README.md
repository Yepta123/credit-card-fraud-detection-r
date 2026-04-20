# Credit Card Fraud Detection Analysis in R

## Project Overview

This project explores credit card transaction data to identify fraudulent activities using exploratory data analysis (EDA), visualization, and machine learning techniques in R.

Fraud detection is a critical problem in financial services, where minimizing financial loss while maintaining customer experience is essential.

---

## Objectives

- Analyze behavioral differences between legitimate and fraudulent transactions
- Identify high-risk variables associated with fraud
- Build a baseline fraud detection model
- Evaluate model performance using fraud-relevant metrics
- Generate actionable business recommendations

---

## Tools & Libraries

- R
- tidyverse
- ggplot2
- caret
- pROC
- PRROC
- corrplot

---

## Project Workflow

### 1. Data Preparation

- Imported transaction dataset
- Checked missing values and data quality
- Validated target labels (`Class`)

### 2. Exploratory Data Analysis

- Summary statistics
- Variable distribution analysis
- Class distribution review
- Correlation matrix
- Violin plots comparing fraud vs legitimate transactions

### 3. Predictive Modeling

- Train-test split
- Logistic Regression model

### 4. Model Evaluation

- Confusion Matrix
- Precision
- Recall
- F1 Score
- ROC Curve
- Precision-Recall Curve

---

## Key Findings

- Variables **V14**, **V17**, and **V10** showed strong separation between fraudulent and legitimate transactions.
- Transaction **Amount** alone was not a strong predictor.
- Balanced class distribution likely improved model learning performance.

---

## Business Recommendations

- Flag transactions exhibiting high-risk anomaly patterns.
- Combine amount thresholds with behavioral signals.
- Optimize recall while managing false positives.
- Use predictive models to support real-time fraud monitoring.

---

## Output
1. Distribusi Variables
 ![Image Alt](https://github.com/Yepta123/credit-card-fraud-detection-r/blob/4c97df8e5c7aa4e1bd7c07e04a4b87309104e482/Distribusi_Variables.png)
