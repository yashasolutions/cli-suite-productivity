#!/bin/bash 

## Print list of task for today, with their projects and priorities
list(){
todoist l -f "today | overdue" | while read i; do \
	echo  $i | \
		awk '{ $3=$4=""; $2="\033[1;31m"$2"\033[0m"; $5="\033[1;33m"$5"\033[0m"; print $0}'; 
done
}

# for alias in bashrc
# alias todo-e='today s | fzf | cut -d" " -f1 | xargs todoist c '
simpleList(){
	todoist l -f "today | overdue" | while read i; do echo $i | awk '{ $3=$4=$2=$5=""; print $0}'; done;
}

[ -z "$1" ] && list 
[ "$1" = s ] && simpleList
