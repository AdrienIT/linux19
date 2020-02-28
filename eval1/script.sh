#!/bin/bash
file="/tmp/in/"

DIR="/etc/tmp/out"

lock="/tmp/in/lock"

if [ -d "!$DIR" ]
then
	mkdir /tmp/out
else
	touch /tmp/in/lock
fi

if [ ! -f "$lock" ]
then
	for files in /tmp/in/* 
	do
	if [[ -f $file && -r $file ]]
	then
        	gzip -r /tmp/in/*
        	mv $files.gz /tmp/out/
        	rm /tmp/out/lock
	else
		echo "File is unable"
	fi
	done
else
	echo "Script already in use"
        exit 22
fi
