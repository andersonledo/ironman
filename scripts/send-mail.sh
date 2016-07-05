#!/bin/sh

#validate arguments
# $1 - recipients path
# $2 - mail file to send

BASE_PATH="./.."
echo "Defining folder \"$BASE_PATH\" as the base path for info."

MAIL_USER=`cat $BASE_PATH/user.address`
MAIL_SERVER=`cat $BASE_PATH/mail-server.address`
MAIL_USER=`cat $BASE_PATH/user.address`
MAIL_RCPTS=`cat $1`


curl --ssl --mail-from "<$MAIL_USER@$MAIL_SERVER>" --mail-rcpt "$MAIL_RCPTS" --verbose --url smtp://smtp.$MAIL_SERVER:587 -u $MAIL_USER -T $2 --insecure

#if sent/ folder does not exists
if [ ! -d sent/ ]
then
   mkdir sent
   echo "Folder 'sent' created. Sent mails will be moved to this folder."
fi
mv $2 sent/`basename $2`.mail

