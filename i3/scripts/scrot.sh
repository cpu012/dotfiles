#!/bin/sh

THEME=solarized

FILENAME=$(ls $1 | rofi -dmenu -theme $THEME)
echo $1

if [ -z $FILENAME ]
then
    FILENAME=$(date +%m.%d.%y-%H:%M:%S).png
fi

GEO=$(hacksaw)
shotgun -g $GEO $1/$FILENAME

