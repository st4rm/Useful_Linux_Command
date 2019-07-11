#!/bin/bash

# fileMerge.sh(Version 1.0) - April 16, 2019
#
# File Merge with New Line 
#
# Written by st4rm
# 
#

FILE="file_merge_result.txt"	# result file name

echo -n "Input directory for result file.(ex. /tmp): " 
read DIR

echo ""

if [ -d $DIR ]
then
	echo "Your input directory is existed"
else
	mkdir $DIR
fi

if [ -f $DIR/$FILE ]
then
	echo "Previos result file is deleted"
	rm $DIR/$FILE
fi

echo ""

find . -type f > $DIR/filename.txt		# extract file name
sort $DIR/filename.txt > $DIR/sorted_filename.txt	# sort file name


## Print file type with unix command(file) and write 16 byte from files 
cat $DIR/sorted_filename.txt | \
	while read line
	do
		echo " ######################### NEW FILE ############################" >> $DIR/$FILE
		echo $line >> $DIR/$FILE
		cat $line >> $DIR/$FILE
		echo "" >> $DIR/$FILE
		echo "" >> $DIR/$FILE
		echo "" >> $DIR/$FILE
	done

rm -rf $DIR/filename.txt $DIR/sorted_filename.txt	# delete temporary files
