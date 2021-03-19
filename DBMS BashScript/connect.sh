#! /usr/bin/bash 
echo ""
echo Enter DB Name To Connect To :
read dbname

if [ -d ./$dbname  ]
then 	
	cd $dbname
	echo Connected 
	ConnectMenu.sh
else
       echo This DB does not Exist	
fi


