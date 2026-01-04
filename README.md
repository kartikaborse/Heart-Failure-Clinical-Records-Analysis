# Heart-Failure-Clinical-Records-Analysis

📌 Project Overview

This project focuses on exploratory data analysis and clinical analytics of heart failure patient data to understand mortality risk patterns, key clinical indicators, and survival trends.

The objective was not machine learning, but to perform end-to-end analytics using Python, SQL, and Power BI, and convert raw medical data into actionable insights through visual storytelling.

🎯 Objectives

Identify clinical features that strongly influence mortality

Analyze demographic and comorbidity-based risk

Study survival duration and early mortality patterns

Build an interactive Power BI dashboard for insight delivery

🗂 Dataset Information

Records: 299 patients

Target Variable: DEATH_EVENT (0 = Survived, 1 = Died)

Features Include:

Age

Ejection Fraction

Serum Creatinine

Serum Sodium

Diabetes

High Blood Pressure

Smoking

Survival Time

Other clinical measurements

🛠 Tools & Technologies

Python: Pandas, NumPy, Matplotlib (EDA & correlation analysis)

SQL (MySQL): Analytical queries & business questions

Power BI: Dashboard creation & data storytelling

🔄 Project Workflow
1️⃣ Data Cleaning & EDA (Python)

Fixed data types

Created meaningful age groups

Removed redundant / incorrect columns

Performed correlation analysis with mortality

Exported clean datasets for BI tools

2️⃣ Analytical Questioning (SQL)

Answered interview-level questions such as:

Which clinical features most influence death events?

Does low ejection fraction outweigh age as a risk factor?

How do comorbidities compound mortality risk?

What factors are linked to early death?

3️⃣ Visualization & Storytelling (Power BI)
Dashboard Sections:

Dataset Overview (KPIs)

Total Patients

Death Events

Survival Rate

Average Age

Demographic Insights

Mortality by age group

Gender-based survival comparison

Clinical Feature Influence

Correlation-based bar chart showing top mortality drivers

Comorbidity Risk Analysis

Impact of diabetes and hypertension combinations

Survival Duration Analysis

Distribution of survival time

High-Risk Patient Identification

Flagging patients with critical clinical markers

Mortality Trend Over Time

Line chart using time buckets to show early vs late mortality

📊 Key Insights

Survival time has the strongest relationship with mortality

Low ejection fraction and high serum creatinine are major risk indicators

Most deaths occur within the first 50 days

Combined comorbidities significantly increase mortality risk

A small group of high-risk patients accounts for a large portion of deaths

✅ Project Scope

✔ Analytics-focused project

✔ No machine learning models

✔ Interview-ready insights

✔ Strong emphasis on reasoning & interpretation

📁 Repository Structure
├── data/
│   ├── cleaned_heart_failure.csv
│   └── feature_influence.csv
├── notebooks/
│   └── heart_failure_analysis.ipynb
├── sql/
│   └── analysis_queries.sql
├── powerbi/
│   └── heart_failure_dashboard.pbix
└── README.md

📌 Conclusion

This project demonstrates how data analytics can be applied to healthcare datasets to extract meaningful, decision-oriented insights, combining technical skills with analytical thinking and visualization best practices.
