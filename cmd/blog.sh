#!/bin/bash 

# TODO check if BLOGDIR is defined, else define it locally 
echousage(){
	echo "blog new <blog-name> : create a new file"
	echo "blog list : list posts and edit "
}

newblog(){
 cp $BLOGDIR/starter.tmpl $BLOGDIR/$1.md
 vi $BLOGDIR/$1.md
}

editblog(){
	cd $BLOGDIR 
	vi $(grep -rl "type: draft" *.md  | fzf)
}

listblog(){
	cd $BLOGDIR
	ls -t1 *.md
}
 
viewblog(){
	cd $BLOGDIR 
	while true
	do
		less $(grep -rl "type: draft" *.md | fzf)
		sleep 1
	done
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
			-v|view) 
				viewblog ; exit;;
			-n|new) 
				newblog $2; exit; shift ;;
			-e|edit) 
				editblog;exit;;
      -l|list)
				listblog;
					shift;
					exit 
					;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

