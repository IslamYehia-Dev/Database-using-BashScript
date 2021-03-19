#! /usr/bin/bash

echo  Enter Table Name :
read tname 
if [ -f ./"$tname"".csv" ]
then 

	record=""
	typeset -i nof
	nof=0
	nof=`head -1 "$tname"".csv" | awk -F, '{print NF}' `
	typeset -i iterator
	iterator=1        
	while [ $nof -gt 0 ]
	do
       	
        	echo enter `head -1 "$tname"".csv" | awk -F, -v x="$iterator" '{print $x}'` value
		read colvalue
		if test $iterator -eq 1
		then	
		found=`awk -F, -v x="$colvalue" '{if(x==$1){print 1}}' $tname".csv" `
		if [ -z "$found" ]
		then 
			record="${record}${colvalue}"","
		else 
			echo Existing Primary Key
			let nof=$nof+1
	 		let iterator=$iterator-1
		fi	
	   	elif test $nof -eq 1
       	   	then
       	    	record="${record}${colvalue}"
           	else
       	    	record="${record}${colvalue}"","
       	   	fi	
		let nof=$nof-1
	 	let iterator=$iterator+1
	done
	echo $record >> $tname".csv"
else
	echo table does not exist
fi
