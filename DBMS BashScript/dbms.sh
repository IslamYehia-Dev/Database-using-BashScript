#! /usr/bin/bash
PS3="Enter Your Choise :"
select cho in "Create Database"   "List Databases"   "Connect To Database"   "Drop Database" "Exit"
do 
	case $REPLY in 
		1)
			CreateDB.sh
			;;
		2)
			ListDBS.sh
			;;
		3)
			connect.sh
			;;
		4)
			DropDB.sh
                        ;;
		5) 
			exit 
			;;
		*)
			echo wrong choice
			;;
	esac
done
