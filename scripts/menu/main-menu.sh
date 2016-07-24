

source "menu/mails-menu.sh"
source "menu/projects-menu.sh"

function main_menu {
  select OPTION in MAILS PROJECT EXIT;
  do
    case $OPTION in
      MAILS)
        mails 
   	;;
      PROJECT)
        project_options
        ;;
      EXIT)
        echo "Leaving program..."
        sleep 0.5
        break
        ;;
      *) 
        echo "Erro - escolha uma opção válida."
        ;;
    esac
  done
}
