#!/bin/bash
# This code takes Date as input in YYYYMMDD Format.
# Copies the Files / FOlders to Destination if Source contains the files.

StartDate=`date +"%Y%m%d" -d $1`  #"20160601"`
EndDate=`date +"%Y%m%d" -d $2`    #"20160605"`
src=/home/yogesh/
dest=/home/cstechera/
if [ $# -ne 2 ]
then
    echo "Usage:`basename $0` Start_Date End_Date"
    echo "bash `basename $0` 20160601 20160605"
    exit $E_BADARGS
fi

if [[ ! -d $src || ! -d $dest  ]]
then
 echo "Given Source or Destination Path does not Exists. Please check the Path."
 exit $E_NOFILE
fi

echo "StartDate: "$StartDate
echo "EndDate: "$EndDate
echo "Source Path: "$src
echo "Destination Path: "$dest

while [ "$StartDate" -le "$EndDate" ] ; 
do 
 if [ -d  $src$StartDate ]     
   echo $src$StartDate
   
   rsync $src$StartDate/*.* $dest$StartDate/
 fi    
   # Increment Date by one day
 StartDate=`date +"%Y%m%d" -d "$StartDate + 1 day"`; 
done
echo "All Done"
