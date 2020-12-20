#!/bin/bash

INSTALL_DIR=".local/bin"

chmod +x cmd/*.sh
for i in cmd/*.sh
do
	chmod +x $i;
	newname=$(echo $i | cut -d"/" -f2 | cut -d"." -f1) 
	cp $i $HOME/$INSTALL_DIR/$newname 
done

SHARE_DIR=".local/share/"

cp -r share/* $HOME/$SHARE_DIR
