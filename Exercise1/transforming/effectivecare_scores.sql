-- MIDS W205 - Fall 2016 - Exercise 1
-- Data Transformation:
-- Create SQL tables to match ER Diagram
-- Laura Williams

-- Create Effective Care Scores table
-- Remove Measure: Emergency Department Volume
-- Remove Not Available Scores


DROP TABLE effective_scores;
CREATE TABLE effective_scores
AS
SELECT
hospital_id,
measure_id,
cast(score as float) AS score
FROM effective_care_ingest
WHERE measure_id <> 'EDV'
AND score <> 'Not Available'
;
--END OF FILE
