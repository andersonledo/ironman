#!/bin/sh

# TODO: only one recipient can receive mails today.
# TODO: the operation needs to be atomic, if an error occur while reading the parameters, mail should no be sent. If mail could not be sent, mail file should not be moved to sent folder.

#validate arguments
# $1 - recipients path
# $2 - mail file to send


E_BADARGS=85

# check for arguments
if [ -z "$1" ] || [ -z "$2" ]
then
  echo "Usage: `basename $0` path/to/recipients/file path/to/mail/file"
  exit $E_BADARGS 
fi



BASE_PATH="./.."
echo "Defining folder \"$BASE_PATH\" as the base path for info."

MAIL_USER=`cat $BASE_PATH/user.name`
MAIL_SERVER=`cat $BASE_PATH/mail-server.address`
MAIL_USER=`cat $BASE_PATH/user.name`
MAIL_RCPTS=`cat $1`

curl --ssl --mail-from "<$MAIL_USER@$MAIL_SERVER>" $MAIL_RCPTS --verbose --url smtp://smtp.$MAIL_SERVER:587 -u $MAIL_USER -T $2 --insecure

#if sent/ folder does not exists
if [ ! -d sent/ ]
then
   mkdir sent
   echo "Folder 'sent' created. Sent mails will be moved to this folder."
fi
mv $2 sent/`basename $2`.mail


#exit with success
exit 0
