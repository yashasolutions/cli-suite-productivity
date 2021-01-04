#!/bin/bash

#extract mp3 from mp4
ffmpeg -i $1.mp4 $1.mp3 

seewav $1.mp3 

if [ "$2" = "m" ];
then 
  ffmpeg -i $1.mp4 -vf 'movie=out.mp4 [f];[in][f] overlay=720:930 [out]' packed-`date '+%Y-%m-%d_%H-%M-%S'`.mp4
	exit;
fi

if [ "$2" = "r" ];
then 
  ffmpeg -i $1.mp4 -vf 'movie=out.mp4 [f];[in][f] overlay=1420:780 [out]' packed-`date '+%Y-%m-%d_%H-%M-%S'`.mp4
else
	echo "unknown format. Choose m or r"
fi 

