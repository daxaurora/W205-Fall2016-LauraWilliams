import psycopg2
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()


(this_word, this_count) = ('test', 2)

if this_count == 1:
    cur.execute("INSERT INTO tweetwordcount (word, count) VALUES (%s, %s)", (this_word, this_count))
    conn.commit()
else:
    cur.execute("UPDATE Tweetwordcount SET count=%s WHERE word=%s", (this_count, this_word))
    conn.commit()

cur.execute("SELECT word, count from tweetwordcount")
cur.fetchall()

conn.close()
