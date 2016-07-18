# This file is intentionally left without an interpreter declaration.
# You should run this file with your local sh interpreter.
# After running it, it will set a symbolic link to your local sh interpreter.
# This link will be used in all the other scripts.


echo "Trying to set up sh env..."

magic=`which sh`
echo $magic
magic_name=`basename $magic`
echo "found the $magic_name magic."

if [ $magic_name = "sh"  ]
then
   if [ ! -e ~/.ironman/magic ]
   then
      mkdir ~/.ironman
      ln -s $magic ~/.ironman/magic
      echo "magic file created in ~/.ironman."
   else
      echo "we already have some magic here."
   fi
else
   echo "sorry. we could not create the magic here."
fi

PROJECTS_PATH="../projects"
export PROJECTS_PATH
echo "Projects path exported as: $PROJECTS_PATH."


exit $?

