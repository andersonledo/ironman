

source "menu/single-project-menu.sh"

function project_options {

stop_projects_menu=false
while ! $stop_projects_menu
do
   header 
   echo "Choose an option:"
   select option in new-project choose-project BACK
      do
	case $option in 
	   new-project)
	      echo "Please, type the name of the project:"
              read project_name
              ./create-project.sh $project_name
              sleep 1
              break;
              ;;
           choose-project)
              projects
              break;
              ;;
           BACK)
              stop_projects_menu=true
              break;;
           *)
              echo "Please, choose a valid option."
              sleep 0.5
              break;
              ;;
         esac
      done
done
}

