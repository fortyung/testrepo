#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
targetDirectory=$1
destinationDirectory=$2
# [TASK 2]
echo "targetDirectory = $1"
echo "destinationDirectory = $2"

# [TASK 3]
currentTS=`date +%s`

# [TASK 4]
backupFileName="backup-$currentTS.tar.gz"

# [TASK 5]
origAbsPath=`pwd`

# [TASK 6]
cd $2
destAbsPath=`pwd`

# [TASK 7]
cd $origAbsPath
cd $targetDirectory

# [TASK 8]
yesterdayTS=$(($currentTS - 24 * 60 * 60))

declare -a toBackup

for file in $(ls) # [TASK 9]
do
  if ((`date -r $file +%s` > $yesterdayTS)) # [TASK 10]
      then
        toBackup+=($file) # [TASK 11]
      fi
done

tar -czvf $backupFileName ${toBackup[@]} # [TASK 12]
mv $backupFileName $destAbsPath # [TASK 13]
