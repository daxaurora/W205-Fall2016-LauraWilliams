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

	# Add word counts to database
	if self.counts[word] == 1:
            cur.execute("INSERT INTO tweetwordcount (word,count) \
                VALUES (%s, 1)", (word,));
            conn.commit()
	else:
            cur.execute("UPDATE tweetwordcount SET count=%s WHERE word=%s", \
                (self.counts[word], word))
            conn.commit()

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))


