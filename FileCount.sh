#!/bin/bash

# FileCount.sh(Version 1.0) - Mar 20, 2015
#
# File counting in linux
#
# Written by st4rm


echo "File Counting..."

# Regular File Count
R_FILEC=`find $1 -type f | wc -l`

# Link File Count
L_FILEC=`find $1 -type l | wc -l`

# Directory Count
DIRC=`find $1 -type d | wc -l`

# Total File Count
TOTAL_FILEC=`expr $R_FILEC + $L_FILEC`

echo " "
echo "Total Scan   Dir. : $DIRC"
echo "Total Scan   File : $TOTAL_FILEC"
echo "   - Regular File : $R_FILEC"
echo "   - Link    File : $L_FILEC"
echo " "
echo "Done."
