#! /usr/bin/bash 

if ((`ListDBS.sh | wc -l` > 1 ))
then 
ListDBS.sh 	
echo Enter DbName That You Want To drop   :
read dbname
if [ -d ./$dbname ]
then
rm -r  $dbname
else 
	echo this DB Not Exist
fi 
else
	echo No DBs To Drop 
fi


