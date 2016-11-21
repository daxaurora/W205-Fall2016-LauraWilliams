-- MIDS W205 - Fall 2016 - Exercise 1
-- Data Investigation:
-- Create queries to answer Exercise 1 questions
-- Laura Williams

-- Question: What states are models of high-quality care?

-- Using the Hospital General Information data,
-- average the overall ratings for each hospital per state.

-- Issue: 3 Oklahoma listings had no rating, but were not NULL
-- I tried to clean the data by removing NULL values, but this didn't
-- eliminate this odd data from Oklahoma.
-- I solved this issue by returning 11 results, and ignoring Oklahoma.


SELECT state, AVG(rating) AS StateRating
FROM hospitals
GROUP BY state
ORDER BY StateRating DESC
LIMIT 11;
-- END OF FILE
