#!/bin/bash
touch /tmp/out/lock

DIR="/etc/tmp/out/"

file="/tmp/out/lock"

if [ -d "$DIR" ]
then
	if [ -f "$file" ]
	then
        	gzip -r /tmp/in/*
        	mv /tmp/in/* /tmp/out/
        	rm /tmp/out/lock
	else
        	exit 22
	fi
else
	echo "Ce dossier n'existe pas"
	exit 3
fi

