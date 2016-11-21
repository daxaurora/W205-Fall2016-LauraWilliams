MIDS W205, Fall 2016, Laura Williams
Exercise 2

This file lists technical steps necessary to run the Twitter stream application created in Exercise 2.


1) Launch an AWS EC2 instance of this AMI: UCB MIDS W205 EX2-FULL AMI
   Instance size: m3.large
   Security group: I used the Hadoop Cluster security group used with other labs.

2) Attach to the AMI an EBS volume on which postgres has been installed. 
   If an EBS with postgres does not already exist, create one.

3) Connect to the AMI from the command line of a local machine.

4) Mount the EBS volume: 
   First find the location of the attached volume:
   fdisk -l

   Then mount the volume:
   mount -t ext4 /dev/<myebs> /data  
   [where <myebs> = the EBS location listed in the output from the fdisk command]

5) Install additional packages to the AMI as the root user:
   pip install psycopg2
   pip install tweepy

6) Start postgres as the root user:
   /data/start_postgres.sh

7) switch to the w205 user:
   su - w205

8) Download files from my Exercise 2 repo directly to /home/w205
   I will assume that you know how to clone the repo to this location. 

9) Assumption: this repo will be downloaded before the Exercise2 branch has been merged with the master.  If the Exercise2 branch has instead already been merged into the master, skip this step:

Switch to the branch in the git repo that contains the application files:

cd W205-Fall2016-LauraWilliams
git checkout Exercise2

10) From any directory, copy the files outside the repo.  This allows the project to be run outside the repo, and also sets the files up for use with the run_app.sh script (below).

cp -r /home/w205/W205-Fall2016-LauraWilliams/extweetwordcount /home/w205/


11) From any directory, run this shell script to run the application: 

/home/w205/extweetwordcount/run_app.sh

This script will run for several minutes and will stop automatically.
The script will finish by printing a list of all words and word counts in the Twitter stream.

12) To run python scripts individually, switch to the project directory:

cd /home/w205/extweetwordcount

12A) Running the finalresults.py file:

To print the total list of words and word counts in the database, in alphabetical order (this script also runs at the end of the run_app.sh script above):
python finalresults.py

To see the total number of occurrences of a specific word:
python finalresults.py [word]


12B) Running the histogram.py file:

To see the total number of words and their word counts that exist between, and including, two integers, in order of smallest to largest word counts:
python histogram.py [integer1] [integer2]

Note regarding the finalresults.py and histogram.py scripts:
The code in these scripts is not meant to handle special characters that have different meanings on on the command line, for example parentheses and ampersand characters.  The finalresults.py script will ignore any characters entered after the script name and the initial search word, and the histogram.py file will ignore any characters entered after the script name and the two initial integers.
	


Clean up:
Before shutting down the instance, stop postgres:
/data/stop_postgres.sh





