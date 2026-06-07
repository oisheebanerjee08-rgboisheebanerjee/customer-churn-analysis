CREATE DATABASE customer_churn;
USE customer_churn;
CREATE TABLE churn_data (
    gender VARCHAR(10),
    age INT,
    country VARCHAR(50),
    city VARCHAR(50),
    customer_segment VARCHAR(20),
    tenure_months INT,
    signup_channel VARCHAR(20),
    contract_type VARCHAR(20),
    monthly_logins INT,
    weekly_active_days INT,
    avg_session_time FLOAT,
    features_used INT,
    usage_growth_rate FLOAT,
    last_login_days_ago INT,
    monthly_fee FLOAT,
    total_revenue FLOAT,
    payment_method VARCHAR(20),
    payment_failures INT,
    discount_applied VARCHAR(5),
    price_increase_last_3m VARCHAR(5),
    support_tickets INT,
    avg_resolution_time FLOAT,
    complaint_type VARCHAR(20),
    csat_score FLOAT,
    escalations INT,
    email_open_rate FLOAT,
    marketing_click_rate FLOAT,
    nps_score FLOAT,
    survey_response VARCHAR(20),
    referral_count INT,
    churn INT
);
SELECT * FROM churn_data LIMIT 5;
SELECT 
    COUNT(*) as total_customers,
    SUM(churn) as churned,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 1) as churn_rate_percent
FROM churn_data;
SELECT 
    contract_type,
    COUNT(*) as total,
    SUM(churn) as churned,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 1) as churn_rate
FROM churn_data
GROUP BY contract_type
ORDER BY churn_rate DESC;
SELECT 
    payment_failures,
    COUNT(*) as total_customers,
    SUM(churn) as churned,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 1) as churn_rate
FROM churn_data
GROUP BY payment_failures
ORDER BY payment_failures;
SELECT 
    CASE 
        WHEN tenure_months < 12 THEN 'Under 12 months'
        WHEN tenure_months BETWEEN 12 AND 24 THEN '12-24 months'
        WHEN tenure_months BETWEEN 25 AND 36 THEN '25-36 months'
        ELSE 'Over 36 months'
    END as tenure_group,
    COUNT(*) as total,
    SUM(churn) as churned,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 1) as churn_rate
FROM churn_data
GROUP BY tenure_group
ORDER BY churn_rate DESC;
USE customer_churn;
SELECT 
    CASE 
        WHEN tenure_months < 12 THEN 'Under 12 months'
        WHEN tenure_months BETWEEN 12 AND 24 THEN '12-24 months'
        WHEN tenure_months BETWEEN 25 AND 36 THEN '25-36 months'
        ELSE 'Over 36 months'
    END as tenure_group,
    COUNT(*) as total,
    SUM(churn) as churned,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 1) as churn_rate
FROM churn_data
GROUP BY tenure_group
ORDER BY churn_rate DESC;
SELECT 
    customer_segment,
    contract_type,
    COUNT(*) as total,
    ROUND(AVG(csat_score), 2) as avg_csat,
    ROUND(AVG(payment_failures), 2) as avg_payment_failures,
    ROUND(AVG(tenure_months), 1) as avg_tenure,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 1) as churn_rate
FROM churn_data
GROUP BY customer_segment, contract_type
ORDER BY churn_rate DESC
LIMIT 10;