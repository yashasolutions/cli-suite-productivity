#!/bin/bash 


# in case exclude dir is not an option
# need to be rewritten using stuff from:
# https://salferrarello.com/grep-exclude-directories/ 

XDIRS="--exclude-dir=node_modules "
XDIRS=$XDIRS" --exclude-dir=vendor"
XDIRS=$XDIRS" --exclude-dir=.* "

FILE=$(grep -irl $XDIRS $1 | fzf)

vi $FILE 
