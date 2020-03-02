#!/bin/bash

lock="/tmp/out/lock"

error=false

d=$(date +%c)

if [[ -f $lock ]]
then
	echo "Script already in use"
	exit 22
else
	touch /tmp/out/lock
fi

for files in /tmp/in/*
do
if [[ -f $files && -r $files ]]
then
        gzip -r $files
        mv $files.gz /tmp/out/
	echo "$files compressé et envoyé avec succés à $d" >> /tmp/out/logs.dat
else
	echo "$files n'a pas pu etre compressé et/ou envoyé à $d" >> /tmp/out/logs.dat
fi
done

rm /tmp/out/lock

if [ "$error"=true]
then
	exit 1
fi
