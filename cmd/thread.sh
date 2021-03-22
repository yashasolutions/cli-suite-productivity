#!/bin/bash 

# TODO check if THREADSDIR is defined, else define it locally 
echousage(){
	echo "thread new <thread-name> : create a new file"
	echo "thread list : list threads and edit it"
}

newthread(){
 vi $THREADSDIR/$1
}

editthread(){
	vi $THREADSDIR/$(ls -t $THREADSDIR | fzf)
}

postthread(){
	threadify $THREADSDIR/$(ls -t $THREADSDIR | fzf)
}

listthread(){
	ls -t1 $THREADSDIR 
}
 
viewthread(){
	while true
	do
		less $THREADSDIR/$(ls -t $THREADSDIR | fzf)
		sleep 1
	done
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
			-p|post) 
				postthread ; exit;;
			-v|view) 
				viewthread ; exit;;
			-n|new) 
				newthread $2; exit; shift ;;
			-e|edit) 
				editthread;exit;;
      -l|list)
				listthread;
					shift;
					exit 
					;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

