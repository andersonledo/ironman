#!/usr/bin/env bash 


function header {
  clear
  header=`cat screens/models/header.screen`
  echo "$header"
}

function recipients {
  for i in `ls -cmh ~/.ironman/default_recipients/*.address` 
  do
    basename $i .address
  done
}


function mails {
   select mailto in `recipients`
      do
         echo "Sending mail to `basename $mailto .address`"
      done
}


function project_options {
   header 
   echo "Choose an option:"
   select option in new-project choose-project 
      do
	case $option in 
	   new-project)
	      echo "Please, type the name of the project:"
              read project_name
              ./create-project.sh $project_name
              ;;
           choose-project)
              projects
              ;;
           *)
              echo "Wrong option."
              break
              ;;
         esac
      done
}


function iteration {

	 select option in info send-mails
         do
            header
            echo "Choose an option."
            case $option in
		info)
		  select info_option in review-all review
                  do
 		     header
                     echo "Choose what to do:"
                     case $info_option in
			review-all)
                            echo "you chose $info_option."
                            ;;  
                        review)
                            echo "you chose $info_option."
 			    ;;
			*)
			    echo "invalid option."
                            break
 			    ;;
                     esac
                  done
                ;;	
                send-mails)
                  echo "you chose $option."
                  ;;
                *)
                  echo "invalid option."
                  break
                  ;;
            esac
         done
 



}



function projects {
   header 
   echo "Choose a project:"
   select project in `ls ../projects`
      do
         header	 
         echo "Working with project $project."
         select opt in choose-iteration create-iteration configure-project
	 do
            case $opt in
               choose-iteration)
                  select it in `./list-iterations.sh`
                  do
                     iteration $it
                  done
                  ;;
               create-iteration)
	          ./create-iteration.sh $project
		  ;;
               configure-project)
                  echo "configure project."
                  ;;
               *)
                  echo "invalid option."
                  break
                  ;;
             esac
         done
     done 
}


clear
splash=`cat screens/models/splash.screen`
echo "$splash"
sleep 0.5 

clear
header=`cat screens/models/header.screen`
echo "$header"


select OPTION in MAILS PROJECT;
do
   case $OPTION in
      MAILS)
        mails 
   	;;
      PROJECT)
        project_options
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




exit 0

