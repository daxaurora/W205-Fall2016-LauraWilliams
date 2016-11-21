# MIDS W205 Exercise 2 - Laura Williams

# This script gets a word as an argument and returns the total number of word
# occurrences in the stream.

# Running this script without an argument returns all the words in the 
# stream and their total count of occurrences, sorted alphabetically in an 
# ascending order, one word per line.

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
if len(sys.argv) == 1:
    sorted_word_list = sorted(records)
    for rec in sorted_word_list:
        print "word = " + str(rec[0]) +  "; count = " + str(rec[1])
else:
    word = sys.argv[1]
    final_output = 'The word "' + word + '" was not found in this stream.'
    for rec in records:
        if rec[0] == word:
            final_output = 'Total number of occurances of the word "' + \
                            word + '": ' + str(rec[1])
            break
    print final_output


conn.close()
