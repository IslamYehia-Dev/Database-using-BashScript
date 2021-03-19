#! /usr/bin/bash
echo 
echo Enter Table Name:
read tname

if [ -f "$tname"".csv" ]
then
	PS3="Choose Select option :"
	select ch in "Select All" "Select by PK" "Exit"
	do
		case $REPLY in 
			1)
				cat $tname".csv" | column -t -s, |less	
				
				;;
			2)
				echo Enter PK :
			        read prkey
        			found=`awk -F, -v x="$prkey" '{if(x==$1){print 1}}' $tname".csv" `
        			if [ -z "$found" ]
        			then
                			echo Primary Key Not Found
        			else
                			awk -F, -v x="$prkey" '{if(x==$1 || NR==1 ){print $0}}' $tname".csv" | column -t -s, | less 
        				#awk -F, '{print $0}' $tname".csv"
				
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
