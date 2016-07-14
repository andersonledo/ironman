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
   if [ ! -e magic ]
   then
      ln -s $magic magic
      echo "magic file created."
   else
      echo "we already have some magic here."
   fi
else
   echo "sorry. we could not create the magic here."
fi
