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

## Repository Structure

```text
credit-card-fraud-detection-r/
├── data/
│   └── creditcard.csv
├── scripts/
│   └── fraud_detection_analysis.R
├── outputs/
│   ├── class_distribution.png
│   ├── violin_plot.png
│   ├── correlation_matrix.png
│   └── roc_curve.png
└── README.md
