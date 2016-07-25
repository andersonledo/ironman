# This file is intentionally left without an interpreter declaration.
# You should run this file with your local sh interpreter.
# After running it, it will set a symbolic link to your local sh interpreter.
# This link will be used in all the other scripts.


function create_magic {
  magic=$1
  magic_name=`basename $magic`
  echo "found the $magic_name magic."

  if [ ! -e magic-$magic_name ]
  then
    ln -s $magic magic-$magic_name
    echo "magic-$magic_name file created"
  else
    echo "we already have some magic-$magic_name here."
  fi
}


echo "Trying to set up sh env..."
magic=`which sh`
echo $magic
create_magic $magic


echo "Trying to set up bash env..."
magic=`which bash`
echo $magic
create_magic $magic


if [ ! -e ~/.ironman ]
then
  mkdir ~/.ironman
fi



default_rcpts=~/.ironman/default_recipients
if [ ! -e $default_rcpts ]
then
   mkdir $default_rcpts 
   example=$default_rcpts/example.address
   touch $example  
   echo "meuemail@mail.com" > $example 
fi




PROJECTS_PATH="../projects"
export PROJECTS_PATH
echo "Projects path exported as: $PROJECTS_PATH."


exit $?

