#!magic-sh

for i in `ls -hd ../projects/$1/*/`; do echo "`basename $i`"; done
