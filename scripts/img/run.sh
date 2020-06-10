#!/bin/sh
image=$(ls -l ~/data/images | awk '{print $9}' | dmenu -p img: -l 12 -i -h 25 -x 180 -y 320 -w 800)
if [[ $image == "" ]]
then
    continue
else
    feh ~/data/images/$image
fi
