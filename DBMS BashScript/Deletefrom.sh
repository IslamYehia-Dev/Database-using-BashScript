#! /usr/bin/bash
echo 
echo Enter Table Name:
read tname

if [ -f "$tname"".csv" ]
then
	PS3="Choose Delete option :"
	select ch in "Delete all Records" "Delete using PK" "Exit"
	do
		case $REPLY in 
			1)
				sed -i -n '1p' $tname".csv"
				;;
			2)
				echo Enter PK :
			        read prkey
        			found=`awk -F, -v x="$prkey" '{if(x==$1){print 1}}' $tname".csv" `
        			if [ -z "$found" ]
        			then
                			echo Primary Key Not Found
        			else
                			sed -i "/^$prkey,/d" $tname".csv"
        			fi
				;;
			3)
				exit 
				;;
			*)
				echo wrong choice 
				;;
		esac
	done

else
        echo Table does not EXIST
fi
echo
