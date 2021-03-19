#! /usr/bin/bash
echo 
echo List of Tables in ${PWD##*/} :
echo 
ls  | grep -v / | awk '{print "( " NR " ) "$0}'
echo 
