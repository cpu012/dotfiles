#!/bin/sh
image=$(ls -l ~/.cache/i3/scrots | awk '{print $9}' | awk -F . '{print $1}' | dmenu -p img: -l 12 -i -h 25 -x 180 -y 320 -w 800)
if [[ $image == "" ]]
then
    continue
else
    feh ~/.cache/i3/scrots/$image.jpg
fi
