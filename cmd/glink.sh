#!/bin/bash


# make a link to a google file based on its id

BASE="https://drive.google.com/file/d/"
id=$1

echo -n $BASE$id | xclip -selection clipboard
echo $BASE$id 
