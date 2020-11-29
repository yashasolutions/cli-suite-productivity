#!/bin/bash


# have gdrive as a dependency

FILE=$1

# testing data 
#echo -e "Uploading testimage.jpg \nUploaded 1d2m1e8PRC3OYeDyeup0okDYx6OusKSRo at 48.3 KB/s, total 65.4 KB" | sed -n '2p' | cut -d" " -f2 | xargs glink


FILEID=$(gdrive upload $FILE | sed -n '2p' | cut -d" " -f2)
gdrive share $FILEID 
glink $FILEID
