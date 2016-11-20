-- MIDS W205 - Fall 2016 - Exercise 1
-- Data Transformation:
-- Create SQL tables to match ER Diagram
-- Laura Williams

-- Create Hospitals table:
-- Include all rows from hospitals_ingest file
-- Include Patient Survey overall scores where they can be matched
--    with hospital IDs

DROP TABLE hospitals;
CREATE TABLE hospitals
AS
SELECT hospitals_ingest.hospital_id,
hospitals_ingest.hospital_name,
hospitals_ingest.city,
hospitals_ingest.state,
cast(hospitals_ingest.rating as int) AS rating,
hospitals_ingest.mortality,
hospitals_ingest.safety,
hospitals_ingest.readmission,
hospitals_ingest.experience,
hospitals_ingest.effectiveness,
hospitals_ingest.timeliness,
hospitals_ingest.imaging,
cast(surveys_ingest.score_overall_base as int) AS base_score,
cast(surveys_ingest.score_overall_consistency as int) AS consistency_score
FROM hospitals_ingest
LEFT JOIN surveys_ingest
ON surveys_ingest.hospital_id = hospitals_ingest.hospital_id
;
-- END OF FILE
