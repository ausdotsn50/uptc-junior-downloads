#!/bin/sh

cd ~/Downloads
cf=course_files

# makes directory if not exists
mkdir -p $cf

# By default, spaces gets to be a separator in this bash script
# Settings IFS keeps the files as 'one'
IFS="
"

# * is a glob
cmsc_files=$(ls | grep "CMSC*")

if [ -n "$cmsc_files" ]; then
 for file in $cmsc_files; do
  mv $file $cf
 done
fi
