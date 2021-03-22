#!/bin/bash 

# TODO check if THOUGHTSDIR is defined, else define it locally 
echousage(){
	echo "idea new <idea-name> : create a new file"
	echo "idea list : list ideas and edit it"
}

newidea(){
 vi $THOUGHTSDIR/$1
}

ideatopost(){
	POSTNAME=$(ls -t $THOUGHTSDIR | fzf)
  cp $BLOGDIR/starter.tmpl $BLOGDIR/$POSTNAME.md
	cat $THOUGHTSDIR/$POSTNAME >> $BLOGDIR/$POSTNAME.md
}
editidea(){
	vi $THOUGHTSDIR/$(ls -t $THOUGHTSDIR | fzf)
}

listidea(){
	ls -t1 $THOUGHTSDIR 
}
 
viewidea(){
	while true
	do
		less $THOUGHTSDIR/$(ls -t $THOUGHTSDIR | fzf)
		sleep 1
	done
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
			-p|post) 
				ideatopost ; exit;;
			-v|view) 
				viewidea ; exit;;
			-n|new) 
				newidea $2; exit; shift ;;
			-e|edit) 
				editidea;exit;;
      -l|list)
				listidea;
					shift;
					exit 
					;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

