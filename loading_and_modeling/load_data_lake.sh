# MIDS W205 - Fall 2016 - Exercise 1
# Data Ingest:
# Load the raw data files into HDFS directory “/user/w205/hospital_compare”
# Laura Williams

# Assumptions about how this script will be used:
# This script should be run on an UCB W205 Spring 2016 AWS AMI
# with a mounted HDFS formatted EBS volume
# that has been set up with HDFS, Hadoop, Hive, and Postgres,
# where Hadoop, Postgres and Hive Metastore have already been started,
# and where the user is w205.

# I used my old photography website to store the csv files online
# so this script could be repeatable on any AMI with the above assumptions.
# I don't know how to get a csv file via an API call, presumably that would
# have been the more common way to get this file directly from the source.

# Create hdfs subdirectories
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys


# Load raw csv files
wget "http://www.laurawilliamsphoto.com/w205/Hospital General \
Information.csv"
wget "http://www.laurawilliamsphoto.com/w205/Timely and Effective Care \
- Hospital.csv"
wget "http://www.laurawilliamsphoto.com/w205/Readmissions and Deaths \
- Hospital.csv"
wget "http://www.laurawilliamsphoto.com/w205/Measure Dates.csv"
wget "http://www.laurawilliamsphoto.com/w205/hvbp_hcahps_06_08_2016.csv"


# Rename csv files and remove header rows
tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n +2 "Measure Dates.csv" > measures.csv
tail -n +2 "hvbp_hcahps_06_08_2016.csv" > surveys.csv


# Move files to hdfs
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put measures.csv /user/w205/hospital_compare/measures
hdfs dfs -put surveys.csv /user/w205/hospital_compare/surveys

# END OF FILE
