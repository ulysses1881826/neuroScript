#!/bin/bash

cat MCI_amyloid_pos.csv | grep _S_ | awk -F "," '{print $1}' > folderName.txt
file=folderName.txt
for i in $(cat $file); do
    tree -d ./MM1/$i >> aimedSubFolderNameList.txt
done
