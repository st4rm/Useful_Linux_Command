#!/bin/bash
# filesig.sh(Version 1.0) - June 8, 2018
#
# Extract 16 byte of hexa value frome files
#
# Written by st4rm


FILE="file_sig_result.txt"	# result file name

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

find . -exec basename {} \; > $DIR/filename.txt		# extract file name
sort $DIR/filename.txt > $DIR/sorted_filename.txt	# sort file name
cat $DIR/sorted_filename.txt | \			# extract 16 byte from files and create result file
	while read line
	do
		echo $line >> $DIR/$FILE
		xxd -l 16 $line >> $DIR/$FILE
		echo "" >> $DIR/$FILE
	done

rm -rf $DIR/filename.txt $DIR/sorted_filename.txt	# delete temporary files
