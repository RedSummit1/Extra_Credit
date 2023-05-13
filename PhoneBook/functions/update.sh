#!/bin/bash
#Will update the data.csv file

num=0
record=""
change=""
again="y"
file=$1
i=$(wc -l $file)
while [ $again = "y" ] 
do
	echo "Which of the following would you like to update?"
	cat $file | nl
	read num
	record=$(sed -n "$num"p"" $file)
	echo -e "Please type the updated version of the record.\n$record\n"
	read change
	echo ""
	sed -i 's/'$record'/'$change'/g' $file 
	cat $file
	echo -e "\nHave another record to update? (y/n)"
	read again

done
