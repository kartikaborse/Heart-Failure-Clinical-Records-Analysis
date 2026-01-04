#1. Which clinical features most strongly influence death events?
SELECT 
    DEATH_EVENT,
    ROUND(AVG(age),1) AS avg_age,
    ROUND(AVG(ejection_fraction),1) AS avg_ejection_fraction,
    ROUND(AVG(serum_creatinine),2) AS avg_serum_creatinine,
    ROUND(AVG(serum_sodium),1) AS avg_serum_sodium,
    ROUND(AVG(creatinine_phosphokinase),1) AS avg_CPK,
    ROUND(AVG(platelets),1) AS avg_platelets
FROM heart_failure_cleaned
GROUP BY DEATH_EVENT;

#2. Is low ejection fraction a stronger predictor than age?
SELECT 
    DEATH_EVENT,
    ROUND(AVG(age),1) AS avg_age,
    ROUND(AVG(ejection_fraction),1) AS avg_ejection_fraction
FROM heart_failure_cleaned
GROUP BY DEATH_EVENT;

#3.Lab values showing sharp risk escalation beyond a threshold
SELECT 
    SUM(CASE WHEN serum_creatinine > 1.5 THEN 1 ELSE 0 END) AS high_creatinine_count,
    SUM(CASE WHEN ejection_fraction < 35 THEN 1 ELSE 0 END) AS low_ef_count,
    SUM(CASE WHEN serum_creatinine > 1.5 AND DEATH_EVENT=1 THEN 1 ELSE 0 END) AS high_creatinine_deaths,
    SUM(CASE WHEN ejection_fraction < 35 AND DEATH_EVENT=1 THEN 1 ELSE 0 END) AS low_ef_deaths
FROM heart_failure_cleaned;

#4. Does age alone predict mortality?
SELECT 
    age_group,
    COUNT(*) AS total_patients,
    SUM(DEATH_EVENT) AS deaths,
    ROUND(SUM(DEATH_EVENT)*100/COUNT(*),2) AS death_rate_percent
FROM heart_failure_cleaned
GROUP BY age_group
ORDER BY age_group_int;

#5.Gender difference in survival duration
SELECT 
    sex,
    ROUND(AVG(time),1) AS avg_survival_time,
    COUNT(*) AS total_patients,
    SUM(DEATH_EVENT) AS deaths
FROM heart_failure_cleaned
GROUP BY sex;

#6.Smoking effect controlled for age
SELECT 
    age_group,
    smoking,
    COUNT(*) AS total_patients,
    SUM(DEATH_EVENT) AS deaths,
    ROUND(SUM(DEATH_EVENT)*100/COUNT(*),2) AS death_rate_percent
FROM heart_failure_cleaned
GROUP BY age_group, smoking
ORDER BY age_group_int, smoking;

#7.Do diabetes and hypertension compound risk?
SELECT 
    diabetes,
    high_blood_pressure,
    COUNT(*) AS total_patients,
    SUM(DEATH_EVENT) AS deaths,
    ROUND(SUM(DEATH_EVENT)*100/COUNT(*),2) AS death_rate_percent
FROM heart_failure_cleaned
GROUP BY diabetes, high_blood_pressure
ORDER BY diabetes DESC, high_blood_pressure DESC;

#8.Factors associated with early death (<50 days)
SELECT 
    COUNT(*) AS early_deaths,
    ROUND(AVG(age),1) AS avg_age,
    ROUND(AVG(ejection_fraction),1) AS avg_ejection_fraction,
    ROUND(AVG(serum_creatinine),2) AS avg_serum_creatinine,
    ROUND(AVG(serum_sodium),1) AS avg_serum_sodium,
    ROUND(AVG(creatinine_phosphokinase),1) AS avg_CPK,
    ROUND(AVG(platelets),1) AS avg_platelets
FROM heart_failure_cleaned
WHERE DEATH_EVENT=1 AND time < 50;

#9.Patients who survive long despite severe markers
SELECT *
FROM heart_failure_cleaned
WHERE ejection_fraction < 35 AND serum_creatinine > 1.5 AND DEATH_EVENT = 0
ORDER BY time DESC;



/*
-- Heart Failure: Numeric Feature Ranges & High-Risk Flags   

       -- Ejection Fraction
       CASE 
           WHEN ejection_fraction < 35 THEN 'High Risk'
           WHEN ejection_fraction BETWEEN 35 AND 50 THEN 'Low'
           ELSE 'Normal'
       END AS ejection_fraction_flag,

       -- Serum Creatinine
       CASE 
           WHEN serum_creatinine < 0.6 THEN 'Low'
           WHEN serum_creatinine BETWEEN 0.6 AND 1.3 THEN 'Normal'
           ELSE 'High Risk'
       END AS serum_creatinine_flag,

       -- Serum Sodium
       CASE 
           WHEN serum_sodium < 135 THEN 'High Risk'
           WHEN serum_sodium BETWEEN 135 AND 145 THEN 'Normal'
           ELSE 'High'
       END AS serum_sodium_flag,

       -- Creatinine Phosphokinase (CPK)
       CASE
           WHEN creatinine_phosphokinase < 20 THEN 'Low'
           WHEN creatinine_phosphokinase BETWEEN 20 AND 200 THEN 'Normal'
           ELSE 'High'
       END AS cpk_flag,

       -- Platelets
       CASE
           WHEN platelets < 150000 THEN 'Low'
           WHEN platelets BETWEEN 150000 AND 450000 THEN 'Normal'
           ELSE 'High'
       END AS platelets_flag,

       -- Binary / Categorical Flags
       CASE WHEN anaemia = 1 THEN 'High Risk' ELSE 'Normal' END AS anaemia_flag,
       CASE WHEN diabetes = 1 THEN 'High Risk' ELSE 'Normal' END AS diabetes_flag,
       CASE WHEN high_blood_pressure = 1 THEN 'High Risk' ELSE 'Normal' END AS hbp_flag,
       CASE WHEN smoking = 1 THEN 'High Risk' ELSE 'Normal' END AS smoking_flag,

       -- Sex (0 = Female, 1 = Male)

FROM heart_failure_cleaned

*/





