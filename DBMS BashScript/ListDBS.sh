#! /usr/bin/bash
d=`ls -l | grep ^d |wc -l`
if test $d -gt 0
then
echo "$d"
echo List of Databases :
echo "---------------------"

ls -l | grep ^d | awk '{print "( " NR " ) = [ "  $9 " ] "}'
else
	echo no dbs to list
fi 
