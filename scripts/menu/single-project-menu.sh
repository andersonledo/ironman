

source "menu/iteration-menu.sh"

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

