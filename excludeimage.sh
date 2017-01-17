#!/bin/bash
echo "########################################"
echo "The following backupids will be removed"
echo "########################################"

echo "--------------------------------- $1 ---------------------------------------------"
bpimagelist -d 01/01/2017 -e 01/13/2017 -U -client $1
echo "--------------------------------- $1 ---------------------------------------------"

bkpid=$(bpimagelist -U -client $1 -idonly -d 01/01/2016 19:00:00 -e 01/13/2017 08:00:00 | awk '{print $8}')

for eachresult in $bkpid
do
        bpexpdate -recalculate -backupid $eachresult -d 0 -client $1 -M glt-backup-master -force && echo "$eachresult deleted";
        #bpimage -deletecopy 1 -backupid $eachresult && echo "$eachresult deleted";
done
