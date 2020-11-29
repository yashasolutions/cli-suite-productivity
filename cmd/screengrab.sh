#!/bin/bash

# DEST FOLDER
DEST=~/Videos/youtube

#OPTIONS
OVERWRITEFILEIFFOUND=-y 
UPPERLEFTCORNEROF=-i

# Screen in the middle 
RECDISPLAY=:1+1280,0
RESOLUTION=1920x1080

# get list of your mics with `pactl list` - and more precisely: 
# pactl list | grep -A2 'Source #' | grep 'Name: ' | cut -d" " -f2
MIC="alsa_input.usb-C-Media_Electronics_Inc._USB_Advanced_Audio_Device-00.analog-stereo"

# dynamic name - basically the topic of your recording
BASENAME=$1 
[ "$#" -eq 0 ] && BASENAME="screen"


## Start Recording
ffmpeg $OVERWRITEFILEIFFOUND \
-video_size $RESOLUTION \
-framerate 30 -f x11grab $UPPERLEFTCORNEROF $RECDISPLAY \
-f pulse -ac 2 -i $MIC \
$DEST/$BASENAME-`date '+%Y-%m-%d_%H-%M-%S'`.mp4 \
&> $DEST/$BASENAME-`date '+%Y-%m-%d_%H-%M-%S'`.log


# RESOURCES 
# - https://www.reddit.com/r/linux/comments/8n3ylp/screen_recording_in_x11_with_ffmpeg/
# - https://oz9aec.net/software/gstreamer/pulseaudio-device-names
# - https://screenrec.com/screen-recorder/linux-screen-recorders/
# - https://ffmpeg.org/ 


