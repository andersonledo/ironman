

source "menu/mails-menu.sh"
source "menu/projects-menu.sh"
source "menu/header.sh"


function main_menu {
  stop_program=false
  while ! $stop_program
  do 
    header
    select OPTION in MAILS PROJECT EXIT;
    do
      case $OPTION in
        MAILS)
          mails 
          break;
          ;;
        PROJECT)
          project_options
          break;
          ;;
        EXIT)
          echo "Leaving program..."
          sleep 0.5
          stop_program=true
          break
          ;;
        *) 
          echo "Erro - escolha uma opção válida."
          ;;
       esac
     done
  done
}
