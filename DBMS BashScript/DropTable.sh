#! /usr/bin/bash 
echo 
echo Enter Table Name To Drop :
read tname

if [ -f "$tname"".csv" ]
then 
	rm "$tname"".csv"
else
	echo Table does not EXIST
fi
echo 
