#!/bin/sh
$1 -T man -e man $(man -k . | dmenu -l 24 -p man: -w 1239 -x 221 -y 218 | awk '{print $1}')
