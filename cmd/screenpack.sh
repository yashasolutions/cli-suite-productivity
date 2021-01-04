#!/bin/bash

#extract mp3 from mp4
ffmpeg -i $1.mp4 $1.mp3 

if [ "$3" = "b" ]; then 
	seewav --white -c 0,0,0 $1.mp3 
else 
	# seewav -c 1,1,1 $1.mp3 # white 
	seewav $1.mp3  # green
fi

if [ "$2" = "r" ];
then 
  ffmpeg -i $1.mp4 -vf 'movie=out.mp4 [f];[in][f] overlay=1420:780 [out]' packed-`date '+%Y-%m-%d_%H-%M-%S'`.mp4
else
  ffmpeg -i $1.mp4 -vf 'movie=out.mp4 [f];[in][f] overlay=720:930 [out]' packed-`date '+%Y-%m-%d_%H-%M-%S'`.mp4
fi 

