#!/bin/bash
# This create utility will add records to a csv file
response="y"
record=""
while [ $response = "y" ]
do
	echo "Please enter the record you would like to add."
	read record
	echo $record >> $1
	echo "Continue? (y/n):"
	read response
done
echo -e "The file $1 now contains the values\n"
cat $1
echo 
echo "Function done"

