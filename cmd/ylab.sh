#!/bin/bash

TITLE=$(yq -r  .title $1)
TAGS=$(yq -r .tags $1)
REPO=$(yq -r .repo $1)
DESC=$(yq -r .desc $1)

glab issue create -t "$TITLE" -l "$TAGS" -d "$DESC" --no-editor -R $REPO

