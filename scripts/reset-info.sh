#!magic-sh

for i in *.info; do
  cat /dev/null > $i
done

exit 0
