-- MIDS W205 - Fall 2016 - Exercise 1
-- Data Investigation:
-- Create queries to answer Exercise 1 questions
-- Laura Williams

-- Question: Which procedures have the greatest variability between hospitals?

-- Using scores from Timely and Effective Care and Readmissions and Deaths
-- calculate the range of scores of each procedure as a measure of variability,
-- then rank each procedure in order of the largest ranges.

DROP TABLE measures_combined;
CREATE TABLE measures_combined
AS
SELECT measure_id, score from mortality_scores
UNION ALL
SELECT measure_id, score from effective_scores
;

DROP TABLE hosp_variability;
CREATE TABLE hosp_variability
AS
SELECT
measures.measure_name,
measures_combined.measure_id,
measures_combined.score
FROM measures_combined
INNER JOIN measures
ON measures_combined.measure_id = measures.measure_id
;

SELECT
measure_name, MAX(score) - MIN(score) AS ScoreRange
FROM hosp_variability
GROUP BY measure_name
ORDER BY ScoreRange DESC
LIMIT 10
;

-- END OF FILE
