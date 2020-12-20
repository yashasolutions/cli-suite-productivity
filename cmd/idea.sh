#!/bin/bash 

# TODO check if THOUGHTSDIR is defined, else define it locally 
echousage(){
	echo "idea new <idea-name> : create a new file"
	echo "idea list : list ideas and edit it"
}

newidea(){
 vi $THOUGHTSDIR/$1
}

listidea(){
	vi $THOUGHTSDIR/$(ls -t $THOUGHTSDIR | fzf)
}
 

while [[ "$#" -gt 0 ]]; do
    case $1 in
			-n|new) newidea $2; exit; shift ;;
      -l|list)listidea;
					shift;
					exit 
					;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

