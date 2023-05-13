#!/bin/bash
#This file will return what is being looked for 
again="y"
search=""
file=$1
while [ $again = "y" ] 
do
	echo "What would you like to find?"
	read search
	num=$(grep $search $file | wc -l)
	echo -e "There is $num instance(s) of *$search*"
	if [ 0 -eq $num ] 
	then
		cat $file
	else
		grep $search $1
	fi
	echo "Have another term?(y/n)"
	read again
done



#if grep $data
#then
#	echo "I have found $(wc <(grep $data)) of data"
