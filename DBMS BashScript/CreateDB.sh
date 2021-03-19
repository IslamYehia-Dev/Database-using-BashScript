#! /usr/bin/bash
echo ""
echo Enter DB Name :
read dbname
if [ -d ./$dbname ]
then 
	echo This DB Already Exist 
else 
	mkdir $dbname
	echo $dbname Created successfully 
fi

