#!/bin/bash

## install t from : https://github.com/sferik/t
## install toot from : https://github.com/ihabunek/toot

[ "$#" -eq 0 ] && echo "No tweet"
[ "$#" -eq 0 ] && exit 1
t update "$1"
toot post "$1"
