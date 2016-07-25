
source "menu/iteration-menu.sh"

function projects {
stop_single_project_menu=false
while ! $stop_single_project_menu
do
   header 
   echo "Choose a project:"
   select project in `ls ../projects`
      do
           header
           echo "Working with project $project."
           select opt in choose-iteration create-iteration configure-project BACK
	   do
             case $opt in
               choose-iteration)
                  select it in `./list-iterations.sh $project`
                  do
                     iteration $it
                  done
                  #break;
                  ;;
               create-iteration)
	          ./create-iteration.sh $project
                  stop_single_project_menu=true
                  sleep 1
                  #break;
		  ;;
               configure-project)
                  echo "configure project."
                  #break;
                  ;;
               BACK)
                  stop_single_project_menu=true
                  break
                  ;;
               *)
                  echo "invalid option."
                  break
                  ;;
             esac 
           done #select opt
           break; #the select loop needs to stop asking for an option.
     done #select project
done #while

   
}

