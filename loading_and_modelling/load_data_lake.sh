# MIDS W205 - Fall 2016 - Exercise 1
# Step 1:
# Load the raw data files into HDFS under “/user/w205/hospital_compare”
# Laura Williams

# Assumptions about how this script will be used:
# This script should be run on an UCB W205 Spring 2016 AWS AMI
# with an HDFS formatted EBS volume
# that has been set up with HDFS, Hadoop, Hive, and Postgres,
# where the user is w205.

# I used my old photography website to store the csv files online
# so this script could be repeatable on any AMI with the above assumptions.
# I don't know how to get a csv file via an API call, presumably that would
# have been the more common way to get this file directly from the source.

# Create subdirectories
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys


# Load raw csv files, rename, and remove header rows
wget "http://www.laurawilliamsphoto.com/w205/Hospital General Information.csv"
tail -n +2 /user/205/"Hospital General Information.csv" > /user/205/"hospitals.csv"

wget "http://www.laurawilliamsphoto.com/w205/Timely and Effective Care - Hospital.csv"
tail -n +2 /user/205/"Timely and Effective Care - Hospital.csv" > /user/205/"effective_care.csv"

wget "http://www.laurawilliamsphoto.com/w205/Readmissions and Deaths - Hospital.csv"
tail -n +2 /user/205/"Readmissions and Deaths - Hospital.csv" > /user/205/"readmissions.csv"

wget "http://www.laurawilliamsphoto.com/w205/Measure Dates.csv"
tail -n +2 /user/205/"Measure Dates.csv" > /user/205/"measures.csv"

wget "http://www.laurawilliamsphoto.com/w205/hvbp_hcahps_06_08_2016.csv"
tail -n +2 /user/205/"hvbp_hcahps_06_08_2016.csv" > /user/205/"surveys.csv"

# Move files to appropriate subdirectories
hdfs dfs -­‐put hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -­‐put effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -­‐put readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -­‐put measures.csv /user/w205/hospital_compare/measures
hdfs dfs -­‐put surveys.csv /user/w205/hospital_compare/surveys
