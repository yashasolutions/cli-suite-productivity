#!/bin/bash

TWEET=""
THREADITEM=0
LINESINTWEET=0
REPLYID=0
SOURCE=$1

while IFS= read -r -u9 line
do
  if [[ "$line" == ";;" ]]; then
		echo "TWWWWWWWWWWWWT"
		echo "NUMBER OF LINE IN TWEET=$LINESINTWEET"
		LINESINTWEET=0
#		printf "$TWEET\n"

		if [ $THREADITEM -eq 0 ]; then 
			REPLYID=$(t update "$TWEET" | sed -n 3p | cut -d" " -f 5 | cut -d$"\`" -f1)
		else
			REPLYID=$(t reply $REPLYID "$TWEET" | sed -n 3p | cut -d" " -f 5 | cut -d$"\`" -f1)
		fi

		THREADITEM=$(($THREADITEM + 1))
	else
		if [ $LINESINTWEET -eq 0 ]; then
			TWEET="$line"
		elif [ "$line" == ".." ]; then
			TWEET=$(printf "$TWEET\n\n")
		else
			TWEET=$(printf "$TWEET\n$line")
		fi
	  LINESINTWEET=$(($LINESINTWEET + 1))
	fi


done 9< $SOURCE 
echo "NUMBER OF BLOCKS=$THREADITEM"
