#!/bin/bash


REPO="my/repo"
. $HOME/.gtaskrc


while [[ "$#" -gt 0 ]]; do
    case $1 in
        -l|list) 
					glab issue list -R $REPO; exit ;;
        -v|view) glab issue view $2 -R $REPO; exit ;;
        -c|close) glab issue close $2 -R $REPO; exit ;;
        -w|web) glab issue view -w $2 -R $REPO; exit;;
        -a|add) glab issue create -t $2 -d "" --no-editor -R $REPO; exit; shift;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

