#!magic 

echo " ======= IMPORTANT NOTE ======= "
echo " * You should be very sure about running this script because it is going to uninstall some packages and it may cause some collateral effect on your system."
echo "* If you have any doubt about running it or not, don't."
echo "* It will apt-get purge"
echo "   - curl"
echo "* Then it will do apt-get autoremove to get rid off other dependencies installed automatically."
echo " DO YOU WANT TO PROCEED? (Y) or (N)"
read PROCEED

if test $PROCEED != Y; then
  echo "Uninstall procedure STOPPED."
  exit 1
fi

echo "Proceeding with UNINSTALL."


echo "Uninstalling dependencies. Your action may be required."

echo "Preparing to uninstall cURL."
sudo apt-get purge curl 

echo "Do you want to remove unnused packages? Caution: It may remove other packages than the ones installed by Ironman. (Y) or (N)?"

read PROCEED 
if test $PROCEED != Y; then
  echo "Autoremove procedure STOPPED."
  exit 1
fi

sudo apt-get autoremove



exit 0
