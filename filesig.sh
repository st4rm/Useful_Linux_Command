#!/bin/bash

FILE="file_sig_result.txt"

echo -n "Input directory (ex. /tmp): " 
read DIR

if [ -d $DIR ]
then
	echo "Your input directory is existed"
else
	mkdir $DIR
fi

if [ -f $DIR/$FILE ]
then
	rm $DIR/$FILE
fi


find . -exec basename {} \; > $DIR/filename.txt
sort $DIR/filename.txt > $DIR/sorted_filename.txt
cat $DIR/sorted_filename.txt | \
	while read line
	do
		echo $line >> $DIR/$FILE
		xxd -l 16 $line >> $DIR/$FILE
		echo "" >> $DIR/$FILE
	done

rm -rf $DIR/filename.txt $DIR/sorted_filename.txt
