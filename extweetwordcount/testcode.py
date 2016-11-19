# already in wordcount.py
import psycopg2
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

# trying this code as a sample
(this_word, this_count) = ('test', 1)

# in wordcount.py, that line would be: 
# (this_word, this_count) = word, self.counts[word]
# or do we use the log instead?
# or comment out the log after adding this? 

if this_count == 1:
    cur.execute("INSERT INTO tweetwordcount (word, count) \
            VALUES (%s, %s)", (this_word, this_count)) 
    conn.commit()

# then check to see what is in the database
# or maybe this should happen outside thie file?
#cur.execute("SELECT word, count from tweetwordcount")
#cur.fetchall()

# close connection in this file
# I'm not sure where/when to close the connection in the big archiecture
conn.close()


