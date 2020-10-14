#!/bin/sh
scrot_path=$(ls -l ~/.cache/i3/scrots | awk '{print $9}' | awk -F . '{print $1}' | dmenu -p scrot: -l 16 -i -h 25 -x 180 -y 320 -w 800)

if [[ $scrot_path == "" ]]
then
    continue
else
    path=~/.cache/i3/scrots/
    filename=$path$scrot_path.jpg
    geography=$(hacksaw -c cf8dd2)
    shotgun -i 1110 -g $geography $filename
fi
