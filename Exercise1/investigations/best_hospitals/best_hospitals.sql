-- MIDS W205 - Fall 2016 - Exercise 1
-- Data Investigation:
-- Create queries to answer Exercise 1 questions
-- Laura Williams


-- Question: What hospitals are models of high-quality care?

-- First create a table narrowing down the best hospitals based on
-- overall star ratings and 7 aggregate measures in the
-- Hospital General Information file.
DROP TABLE best_hospitals;
CREATE TABLE best_hospitals
AS
SELECT hospital_id, hospital_name, city, state
FROM hospitals
WHERE rating = 5
AND mortality <> 'Below the National average'
AND safety <> 'Below the National average'
AND readmission <> 'Below the National average'
AND experience <> 'Below the National average'
AND effectiveness <> 'Below the National average'
AND timeliness <> 'Below the National average'
AND imaging <>'Below the National average'
;

-- Next create a table that ranks hospitals by the sum of all measures listed
-- in the Readmissions and Deaths file.
DROP TABLE mortality_by_hospital;
CREATE TABLE mortality_by_hospital
AS
SELECT hospital_id, SUM(score) AS MortalityScore
FROM mortality_scores
GROUP BY hospital_id
ORDER BY MortalityScore ASC
;

-- Finally, apply the ranks from Readmissions and Deaths file to the subset
-- of hospitals filtered from the Hospital General Information file.
SELECT
best_hospitals.hospital_name,
best_hospitals.city,
best_hospitals.state,
mortality_by_hospital.MortalityScore
FROM best_hospitals
LEFT JOIN mortality_by_hospital
ON best_hospitals.hospital_id = mortality_by_hospital.hospital_id
ORDER BY MortalityScore ASC
LIMIT 10;

-- END OF FILE
