#!/bin/bash

gdrive list -q "modifiedTime<='2020-11-25T14:27:35+01:00'"
 gdrive list -q "sharedWithMe=true"
 qdate=$(date --rfc-3339=seconds | sed "s/ /T/")
