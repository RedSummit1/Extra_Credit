#!/bin/bash
finish="n"
input=""
arg=""
file=$1


while test $finish == "n"
do  

	if ! shift; then
		echo "Nobody gave me any arguments! Make one? (y/n)"
		read input
		if test "y" != $input; then
			echo -e "Then pass it in now\nfile = " 
			read arg
			if test -z "$arg"; then 
				continue
			fi
			file=$arg	
		fi
		touch data.csv
		echo "Enter the data that you want to put in, seperate each with a comma (,). Enter done when finished."
		read arg
		while test $arg != "done"; do
			 echo "$arg" >> data.csv
			 read arg
		done
		file=data.csv
	fi
	while [ $finish != "y" ]
	do
		echo 'What should I do with your $file?' 
		echo ""
		echo " 1) Add more records." 
		echo " 2) Find a record." 
		echo " 3) Change a record." 
		echo " 4) Delete a record." 
		echo " 5) Group" 
		read arg
		case $arg in 
		1) 
			./functions/create.sh $file ;;
		2) 
			./functions/read.sh $file ;;
		3) 
			./functions/update.sh $file ;;
		4) 
			./functions/delete.sh $file ;;
		5)
			./functions/groups-csv.h $file;; 
		*) 
			echo "Get out"; exit 0;
		esac
		echo "Finished (y/n)?"
		read finish
	done
done 
