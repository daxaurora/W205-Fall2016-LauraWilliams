# MDIS W205, Fall 2016
# Exercise 2
# Laura Williams

# This script can be run from any directory.

# Switch to the directory with all the project files
cd /home/w205/extweetwordcount

# Run this file to create the postgres database and table
python create_database.py

# Run the application with a 120 second limit
sparse run -t 120

# Print a list of all words in the stream and the word counts
python finalresults.py

 
