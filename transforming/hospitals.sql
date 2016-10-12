-- ADD COMMENTS
DROP TABLE hospitals;
CREATE TABLE hospitals
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
)
AS
SELECT hospital_id, hospital_name, city, state, rating, mortality, safety,
readmission, experience, effectiveness, timeliness, imaging
FROM hospitals_ingest;


--do I need stored as and location? OR MAYBE NOT?

-- Remove this once I get the script right
SELECT * FROM hospitals LIMIT 3;
