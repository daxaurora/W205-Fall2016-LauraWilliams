# MDIS W205, Fall 2016
# Exercise 2
# Laura Williams

# Assumptions of this script: 
# That the setup_app.sh script has been run successfully.

# Switch to the directory with all the project files
cd extweetwordcount

# Run this file to create the postgres database and table
python create_database.py

# Run the application with a 120 second limit
sparse run -t 120


 
