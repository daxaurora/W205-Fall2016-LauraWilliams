# MIDS W205 Exercise 2 - Laura Williams

# This file creates the tcount postgres database and the tweetwordcout table
# to record the word counts from the Twitter stream

# Imports
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

# Connect to default database
conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")
conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)

# Create a cursor
cur = conn.cursor()

# Create the database
cur.execute("DROP DATABASE IF EXISTS tcount;")
conn.commit()
cur.execute("CREATE DATABASE tcount;")
conn.commit()

# Close the connection to the default database
conn.close()

# Connect to the tcount database to create the Tweetwordcount table
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")


#Create a cursor
cur = conn.cursor()

# Create and save the table
cur.execute("DROP TABLE IF EXISTS tweetwordcount;")
cur.execute("CREATE TABLE tweetwordcount (word TEXT PRIMARY KEY NOT NULL, \
     count INT NOT NULL);")
conn.commit()

# Close the connection
conn.close()

