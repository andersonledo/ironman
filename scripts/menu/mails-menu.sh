
function recipients {
  for i in `ls -h ~/.ironman/default_recipients/*.address` 
  do
    basename -s .address $i
  done
}


function mails {
   select mailto in `recipients`
      do
	 echo "Dear... $mailto"
	 echo "<your message>"
	 echo "...Regards,..."
	 echo "Type your message here:"
	 read mail_message
         echo "Sending mail to `basename $mailto .address`"
      done
}


