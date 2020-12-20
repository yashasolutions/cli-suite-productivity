#!/bin/bash

ISSUETMP=$HOME/.local/share/gitlab/issue_templates

if [ ! -d .gitlab ]; then
	mkdir .gitlab
fi

cd .gitlab

if [ ! -d issue_templates ]; then
	mkdir issue_templates 
fi

cd issue_templates

cp $ISSUETMP/*.md . 

