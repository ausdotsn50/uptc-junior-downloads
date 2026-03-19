#!/bin/sh

cd ~/Downloads
cf=course_files

# makes directory if not exists
mkdir -p $cf
cd $cf
mkdir -p CMSC_121 CMSC_123 CMSC_125 CMSC_127 CMSC_197 CMSC_199.1 
cd ../ # back to dl folder

# By default, spaces gets to be a separator in this bash script
# Settings IFS keeps the files as 'one'
IFS="
"

# CMSC string regardless of position in full filename
cmsc_files=$(ls | grep "CMSC")
cmsc_121_files=$(ls | grep -E "CMSC.?121")
cmsc_123_files=$(ls | grep -E "CMSC.?123")
cmsc_125_files=$(ls | grep -E "CMSC.?125")
cmsc_127_files=$(ls | grep -E "CMSC.?127")
cmsc_197_files=$(ls | grep -E "CMSC.?197")
cmsc_199_1_files=$(ls | grep -E "CMSC.?199\.1")

if [ -n "$cmsc_files" ]; then
  for file in $cmsc_files; do

    # Grep w/ the filename
    # Usage of grep with a list: echo "apple\nbanana\ngrape" | grep "banana"
    if echo "$cmsc_121_files" | grep -qF "$file"; then
      mv "$file" "$cf/CMSC_121/"
    elif echo "$cmsc_123_files" | grep -qF "$file"; then
      mv "$file" "$cf/CMSC_123/"
    elif echo "$cmsc_125_files" | grep -qF "$file"; then
      mv "$file" "$cf/CMSC_125/"
    elif echo "$cmsc_127_files" | grep -qF "$file"; then
      mv "$file" "$cf/CMSC_127/"
    elif echo "$cmsc_197_files" | grep -qF "$file"; then
      mv "$file" "$cf/CMSC_197"
    elif echo "$cmsc_199_1_files" | grep -qF "$file"; then
      mv "$file" "$cf/CMSC_199.1"
    else
      echo "No subfolder match: $file"
    fi

  done
fi
