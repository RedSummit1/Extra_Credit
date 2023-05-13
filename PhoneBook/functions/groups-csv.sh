#!/bin/bash

again="y"
file=$1
char="*"

while [ $again == "y"  ]
do
	over_write=""
	add=""
	input=""
	echo "What is first name of the person you would you like to edit?"
	cat $file | nl
	read input
	over_write=$(grep -i $input $file)
	echo "Is this the record -> $over_write?"
	read input
	if [ $input != "y" ]
	then
		continue
	fi
	sed -i -e 's/'"$over_write"'/'"$char"'/g' $file
	echo "Type the property you would like to add."
	read add
	over_write="$over_write:$add"
	sed -i -e 's/'"$char"'/'"$over_write"'/g' $file
	echo ""
	cat $file
	echo -e "Would you like to choose another record?"
	
	read again
done
