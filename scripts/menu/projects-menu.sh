

source "menu/single-project-menu.sh"

function project_options {
   header 
   echo "Choose an option:"
   select option in new-project choose-project BACK
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
           BACK)
              break;;
           *)
              echo "Please, choose a valid option."
              ;;
         esac
      done
}

