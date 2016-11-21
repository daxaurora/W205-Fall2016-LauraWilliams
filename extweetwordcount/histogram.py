# MIDS W205 Exercise 2 - Laura Williams

# This script takes two integers and returns all the words with their 
# total number of occurrences in the stream that are more than or equal to 
# the first integer and and less than or equal to the second integer.

# Import statements
import sys
import psycopg2

# Connect to the database and set up the cursor
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", \
                        host="localhost", port="5432")
cur = conn.cursor()

# put tweet stream word count data into a list
cur.execute("SELECT word, count from tweetwordcount")
records = cur.fetchall()



# Determine if an argument was passed to this script and create output
if len(sys.argv) == 1 or len(sys.argv) == 2:
    print "Please enter two integers with a space between them."
else:
    lower = int(sys.argv[1])
    upper = int(sys.argv[2])
    word_list = []
    for rec in records:
        if rec[1] >= lower and rec[1]  <= upper:
            word_list.append(rec)
    if len(word_list) == 0:
        print "There are no words with a count greater than or equal to " + \
               str(lower) + "\n  and less than or equal to " + str(upper) + \
               "\nPlease try again."
    else:
        word_list_sorted = sorted(word_list, key=lambda rec: rec[1])
        print "The following words have a word count greater than or equal" + \
               " to " + str(lower) + "\n  and less than or equal to " + \
               str(upper) + "." 
        for i in word_list_sorted:
             print "word = " + str(i[0]) +  "; count = " + str(i[1]) 

conn.close()
