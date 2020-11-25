#!/bin/bash


# by default show last modifiedTime
# if given parameter search by name

qdate=$(date --rfc-3339=seconds | sed "s/ /T/")
withshared=true 
name=$1

mdtime="modifiedTime<='$qdate'"
shared="sharedWithMe=$withshared"
byname="name contains '$name'"

params="$byname"
[ -z $name ] && params="$mdtime"

# order can : createdTime, folder, modifiedByMeTime, modifiedTime, recency
echo $params
gdrive list -q "$params" | fzf | cut -d" " -f1 | xclip -selection clipboard

#gdrive list -q "sharedWithMe=true"
