#!/usr/bin/env bash

clear
splash=`cat splash.screen`
echo "$splash"
sleep 3

clear
header=`cat header.screen`
echo "$header"


select OPTION in MAILS PROJECT
do
   case $OPTION in
      MAILS)
	mails()
        break
   	;;
      PROJECT)
        projects()
        break
        ;;
      none)
        break
        ;;
      *) 
        echo "Erro - escolha uma opção válida."
        ;;
   esac
done





echo -n "Enter your name and press [ENTER]: "
read name
echo -n "Enter your gender and press [ENTER]: "
read -n 1 gender
echo

grep -i "$name" "$friends"

if  [ $? == 0 ]; then
  echo "You are already registered, quitting."
  exit 1
elif [ "$gender" == "m" ]; then
  echo "You are added to Michel's friends list."
  exit 1
else
  echo -n "How old are you? "
  read age
  if [ $age -lt 25 ]; then
    echo -n "Which colour of hair do you have? "
    read colour
    echo "$name $age $colour" >> "$friends" 
    echo "You are added to Michel's friends list.  Thank you so much!"
  else
    echo "You are added to Michel's friends list."
    exit 1
  fi
fi


function mails {
   echo ">>> MAILS"
}

function projects {
   echo ">>> PROJECTS"
}




exit 0

