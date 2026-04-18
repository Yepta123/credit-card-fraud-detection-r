
library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(tidyverse)
library(caret)
library(PRROC)
library(gridExtra)
library(randomForest)
library(pROC)
library(rpart)
library(randomForest)
library(nnet)
library(caTools)
library(corrplot)

# Load the original dataset
library(readr)
creditcard_2023_csv <- read_csv("C:/Users/myasu/Downloads/creditcard_2023.csv.zip")
View(creditcard_2023_csv)


#Remove the 'id' column
credit_card_data <- creditcard_2023_csv[, -1]
head(credit_card_data)
View(credit_card_data)

#Check for missing values
colSums(is.na(credit_card_data))

#Exploratory Data Analysis
summary_metrics <- credit_card_data %>%
  summarise(across(everything(), list(
    Mean = ~mean(., na.rm = TRUE),
    SD = ~sd(., na.rm = TRUE),
    Min = ~min(., na.rm = TRUE),
    Max = ~max(., na.rm = TRUE)
  ))) %>%
  pivot_longer(cols = everything(), names_to = "Variable_Metric", values_to = "Value") %>%
  separate(Variable_Metric, into = c("Variable", "Metric"), sep = "_") %>%
  pivot_wider(names_from = Variable, values_from = Value)

print(summary_metrics)

summary(credit_card_data$Amount)

# Create distribution plots
options(repr.plot.width=12, repr.plot.height=10)
credit_card_data %>%
  select(-Class) %>%
  gather() %>% 
  ggplot(aes(value, fill = key)) +
  geom_density(alpha = 0.5) +
  facet_wrap(~key, scales = "free") +
  labs(title = "Distribution of Variables") +
  guides(fill = "none")

# Create the correlation plot
corr_matrix <- credit_card_data %>% select(-Class) %>% cor()
options(repr.plot.width=12, repr.plot.height=8)
corrplot(corr_matrix, method = "circle", tl.cex = 0.8)

# Create a violin plot distribution by class
options(repr.plot.width=12, repr.plot.height=10)
credit_card_data %>%
  gather(key = "Variable", value = "Value", -Class) %>%
  mutate(Class = as.factor(Class)) %>%
  ggplot(aes(x = Class, y = Value, fill = Class)) +
  geom_violin() +
  facet_wrap(~ Variable, scales = "free") +
  labs(title = "Distribution of Variables by Class",
       x = "Class",
       y = "Value") +
  scale_fill_manual(values = c("0" = "blue", "1" = "orange")) +
  theme_minimal() +
  guides(fill = "none")

# Plot class distribution
options(repr.plot.width=10, repr.plot.height=7)
ggplot(credit_card_data, aes(x = factor(Class), fill = factor(Class))) +
  geom_bar() +
  labs(x = "Class", y = "Count", fill = "Class", title = "Distribution of Classes") +
  scale_fill_manual(values = c("0" = "blue", "1" = "orange"), labels = c("Genuine", "Fraudulent")) +
  scale_y_continuous(labels = scales::comma) + 
  theme_minimal()

table(credit_card_data$Class)

#Pre processing Data 
#Normalisasi Amount 
#Normale 'Amount' varaible
preProcessRange <- preProcess(credit_card_data["Amount"], method = c("center", "scale"))
data_norm <- predict(preProcessRange, credit_card_data["Amount"])
credit_card_data <- bind_cols(credit_card_data[, -which(names(credit_card_data) %in% "Amount")], data_norm)
head(credit_card_data)
view(credit_card_data)

#Split Data training testing 
# Split into training and test sets (e.g., 70% training, 30% test)
set.seed(123)
split = sample.split(credit_card_data$Class, SplitRatio = 0.7)
training_set = subset(credit_card_data, split == TRUE)
test_set = subset(credit_card_data, split == FALSE)

nrow(training_set)
nrow(test_set)

#Modelingg 
# Logistic regression model
set.seed(123)
glm_model = glm(Class~. ,data = training_set, family = binomial(link = 'logit'))
summary(glm_model)
pred_glm <- predict(glm_model, newdata = test_set, type = 'response')
view(pred_glm)


# ROC and PR Curves for GLM  model
glm_fg <- pred_glm[test_set$Class == 1]
glm_bg <- pred_glm[test_set$Class == 0]

glm_roc <- roc.curve(scores.class0 = glm_fg , scores.class1 = glm_bg, curve = T)
glm_pr <- pr.curve(scores.class0 = glm_fg , scores.class1 = glm_bg, curve = T)

options(repr.plot.width=12, repr.plot.height=7)
par(mfrow = c(1, 2))
plot(glm_roc, col = "blue", main = "ROC Curve")
plot(glm_pr, col = "blue", main = "PR Curve")


#Modelling version 2
#Build the logistic regression model 
Fraudmodel <- glm(Class ~ ., data = training_set, family = binomial)
summary (Fraudmodel) 

#predictions with data testing
predictions <- predict(Fraudmodel, newdata = test_set, type = "response")
view(predictions) #These are Probabilities
length(predictions)

#Convert probabilities to classes
predictionsClasses <- ifelse(predictions > 0.5, "1", "0")
head(predictionsClasses) #Fraud = 1 or Not Fraud = 0
view(predictionsClasses)
table(predictionsClasses)
which(predictionsClasses == "1")
subset(test_set, predictionsClasses == 1)

#Check Akurasi Model 
confusionMatrix <- table(Predicted = predictionsClasses, Actual = test_set$Class)
confusionMatrix

accuracy <- sum(diag(confusionMatrix)) / sum(confusionMatrix)
print(accuracy)

precision <- confusionMatrix[2, 2] / sum(confusionMatrix[2, ])
print(precision)

recall <- confusionMatrix[2, 2] / sum(confusionMatrix[, 2])
print(recall)

f1 <- 2 * (precision * recall) / (precision + recall)
print(f1)

library(pROC)
rocCurve <- roc(test_set$Class, predictions)
plot(rocCurve, main = "ROC Curve")
auc(rocCurve)  # Area Under the Curve

prCurve <- pr(test_set$Class, predictions)
plot(prCurve, main = "PR Curve")
auc(prCurve)  # Area Under the Curve