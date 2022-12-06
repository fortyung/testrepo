#!/bin/bash

# [TASK 1]
targetDirectory=$1
destinationDirectory=$2
# [TASK 2]
echo "targetDirectory = $1"
echo "destinationDirectory = $2"
# [TASK 3]
currentTS=`date +%s`

echo "$currentTS"


backupFileName="tar -cvf backup-[$currentTS].tar.gz $2"

echo "$backupFileName"