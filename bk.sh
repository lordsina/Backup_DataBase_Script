#!/bin/sh
DIR=/backup/script/
DAY=$(date +%u) # 1 is Monday [1:7]
DAY_STATUS=""

if [[ -d $DIR"Sunday" && -d $DIR"Monday" &&  $DIR"Tuesday" && $DIR"Wednesday" && $DIR"Thursday" && $DIR"Friday" && $DIR"Saturday"  ]];
then
	
	tput setaf 2
	echo "DIR EXIST."
	tput setaf 7
	
	case $DAY in 
	1)
	 echo "Monday"
	 DAY_STATUS="Monday"
	 ;;
	2)
	 echo "Tuesday"
	 DAY_STATUS="Tuesday"
	 cd $DIR$DAY_STATUS
	 FILE=$(ls -t1 |  head -n 1 | awk -F'.' '{print $1}') 
	 if test -z "$FILE";then
		 echo "empty"
	 fi
	 ;;
 	3)
	 echo "Wednesday"
	 DAY_STATUS="Wednesday"
	 ;;
 	4)
	 echo "Thursday"
	 DAY_STATUS="Thursday"
	 ;;
 	5)
	 echo "Friday"
	 DAY_STATUS="Friday"
	 ;;
	6)
	 echo "Saturday"
	 DAY_STATUS="Saturday"
	 ;;
	7)
	 echo "Sunday"
	 DAY_STATUS="Sunday"
	 ;;
	*)
	 echo "Error Date."
	;;
	 esac
else
	tput setaf 1
	echo "DIR NOT EXIST.LOADING TO CREATE DIR."
	tput setaf 7
	sleep 2
	mkdir $DIR"Sunday"
	mkdir $DIR"Monday"
	mkdir $DIR"Tuesday"
	mkdir $DIR"Wednesday"
	mkdir $DIR"Thursday"
	mkdir $DIR"Friday"
	mkdir $DIR"Saturday"
	tput setaf 2
	echo "CREATE DIR COMPLETED."
	tput setaf 1
	bash $DIR"bk.sh"
fi
