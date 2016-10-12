-- MIDS W205 - Fall 2016 - Exercise 1
-- Data Ingest:
-- Load external tables into hive from the hdfs CSV files
-- Laura Williams

-- Assumptions about thos this file will be used:
-- Run this file in the same environment and at the same location
-- as the load_data_lake.sh using:
-- hive –f /path/to/hive_base_ddl.sql

-- DROP TABLE is important to start each table creationg from scratch
DROP TABLE hospitals_ingest;

-- Create tables from CSV files

-- Hospital General Information
CREATE EXTERNAL TABLE hospitals_ingest
    (hospital_id int,
    hospital_name varchar(255),
    address varchar(255),
    city varchar(255),
    state varchar(2),
    zip int,
    county varchar(255),
    phone varchar(255),
    type varchar(255),
    ownership varchar(255),
    es varchar(255),
    ehr varchar(255),
    rating int,
    rating_footnote varchar(255),
    mortality varchar(255),
    mortality_footnote varchar(255),
    safety varchar(255),
    safety_footnote varchar(255),
    readmission varchar(255),
    readmission_footnote varchar(255),
    experience varchar(255),
    experience_footnote varchar(255),
    effectiveness varchar(255),
    effectiveness_footnote varchar(255),
    timeliness varchar(255),
    timeliness_footnote varchar(255),
    imaging varchar(255)
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

--code I used for testing this script at command line
--show tables;

--SELECT * FROM hospitals_ingest LIMIT 3;
