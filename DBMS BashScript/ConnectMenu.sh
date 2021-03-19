#! /usr/bin/bash 
echo ""
PS3="${PWD##*/} Menu  :"
select cho in "Create Table"   "List Tables"   "Drop Table"   "Insert Into Table" "Select From Table" "Delete From Table" "Exit"
do
        case $REPLY in
		1)
			CreateTable.sh
			;;
		2) 
			ListTables.sh
			;;
		3) 
			DropTable.sh
			;;
		4)
			InsertRow.sh
			;;
		5)
			Selectfrom.sh
			;;
		6)
			Deletefrom.sh
			;;
	
                *)
                        exit
                        ;;
        esac
done

