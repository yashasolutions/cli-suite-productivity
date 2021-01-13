#!/bin/bash 

FISSUES=issues.yml

# TODO check if BLOGDIR is defined, else define it locally 
echousage(){
	echo "issue new <issue-name> : create a new file"
	echo "issue list : list tasks and edit "
}

reset(){
	rm $FISSUES
}

newissue(){
cat >> $FISSUES << EOF
---
repo: 
tags: 'To Do'
title: Task title
desc: "Just a task desc"
EOF

vi $FISSUES

}

editissue(){
	vi $FISSUES
}

listissue(){
	yq e ".title" $FISSUES
}

publishissue(){

DOCS=$(grep -e "---" $FISSUES | wc -l)
i=0

while [[ $i -lt $DOCS ]]; do
	TITLE=$(yq e ".title | select(di == $i)" $FISSUES )
	TAGS=$(yq e ".tags | select(di == $i)" $FISSUES )
	REPO=$(yq e ".repo | select(di == $i)" $FISSUES )
	DESC=$(yq e ".desc | select(di == $i)" $FISSUES )
	#echo  "$TITLE $TAGS $DESC $REPO"
	glab issue create -t "$TITLE" -l "$TAGS" -d "$DESC" --no-editor -R $REPO
	echo "Created Task : $TITLE"

	i=$(($i + 1))
done

#echo  "$DOCS $TITLE $TAGS $DESC $REPO"
#glab issue create -t "$TITLE" -l "$TAGS" -d "$DESC" --no-editor -R $REPO

}
 
while [[ "$#" -gt 0 ]]; do
    case $1 in
			-r|reset)
				reset;exit;;
			-p|publish) 
				publishissue ; exit;;
			-n|new) 
				newissue $2; exit; shift ;;
			-e|edit) 
				editissue;exit;;
      -l|list)
				listissue;
					shift;
					exit 
					;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done
