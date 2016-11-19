from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
       

    def process(self, tup):
        word = tup.values[0]

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

	# Create variable to hold each word and count
        (this_word, this_count) = word, self.counts[word]
	
        # Increment database with words and counts
        if this_count == 1:
            cur.execute("INSERT INTO tweetwordcount (word, count) \
                         VALUES (%s, %s)", (this_word, this_count))
            conn.commit()
        else:
             cur.execute("UPDATE Tweetwordcount SET count=%s WHERE word=%s", \
                         (this_count, this_word))
             conn.commit()

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))


