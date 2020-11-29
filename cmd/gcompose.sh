#!/bin/bash


email=$(goobook query $1 | fzf | cut -d$'\t' -f1)
echo "To: $email"
echo "Subject: $2"

gmail -t $email -s "$2" -i 

