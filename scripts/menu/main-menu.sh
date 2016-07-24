

source "menu/mails-menu.sh"
source "menu/projects-menu.sh"

function main_menu {
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
}
