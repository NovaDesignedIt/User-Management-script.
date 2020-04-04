#!/bin/bash

#linux shell scripting assignement 2
#meech lamirande kabuasa 040880736
#user management script 
#due date: march 25th 
#this is a simple user management system, it can create, delete,change user information and more..


##this is the main prompt of the script is promts user to make a choice as $choice  
echo Welcome to user management script here are the following options 
 
##nulling the choice variable so that it hops in the loop  
choice=n
#this while loop is the backbone of the script it keeps the user inside while they dont choose to leave



while [ "$choice" != "Q" ] && [ "$choice" != "q" ]
#probleme i ran into: for String comparison the string items have to be double quoted and
#there has to be space in between the comparison operator
## --BEGIN WHILE LOOP
### ----- >> tester echo "$choice"
#prompting inside the loop because they need to chose again once they finish with their choice 

do

	
	echo -e "\tA)create user\n\tB)Delete user\n\tC)Change suplementary groups for user accounts\n\tD)Change inital group for a user
        E)Change default login shell for user account\n\tF) change account Expiration date for user account \n\tQ) Quit"
        read -p "please select among the following options: " choice
clear
## Test echho -- echo $choice       
#this is the main chunk of the script that will be executed once the choice is takin in user input 

if [ "$choice" == "A" ] || [ "$choice" == "a" ] 
  then
	 
	# echo $choice 
 
	read -p "Please enter a Username:" username
	read -p "Please enter home directory (provid absolute path):" path
	read -p "enter your default login shell (provide an absolute path):" shell

#this is the command to add a user -d for specified directory -s for specific shell 
## this will also add a welcome statement so that we know the user has been created by grepping the username reference
sudo useradd -d "$path" -s $shell $username

echo "welcome! $( grep $username /etc/passwd )" 
#	sleep 3
	
elif [ "$choice" == "B" ] ||  [ "$choice" == "b" ] 
  then
		#this option has to prompt for username of the account you want to delete and it's home Directory 
	  read -p "Please enter the Username you wish to delete" user
	  sudo userdel $user 
	  rm -r /home/$users

		
# 	sleepi 3
elif [ "$choice" == "C" ] || [ "$choice" == "c" ]
  then
	  ## this option must promtp for username and group name that is added as a supplementary group for the user account 
	read -p "Please enter Username: " user
	groups 
	read -p "please enter the group name you wish add $user to: " groups
	usermod -a -G $groups $user 
	grep $groups /etc/group 

   
	  #this must promt for username and the group name that is added as supplementary group for the user account 
#	 echo this is choice C  

#p	sleep 3
elif [ "$choice" == "D" ] || [ "$choice" == "d" ]
  then
	  #this prompts for username and the group name that is used as the inital group for the user account and change the initial group for the user 

	read -p "Please enter the USername" user 
	read -p "Enter the group" group













  	 echo this is choice D
#	sleep 3

elif [ "$choice" == "E" ] || [ "$choice" == "e" ]
  then
	 #must promtp for the username and shell name and change the Default shell for the user account 
	read -p "please enter username" user
	read -p "please enter username" shell
	
	 echo this is choice E
#	sleep 3
 elif  [ "$choice" == "F" ] || [ "$choice" == "f" ]
  then 
	  #must promt for the username and expiration date and change the expiration date for the user account. the date must be entered as YYYY-MM-DD
	
	  read -p "please enter the username" user
	  echo  "for Expiration date: "
	  read -p "please enter the year (YYYY): " year
	  read -p "please enter the month (MM): " month
	  read -p "please enter the day (DD): " day

	  chage -E  $year-$month-$day $user



	 echo this is choice F
#	 sleep 3
elif [ "$choice" == "q" ] || [ "$choice" == "Q" ] 
then 
echo goodbye 

else
 
 	echo [****  this is a invalid entry please re-enter.  ****]
#	 sleep 3
 #echo $choice . . . some tester code because my $choice wasn't being passed when reading. 

fi 
done
exit #exits the script.
