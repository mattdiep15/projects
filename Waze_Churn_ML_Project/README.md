<img src="images\wazelogo.png" alt="Confusion Matrix" width="300"/>

# Waze User Churn Prediction

This project analyzes user behavior data from **Waze**, a real-time, community-based navigation app, to predict user churn.

The goal is to build machine learning models that identify users who are likely to stop using the service, to support early intervention efforts for user retention.


## 📁 Project Structure
waze_churn_project
├── data
│   └── waze_user_data.csv            # Waze dataset
│   
├── images
│   └── wazelogo.png                  # Waze logo
│
├── notebooks                         # Analysis and modeling notebooks
│   ├── 01_EDA.ipynb                  # Exploratory Data Analysis
│   ├── 02_Hypothesis_Testing.ipynb   # Statistical Analysis
│   ├── 03_Regression_Modeling.ipynb  # Logistic Regression
│   └── 04_Tree_Based_Models.ipynb    # Random Forest, XGBoost models
│
└── README.md                         # Project overview

## Dataset

**Source**: Provided as part of the Google Advanced Data Analytics Certificate coursework. 

#### **Dataset Columns**

| Column Name                | Description                                                                 |
|----------------------------|-----------------------------------------------------------------------------|
| `ID`                       | Unique identifier for each user                                             |
| `label`                    | Target variable: 1 if the user churned, 0 otherwise                         |
| `sessions`                 | Number of app sessions recorded                                             |
| `drives`                   | Number of driving sessions                                                  |
| `total_sessions`           | Total number of sessions (including both navigation and drive sessions)     |
| `n_days_after_onboarding`  | Number of days since the user signed up                                     |
| `total_navigations_fav1`   | Number of times the user navigated to their favorite location #1            |
| `total_navigations_fav2`   | Number of times the user navigated to their favorite location #2            |
| `driven_km_drives`         | Total kilometers driven across all drive sessions                          |
| `duration_minutes_drives` | Total minutes spent driving                                                 |
| `activity_days`            | Number of unique days the app was used                                      |
| `driving_days`             | Number of unique days with recorded driving activity                        |
| `device`                   | Type of device used (e.g., Android or iPhone)                               |




## Objectives

- Perform exploratory data analysis (EDA) to understand driving behavior and churn trends.
- Test hypotheses to validate behavioral differences between churned and retained users.
- Train and evaluate predictive models using:
  - Logistic Regression
  - Random Forest
  - XGBoost
- Compare models based on validation performance, with a focus on **recall** to capture as many churned users as possible.

## Technologies Used

**Python (Jupyter Notebooks)** – for interactive coding and documentation
**pandas** – for data cleaning, transformation, and analysis  
**numpy** – for numerical operations  
**seaborn & matplotlib** – for data visualization  
**scikit-learn** – for model building, training, and evaluation  
**xgboost** – for gradient boosting models  
**scipy** – for performing statistical hypothesis tests  



## Results

- Logistic Regression served as a strong baseline but was outperformed by tree-based models.
- Random Forests improved recall but slightly underfit on validation data.
- XGBoost achieved the best performance overall, showing strong balance across all metrics and minimal drop between training and validation scores.
- XGBoost model achieved an overall accuracy of around 81%.




## Notes

- No class rebalancing was applied since the dataset is not severely imbalanced.
- Evaluation focused on minimizing false negatives, prioritizing **recall** over other metrics.
- Business risk from false positives was minimal, so the model was optimized to identify as many real churners as possible.
