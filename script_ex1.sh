#!/bin/bash
if [ $# -eq 0 ]
then
	echo Sorry You should enter at least one argument!
else
	for I in $@
	do
		INFO=$(cat /etc/passwd | egrep -i  "$I " | sed 'y/:,/  /' | awk '{print $5, $6, "("$1")"}')
		if [ ${#INFO} -eq 0 ]
		then
			echo "$I -" no user! 
			continue
		fi
		echo -n "$INFO "
		USER=$( cat /etc/passwd | grep -i "$I " | cut -d ":" -f 1)
		LASTLOG=$(lastlog | grep $USER | awk '{print " - " $4, $5, $6}')
	echo $LASTLOG	
	done
fi


