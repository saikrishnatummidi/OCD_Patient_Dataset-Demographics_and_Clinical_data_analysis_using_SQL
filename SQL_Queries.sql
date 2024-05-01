 -- 1. Count & percentage count of Female vs Male that have OCD & -- Average Obsession Score by Gender
SELECT
    Gender,
    COUNT(`Patient ID`) AS patient_count,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obs_score,
    ROUND(COUNT(`Patient ID`) * 100.0 / (SELECT COUNT(*) FROM ocd_patient_dataset), 2) AS percentage_count
FROM 
    ocd_patient_dataset
GROUP BY 
    Gender
ORDER BY 
    patient_count DESC;



-- 2. Count of Patients by Ethnicity and their respective Average Obsession Score
SELECT 
	Ethnicity,
	count(`Patient ID`) as patient_count,
	AVG(`Y-BOCS Score (Obsessions)`) as obs_score
From 
	ocd_patient_dataset
GROUP BY
	Ethnicity
ORDER  BY 
	patient_count;




-- 3. Number of people diagnosed with OCD Month over Month(MOM)
ALTER TABLE ocd_patient.ocd_patient_dataset
MODIFY `OCD Diagnosis Date` date;

SELECT
date_format(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') as month,
count(`Patient ID`) as patient_count
FROM 
	ocd_patient_dataset
GROUP BY 1
ORDER BY 1
;


-- 4. What is the most common Obsession Type (Count) & it's respective Average Obsession Score

SELECT
`Obsession Type`,
count(`Patient ID`) as patient_count,
round(AVG(`Y-BOCS Score (Obsessions)`),2) as obs_score
FROM ocd_patient_dataset
GROUP BY 1
ORDER BY 2
;


-- 5. What is the most common Compulsion type (Count) & it's respective Average Obsession Score

SELECT 
`Compulsion Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score
FROM ocd_patient_dataset
GROUP BY 1
ORDER BY 2
;
