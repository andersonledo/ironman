
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

