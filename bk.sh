#!/bin/sh
DIR=/backup/script/
DAY=$(date +%u) # 1 is Monday [1:7]
DAY_STATUS=""

function delete_old_backup(){
	cd $DIR$DAY_STATUS
	pwd
	find $DIR$DAY_STATUS -mindepth 1 -mtime +5 -delete
	mysqldump -u root -p****** *******  > $DIR$DAY_STATUS/DB_BK_`date +%Y%m%d%H%M`_.sql
}


if [[ -d $DIR"Sunday" && -d $DIR"Monday" &&  $DIR"Tuesday" && $DIR"Wednesday" && $DIR"Thursday" && $DIR"Friday" && $DIR"Saturday"  ]];
then
	
	tput setaf 2
	echo "DIR EXIST."
	tput setaf 7
	
	case $DAY in 
	1)
	 echo "Monday"
	 DAY_STATUS="Monday"
	 delete_old_backup
	 ;;
	2)
	 echo "Tuesday"
	 DAY_STATUS="Tuesday"
	 delete_old_backup
	 ;;
 	3)
	 echo "Wednesday"
	 DAY_STATUS="Wednesday"
	 delete_old_backup
	 ;;
 	4)
	 echo "Thursday"
	 DAY_STATUS="Thursday"
	 delete_old_backup 
	 ;;
 	5)
	 echo "Friday"
	 DAY_STATUS="Friday"
	 delete_old_backup
	 ;;
	6)
	 echo "Saturday"
	 DAY_STATUS="Saturday"
	 delete_old_backup
	 ;;
	7)
	 echo "Sunday"
	 DAY_STATUS="Sunday"
	 delete_old_backup
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
