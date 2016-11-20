-- MIDS W205 - Fall 2016 - Exercise 1
-- Data Investigation:
-- Create queries to answer Exercise 1 questions
-- Laura Williams

-- Question: Are average scores for hospital quality or procedural variability
--  correlated with patient survey responses?

-- Using the HVBP HCAHPS survey responses, I added together the Overall Base
-- score with the Overall Consistency score to arrive at an overall
-- patient experience score for each hospital, and then I ranked all
-- hospitals based on this overall score.

SELECT
hospital_name,
city,
state,
base_score + consistency_score AS TotalScore
FROM hospitals
ORDER BY TotalScore DESC
LIMIT 25;
-- END OF FILE
