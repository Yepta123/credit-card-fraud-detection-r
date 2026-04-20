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

- Import transaction dataset
- Check missing values and data quality
- Validate target labels (`Class`)

### 2. Exploratory Data Analysis

- Distribution plots
- Correlation matrix
- Violin plots by class
- Fraud pattern exploration

### 3. Modeling

- Split data training testing (70% training, 30% testing) 
- Logistic Regression model

### 4. Model Evaluation

- Confusion Matrix
- Accuracy   : 96,5%
- Precision  : 97,7%
- Recall     : 95,1%
- F1 Score   : 96,4%
- ROC Curve  : 0.9935

---

## Key Findings

- Variables **V14**, **V17**, and **V10** showed strong separation between fraudulent and legitimate transactions.
- Transaction **Amount** alone was not a strong predictor.
- Recall is more important than accuracy in fraud detection use cases.

---


## Output
### 1. Distribution plots
 ![Image Alt](https://github.com/Yepta123/credit-card-fraud-detection-r/blob/4c97df8e5c7aa4e1bd7c07e04a4b87309104e482/Distribusi_Variables.png)

### 2. Correlation Matriks
![Image Alt](https://github.com/Yepta123/credit-card-fraud-detection-r/blob/062701cde2b8c7b323c44312b38fdfb6d31be92c/Correlation_Matriks.png)

### 3. Violin Plot 
![Image Alt](https://github.com/Yepta123/credit-card-fraud-detection-r/blob/7149342a470d7b80dfc91c73c5fd5fc13cd1e048/Violin_Plot.png).

### 4.ROC & PR Curve
![Image Alt](https://github.com/Yepta123/credit-card-fraud-detection-r/blob/7149342a470d7b80dfc91c73c5fd5fc13cd1e048/ROC_Curve.png).
