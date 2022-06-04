#!/bin/bash
if [ $# -eq 0 ]
then 
	echo Oops you forgot to enter an argument! 
elif [ $# -gt 1 ]
then 
	echo Sorry you should enter only one parametr!
else
	if [ -d $1 ]
	then 
		echo  What do you want to do:
		echo "1. Print content"
		echo "2. Remove content"
		echo "3. Save content in backup directory"
		read choise
		case $choise in 
			1) ls $1
				;;
			2) rm $1/*
			   echo Content removed
				;;
			3) mkdir dirBackup
			   cp $1/* dirBackup
			   echo  New directory dirBackup is created with copy of content
				;;
			*) echo Something went wrong try again 😢!
				;;
		esac
	elif [ -e $1 ]
	then 
		echo You entered file name 
	else
		echo You entered not a file name nor directory name Sorry 😕!
	fi
fi
	
	
