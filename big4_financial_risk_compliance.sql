
--Create big4_financial_risk_compliance table
CREATE TABLE big4_financial_risk_compliance (
    Year INT,
    Firm_Name VARCHAR(50),
    Total_Audit_Engagements INT,
    High_Risk_Cases INT,
    Compliance_Violations INT,
    Fraud_Cases_Detected INT,
    Industry_Affected VARCHAR(50),
    Total_Revenue_Impact DECIMAL(10, 2),
    AI_Used_for_Auditing VARCHAR(5), 
    Employee_Workload INT,
    Audit_Effectiveness_Score DECIMAL(3,1),
    Client_Satisfaction_Score DECIMAL(3,1)
);


--Audit Engagements Over Time
SELECT Year, Firm_Name, SUM(Total_Audit_Engagements) AS Total_Audit_Engagements
FROM big4_financial_risk_compliance
GROUP BY Year, Firm_Name
ORDER BY Year, Firm_Name;

--Industry vs. Fraud Cases
SELECT Firm_Name, Industry_Affected, SUM(Fraud_Cases_Detected) AS Total_Fraud_Cases
FROM big4_financial_risk_compliance
GROUP BY Firm_Name, Industry_Affected
ORDER BY Firm_Name, Industry_Affected;

--Audit Engagements vs. Risk Cases
SELECT Year, Firm_Name, 
       SUM(Total_Audit_Engagements) AS Total_Audit_Engagements,
       SUM(High_Risk_Cases) AS Total_Risk_Cases
FROM big4_financial_risk_compliance
GROUP BY Year, Firm_Name
ORDER BY Year, Firm_Name;

--AI Adoption vs. Audit Effectiveness
SELECT Firm_Name, AI_Use_for_Auditing
       SUM(Audit_Effectiveness_Score) AS Total_Audit_Effectiveness_Score
FROM big4_financial_risk_compliance
GROUP BY AI_Used_for_Auditing, Firm_Name
ORDER BY AI_Used_for_Auditing,Firm_Name;

--Client Satisfaction by Firm
SELECT Firm_Name, AI_Used_for_Auditing
       SUM(Client_Satisfaction_Score) AS TotalL_Client_Satisfaction_Score
FROM big4_financial_risk_compliance
GROUP BY Firm_Name, AI_Used_for_Auditing
ORDER BY Firm_Name, AI_Used_for_Auditing;

--Industry Risk
SELECT Firm_Name, Industry_Affected,
       SUM(Fraud_Cases_Detected) AS Total_Fraud_Cases
FROM big4_financial_risk_compliance
GROUP BY Year, Firm_Name, Industry_Affected
ORDER BY Year, Firm_Name, Industry_Affected;