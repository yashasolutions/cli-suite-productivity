#!/bin/bash 

#last n file in folder

MAX=$1
FOLDER=$2

[ -z $MAX ] && MAX=5
[ -z $FOLDER ] && FOLDER=. 

ls -1t $FOLDER  | head -$MAX 
