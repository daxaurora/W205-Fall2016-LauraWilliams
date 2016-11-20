-- MIDS W205 - Fall 2016 - Exercise 1
-- Data Transformation:
-- Create SQL tables to match ER Diagram
-- Laura Williams

-- Create Measures table

DROP TABLE measures;
CREATE TABLE measures
AS
SELECT
measure_name,
measure_id
FROM measures_ingest
;
--END OF FILE
