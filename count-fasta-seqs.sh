#!/bin/sh
# Change 1, test
# How this script should behave:
#
# INPUT:   Paths to one or more fasta sequence files
#
# OUTPUT:  For each file, it should write a line with the number of sequences
#          in the file, a space, and then the file NAME (NOT the path!), and a
#          final line with the total number of sequences across all files.
#
# EXAMPLE: In the same directory as this script, you should find an example
#          fasta file named 'example-seqs1.fasta', which contains:
#
#          >RMB3263_Cyrtodactylus_philippinicus_Negros
#          CGGGCCCATACCCCGAAAATGTTGGTATAAACCCCTTCCTATACTAATAAACCCCATTATTTGATCACTATTACTAAC
#          
#          >CWL052_Cyrtodactylus_philippinicus_Negros
#          CGGGCCCATACCCCGAAAATGTTGGTATAAACCCCTTCCTATACTAATAAACCCCATTATTTGATCACTATTACTAAC
#
#          If you run this script on this fasta file, you want to get the
#          following output:          
#
#          $ sh count-fasta-seqs.sh example-seqs1.fasta
#          2 example-seqs1.fasta
#          2
#
#          There should be another example fasta file named
#          'example-seqs2.fasta', which contains:
#
#          >RMB7155_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#          
#          >RMB7156_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#          
#          >RMB7163_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#
#          If you run this script on BOTH fasta files, you want to get the
#          following output:          
#
#          $ sh count-fasta-seqs.sh example-seqs1.fasta example-seqs2.fasta
#          2 example-seqs1.fasta
#          3 example-seqs2.fasta
#          5
#
#
# Your goal is to work collaboratively with ~ 3 other people to edit this
# script until it passes all the tests that have been written for it. I.e., you
# should be able to run:
#
#   $ sh run_tests.sh
#
# and see 'All tests passed!' at the bottom of the output.
#
# To do this, one member of your group should fork this repository, and add the
# other members as collaborators, so that all members of the team can be
# pulling and pushing changes to the script to the collaborative remote
# repository on Github.
#
# HINTS
# The first thing you need to be able to do is access the paths to the fasta
# files that were 'given to' this script. The variable "$@" will be very useful
# for this. Let's take a look at what it gives us:

#echo "$@"


# How are you going to work with each file path?
# HINT: for loop (remember "for do done"?)
#
# To get the name of each file from the path, checkout the command 'basename':
#
#   $ man basename
#
# To count the number of sequences in each file, I recommend you checkout
# 'grep' and 'wc':
#
#   $ man grep 
#   $ man wc 
#
# WARNING about 'grep': ALWAYS quote the string that you are trying to find!
# For example, do:
#
#   $ grep "string I want to find" file-i-want-to-find-it-in.txt
#   **NOT**
#   $ grep string I want to find file-i-want-to-find-it-in.txt # DON'T DO THIS!
#
# To keep a tally of the total number of sequences across all files, 'expr'
# might be useful:
#
#   $ man expr 
#
# Good luck!
#
# ADD YOUR CODE BELOW:

#<<<<<<< HEAD

=======
# DESCRIPTION OF SCRIPT:
# this script takes however many file paths to the desired fasta files as input
# it then loops through each file and counts the number of sequences in it
# the output is a printed message of the total number of sequences in each file, along with the file name, and the total number of sequences across all file paths.


for last in "$@"; do true; done #gets the last argument for the next step
touch stor.txt
for f in "$@"
	do
		#print sequence name and number
		filen=$(basename "$f")
		#separate headers from sequences
		echo "$(grep '>' $f | wc -l) $filen"
		#obtain line count for file and store count total
		grep '>' $f | wc -l >> stor.txt
		if [ $f = $last ]
		then
                	echo `awk '{ sum += $1 } END { print sum }' stor.txt`
			rm stor.txt #not sure how to get the number in a shell 
		fi
	done 
