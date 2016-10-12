-- First select out the hospitals with a 5 star rating
--Then add up the number of Aboves
--At some point read the justification for where these ratings
--come from to justify it in my text

SELECT hospital_name, state
FROM hospitals
WHERE rating = 5
AND mortality != 'Below the National average'
AND safety != 'Below the National average'
AND readmission != 'Below the National average'
AND experience != 'Below the National average'
AND effectiveness != 'Below the National average'
AND timeliness != 'Below the National average'
AND imaging != 'Below the National average';
--This query returns 84 hospitals.  That's a good group to start with.
--Join with something else to further refine

ORDER BY something DESC



--DO I WANT TO BE FANCY AND INCLUDE PRINTING TEXT?
--I think I don't know how to do that.
