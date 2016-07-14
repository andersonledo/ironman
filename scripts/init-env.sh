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
