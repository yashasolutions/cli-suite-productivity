#!/bin/bash

exec >> $THOUGHTSDIR/buffer 
while IFS= read -r line; do
  printf '%s\n' "$line"
done

printf "===\n" >> $THOUGHTSDIR/buffer 
