#! /usr/bin/bash 
declare -a mycols=()
function check {
for i in "${mycols[@]}"
do
if [ "$i" == "$1" ]
then
        return 1
fi
done
}

function crtable {

typeset -i colNum
colNum=0
echo ""
echo Enter Number of Columns :
read colNum
metadat=""
if [ $colNum -gt 0 ]
then
        touch "$tname"".csv"
	typeset -i iterator
	iterator=0
        while [ $colNum -gt 0 ]
        do
	echo "Enter ColNum $((iterator+1 )) Name :"
        read colname
     if [ -n "$colname" ]
        then
	  check $colname
	  if test $? -ne 1
	  then 
	  mycols[iterator]=$colname
	   if test $colNum -eq 1
       	   then
       	    metadat="${metadat}${colname}"
           else
       	    metadat="${metadat}${colname}"","
       	   fi
	   let colNum=$colNum-1
	   let iterator=$iterator+1
         else 
		echo Repeated Column Name
	 fi	
     else
           echo Column Name Not Valid try again    
     fi
        done
        echo $metadat > $tname".csv"
else
        echo Number of columns Not Valid
	CreateTable.sh
fi


}
echo ""
echo  Enter Table Name :
read tname 
if [ -z "$tname" ] 
then 
	echo Table name not valid
	CreateTable.sh
elif [ -f ./"$tname"".csv" ]
then 
	echo table already exist
else 
	crtable
	
fi
