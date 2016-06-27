#!/bin/sh

echo "=== Files not edited yet ==="
for file in *.info
do
  if [ ! -s "$file" ]; then
      echo "* $file"
  fi
done

echo "\n\n\n"
echo "=== Files you already edited ==="
for file in *.info
do
  if [ -s "$file" ]
    then
      echo "> $file"
  fi
done
