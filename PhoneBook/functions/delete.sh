#!/bin/bash
#this script will delete a record form the csv file


record=""
file=$1
again="y"
if [ -e $file ]
then 
	while [ $again = "y" ]  && [ -e $file ] 
	do
		echo "What is the record that you would like to remove?"
		cat $file | nl
		read num
		response="n"
		while [ $response = "n" ]
		do
			record=$(sed -n "$num"p"" $file)
			echo "Remove the record -> $record?"
			read response
			if [ $response = "n" ]
			then
				echo "What is the record that you would like to remove?"
				cat $file | nl
				read num
			fi
		done
		sed -i ''$num'd' $file
		cat $file
		echo -e "\nWould you like to remove another file."
		read again 
			
	done
else
	echo "Sorry, but their is no file available"
fi
	# get opts use to process flags 
