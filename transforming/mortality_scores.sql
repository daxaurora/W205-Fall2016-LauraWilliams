-- MIDS W205 - Fall 2016 - Exercise 1
-- Data Transformation:
-- Create SQL tables to match ER Diagram
-- Laura Williams

-- Create Mortality Scores table
-- Remove Not Available Scores


DROP TABLE mortality_scores;
CREATE TABLE mortality_scores
AS
SELECT
hospital_id,
measure_id,
cast(score as float) AS score
FROM readmissions_ingest
WHERE score <> 'Not Available'
;
--END OF FILE
