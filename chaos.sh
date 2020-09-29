#!/bin/bash

get_dir=`pwd`

echo "current dir : $get_dir"

git clone https://github.com/projectdiscovery/public-bugbounty-programs.git

cd public-bugbounty-programs

mkdir output

cat chaos-bugbounty-list.json | grep "name" | awk -F : '{print $2}' | awk -F \" '{print $2}' | tr [:upper:] [:lower:] | while read line; do echo ${line// /_}; done | tee targets.txt

cd output

cat ../targets.txt | while read line; do mkdir $line && cd $line && wget https://chaos-data.projectdiscovery.io/$line.zip && unzip $line.zip && cd ..; done

echo "completed downloding recon-data" 
