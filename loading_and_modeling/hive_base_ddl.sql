-- MIDS W205 - Fall 2016 - Exercise 1
-- Data Ingest:
-- Load external tables into hive from hdfs CSV files
-- Laura Williams


-- Hospital General Information
-- DROP TABLE is important for starting each table creation from scratch
DROP TABLE hospitals_ingest;
CREATE EXTERNAL TABLE hospitals_ingest (
    hospital_id string,
    hospital_name string
    address string,
    city string,
    state string,
    zip string,
    county string,
    phone string,
    hospital_type string,
    ownership string,
    er_services string,
    ehr string,
    rating string,
    rating_footnote string,
    mortality string,
    mortality_footnote string,
    safety string,
    safety_footnote string,
    readmission string,
    readmission_footnote string,
    experience string,
    experience_footnote string,
    effectiveness string,
    effectiveness_footnote string,
    timeliness string,
    timeliness_footnote string,
    imaging string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals'
;


-- Measure Dates
DROP TABLE measures_ingest;
CREATE EXTERNAL TABLE measures_ingest (
    measure_name string,
    measure_id string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures'
;


-- HCAHPS Surveys
DROP TABLE surveys_ingest;
CREATE EXTERNAL TABLE surveys_ingest (
    hospital_id string,
    hospital_name string,
    address string,
    city string,
    state string,
    zip string,
    county string,
    score_nurses_achievement string,
    score_nurses_improvement string,
    score_nurses_dimension string,
    score_doctors_achievement string,
    score_doctors_improvement string,
    score_doctors_dimension string,
    score_staff_achievement string,
    score_staff_improvement string,
    score_staff_dimension string,
    score_painmgt_achievement string,
    score_painmgt_improvement string,
    score_painmgt_dimension string,
    score_medicines_achievement string,
    score_medicines_improvement string,
    score_medicines_dimension string,
    score_environment_achievement string,
    score_environment_improvement string,
    score_environment_dimension string,
    score_discharge_achievement string,
    score_discharge_improvement string,
    score_discharge_dimension string,
    score_overall_achievement string,
    score_overall_improvement string,
    score_overall_dimension string,
    score_overall_base string,
    score_overall_consistency string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys'
;


-- Timely and Effective Care by Hospital
DROP TABLE effective_care_ingest;
CREATE EXTERNAL TABLE effective_care_ingest (
    hospital_id string,
    hospital_name string,
    address string,
    city string,
    state string,
    zip string,
    county string,
    phone string,
    condition string,
    measure_id string,
    measure_name string,
    denominator string,
    score string,
    lower_estimate string,
    upper_estimate string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care'
;


-- Readmissions and Deaths by Hospital
DROP TABLE readmissions_ingest;
CREATE EXTERNAL TABLE readmissions_ingest (
    hospital_id string,
    hospital_name string,
    address string,
    city string,
    state string,
    zip string,
    county string,
    phone string,
    measure_name string,
    measure_id string,
    compared_to_national string,
    denominator string,
    score string,
    lower_estimate string,
    upper_estimate string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions'
;
-- END OF FILE
